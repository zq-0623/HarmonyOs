import router from '@ohos.router'
import { ErrorInfo,L2TickDetailResp,L2TickDetailReq,Request } from 'SseCore'
let RequestMap = {
  "L2TickDetailReq": new L2TickDetailReq(),
} as Record<string, Request>
@Entry
@Component
struct L2TickDetailResponse {
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
      onSuccess: (resp: L2TickDetailResp) => {
        let date = new Date()
        let endTime = date.getTime()
        console.info('cost ' + (endTime - beginTime))
        this.message = resp.toString();
        if (resp.tickDetailItems && resp.tickDetailItems.length > 0) {
          console.info('headersParams:' + resp.headerParams)
          for (let i = 0; i < resp.tickDetailItems.length; i++) {
            let str = resp.tickDetailItems.convertToArray()[i]
            console.info(`买卖标识:${str.transactionStatus}==交易时间:${str.transactionTime}==交易量:${str.singleVolume}==成交价格:${str.transactionPrice}`)
          }
        }
      },
      onFail: (err: ErrorInfo) => {
        console.info("AHListRequest error:" + err.getMsg());
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