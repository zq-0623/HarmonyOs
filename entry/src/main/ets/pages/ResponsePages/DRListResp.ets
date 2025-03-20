import router from '@ohos.router'
import { DRListReq,ErrorInfo,DRListResp,Request, DRListItem } from 'SseCore'
let RequestMap = {
  "DRListReq": new DRListReq(),
} as Record<string, Request>
@Entry
@Component
struct DRListResponse {
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
      onSuccess: (resp: DRListResp) => {
        let date = new Date()
        let endTime = date.getTime()
        console.info('cost ' + (endTime - beginTime))
        this.message = resp.toString();   // 输出response到手机屏幕  string类型
       if(resp.items){
         for (let i = 0; i < resp.items.length; i++) {
           let str:DRListItem = resp.items[i]
           console.info(`代码：${str.code}==名称：${str.name}==次类：：${str.subtype}==最新价：${str.lastPrice}==前收盘价：${str.preClosePrice}==涨跌幅：${str.changeRate}==涨跌：${str.change}==行情时间：${str.datetime}==基础证券代码：${str.baseStockCode}==基础证券名称：${str.baseStockName}==基础证券最新价：${str.baseLastPrice}==基础证券前收盘价：${str.basePreClosePrice}==基础证券涨幅：${str.baseChangeRate}==基础证券涨跌：${str.baseChange}==基础证券次类别：${str.baseSubtype}==基础证券行情时间：${str.baseDatetime}==溢价率：${str.premiumRate}`)
         }
       }
      },
      onFail: (err: ErrorInfo) => {
        console.info("AHListRequest error:" + err.getMsg());
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