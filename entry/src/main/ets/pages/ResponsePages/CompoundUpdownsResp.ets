import router from '@ohos.router'
import { CompoundUpdownsReq,ErrorInfo,CompoundUpdownsResp,Request } from 'SseCore'
let RequestMap = {
  "CompoundUpdownsReq": new CompoundUpdownsReq(),
} as Record<string, Request>
@Entry
@Component
struct CompoundUpdownsResponse {
  @State message: string = 'Hello World'
  @State myParams: Object = router.getParams();
  private title: string = '';
  private request: Request = new Request();
  private param: Record<string, Object> = {};
  build() {
    Column() {
      Text(this.title)
        .padding(5)
        .margin({ bottom: 5 })
        .fontSize(20)
        .border({ width: 2 })
        .width('90%')
      Scroll() {
        Text(this.message)
          .width('90%')
          .margin({ left: 15, right: 15, bottom: 5 })
          .backgroundColor(0xFF56CA6A)
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
          console.info("计算时间：" + resp.items.convertToArray()[0].dateTime)
          console.info("上涨家数：" + resp.items.convertToArray()[0].riseCount)
          console.info("下跌家数：" + resp.items.convertToArray()[0].fallCount)
          console.info("平盘家数：" + resp.items.convertToArray()[0].flatCount)
          console.info("停牌家数：" + resp.items.convertToArray()[0].stopCount)
          console.info("涨停家数：" + resp.items.convertToArray()[0].riseLimitCount)
          console.info("跌停家数：" + resp.items.convertToArray()[0].fallLimitCount)
          console.info("涨跌幅区间：" + resp.items.convertToArray()[0].riseFallRange)
          console.info("一字涨停家数：" + resp.items.convertToArray()[0].oneRiseLimitCount)
          console.info("自然涨停家数：" + resp.items.convertToArray()[0].natureRiseFallCount)
          console.info("五日平均涨停家数：" + resp.items.convertToArray()[0].fiveAverageLimitCount)
        }
      },
      onFail: (err: ErrorInfo) => {
        console.info("CompoundUpdownsResponse error:" + err.getMsg());
      } });
  }
  async aboutToAppear() {
    let recordParam = this.myParams as Record<string, Object>;
    this.title = recordParam['title'] as string;
    this.param = recordParam['param'] as Record<string, Object>;
    this.request = RequestMap[recordParam['request'] as string];
    this.sendReq()
  }
  aboutToDisappear(){
    clearInterval(this.intervalId)
  }
}