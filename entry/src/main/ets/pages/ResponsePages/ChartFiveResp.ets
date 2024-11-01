import router from '@ohos.router'
import { ChartReq,ErrorInfo,ChartResp,Request, TradeDateItem, OHLCItem } from 'SseCore'
let RequestMap = {
  "ChartReq": new ChartReq(),
} as Record<string, Request>

@Entry
@Component
struct ChartFiveResponse {
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
      onSuccess: (resp: ChartResp) => {   // 快照响应
        let date = new Date()
        let endTime = date.getTime()
        console.info('cost ' + (endTime - beginTime))
        // this.message = resp.toString();   // 输出response到手机屏幕  string类型
        console.info("市场交易时间：" + resp.systemDatetime)
        if (resp.tradeDates) {
          let str = resp.tradeDates
          for (let i = 0; i < str.length; i++) {
           console.info(`日期列表:${str.convertToArray()[i]}`)
          }
        }
        console.info("连续竞价总点数：" + resp.tickCount)
        console.info("盘后交易总点数：" + resp.afTickCount)
        console.info("交易时间段：" + resp.timezones)
        if (resp.referencePrices){
          resp.referencePrices.forEach((key:string, value:string) => {
            console.info("价格：" + key)
            console.info("时间：" + value)
          })
        }
        if (resp.OHLCItems) {
          for (let i = 0; i < resp.OHLCItems.length; i++) {
            let str:OHLCItem = resp.OHLCItems.convertToArray()[i]
            console.info("交易时间：" + str.datetime)

          }
        }
      },
      onFail: (err: ErrorInfo) => {
        console.info("ChartFiveRequest error:" + err.getMsg());
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