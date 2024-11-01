import router from '@ohos.router'
import { HistoryChartReq,ErrorInfo,HistoryChartResp,Request, OHLCItem } from 'SseCore'
let RequestMap = {
  "HistoryChartReq": new HistoryChartReq(),
} as Record<string, Request>
@Entry
@Component
struct HistoryChartResponse {
  @State message: string = 'Hello World'
  @State myParams: Object = router.getParams();
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
      onSuccess: (resp: HistoryChartResp) => {
        let date = new Date()
        let endTime = date.getTime()
        console.info('cost ' + (endTime - beginTime))
        this.message = resp.toString();   // 输出response到手机屏幕  string类型
        console.info("总点数：" + resp.tickCount)
        if (resp.timezone){
          console.info("交易时间段：" + resp.timezone)
        }
        if (resp.OHLCItems) {
          for (let i = 0; i < resp.OHLCItems.length; i++) {
           let str:OHLCItem = resp.OHLCItems.convertToArray()[i]
            console.info(`交易时间:${str.datetime}==开盘价:${str.openPrice}==最高价:${str.highPrice}==最低价:${str.lowPrice}==收盘价:${str.closePrice}==交易量:${str.tradeVolume}==均价:${str.averagePrice}==参考价/昨收价:${str.referencePrice}==成交额:${str.amount}==基金净值:${str.IOPV}`)
          }
        }
        else {
          console.warn("💧💧💧接口返回数据为空💧💧💧")
        }
      },
      onFail: (err: ErrorInfo) => {
        console.info("HistoryChartRequest error:" + err.getMsg());
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