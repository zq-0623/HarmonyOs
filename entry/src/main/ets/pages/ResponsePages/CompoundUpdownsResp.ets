import router from '@ohos.router'
import { CompoundUpdownsReq,ErrorInfo,CompoundUpdownsResp,Request, UpdownsItem } from 'SseCore'
let RequestMap = {
  "CompoundUpdownsReq": new CompoundUpdownsReq(),
} as Record<string, Request>
@Entry
@Component
struct CompoundUpdownsResponse {
  @State message: string = 'Hello World'
  @State myParams: Object = router.getParams();
  @State autoRefresh: boolean = true; // 开关控制是否进行定时请求
  private title: string = '';
  private request: Request = new Request();
  private param: Record<string, Object> = {};
  build() {
    Column() {
      Text(this.title).padding(5).margin({ bottom: 5 }).fontSize(20).border({ width: 2 }).width('90%')
      Scroll() {
        Text(this.message).width('90%').margin({ left: 15, right: 15, bottom: 5 }).backgroundColor(0xFF56CA6A)
          .padding({ left: 10, right: 10, top: 5, bottom: 25 })
      }
    }.padding({ top: 20 })
  }
  private intervalId?: number
  private sendReq(){
    for (let keyValue of Object.entries(this.param)) {
      Reflect.set(this.request, keyValue[0], keyValue[1]);
    }
    let date = new Date()
    let beginTime = date.getTime()
    this.request.send({
      onSuccess: (resp: CompoundUpdownsResp) => {   // 快照响应
        let date = new Date()
        let endTime = date.getTime()
        console.info('cost ' + (endTime - beginTime))
        this.message = resp.toString();   // 输出response到手机屏幕  string类型
        if (resp.items) {
          for (let i = 0; i < resp.items.length; i++) {
            let str:UpdownsItem = resp.items.convertToArray()[i]
            console.info(`计算时间：${str.dateTime}==上涨家数：${str.riseCount}==下跌家数：${str.fallCount}==平盘家数：${str.flatCount}==停牌家数：${str.stopCount}==涨停家数：${str.riseLimitCount}==跌停家数：${str.fallLimitCount}==涨跌幅区间：${str.riseFallRange}==一字涨停家数：${str.oneRiseLimitCount}==自然涨停家数：${str.natureRiseFallCount}==五日平均涨停家数：${str.fiveAverageLimitCount}`)
          }
        }
      },
      onFail: (err: ErrorInfo) => {
        console.info("CompoundUpdownsResponse error:" + err.getMsg());
      } });
  }
  private startAutoRefresh() {
    this.stopAutoRefresh(); // 先清除可能存在的定时器
    this.intervalId = setInterval(() => {
      if (this.autoRefresh) {
        this.sendReq();
      }
    }, 3000);
  }

  private stopAutoRefresh() {
    if (this.intervalId) {
      clearInterval(this.intervalId);
      this.intervalId = undefined;
    }
  }

  async aboutToAppear() {
    let recordParam = this.myParams as Record<string, Object>;
    this.title = recordParam['title'] as string;
    this.param = recordParam['param'] as Record<string, Object>;
    this.request = RequestMap[recordParam['request'] as string];

    this.sendReq(); // 立即请求一次
    if (this.autoRefresh) {
      this.startAutoRefresh();
    }
  }

  aboutToDisappear() {
    this.stopAutoRefresh();
  }
}