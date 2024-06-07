import router from '@ohos.router'
import { ChartReq,ErrorInfo,ChartResp,Request } from 'SseCore'
let RequestMap = {
  "ChartReq": new ChartReq(),
} as Record<string, Request>

@Entry
@Component
struct ChartOneResponse {
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
      onSuccess: (resp: ChartResp) => {
        let date = new Date()
        let endTime = date.getTime()
        console.info('cost ' + (endTime - beginTime))
        this.message = resp.toString();
        console.info("市场交易时间：" + resp.systemDatetime)
        if (resp.tradeDates) {
          console.info("日期列表：" + resp.tradeDates.convertToArray()[0])
        }
        console.info("总点数：" + resp.tickCount)
        console.info("交易时间段：" + resp.timezones)
        if (resp.referencePrices){
          resp.referencePrices.forEach((key, value) => {
            console.info("价格：" + key)
            console.info("时间：" + value)
          })
        }
        if (resp.OHLCItems) {
          for (let i = 0; i < resp.OHLCItems.length; i++) {
            console.info("量比：" + resp.OHLCItems.convertToArray()[i].volumeRatio)
          }

        }
      },
      onFail: (err: ErrorInfo) => {
        console.info("ChartOneRequest error:" + err.getMsg());
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