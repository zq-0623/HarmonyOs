import router from '@ohos.router'
import { L2TickReq ,ErrorInfo,L2TickResp,Request} from 'SseCore'
let RequestMap = {
  "L2TickReq": new L2TickReq(),
} as Record<string, Request>
@Entry
@Component
struct L2TickResponse {
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
      onSuccess: (resp: L2TickResp) => {
        let date = new Date()
        let endTime = date.getTime()
        console.info('cost ' + (endTime - beginTime))
        this.message = resp.toString();
        if (resp.tickItems && resp.tickItems.length > 0) {
          for (let i = 0; i < resp.tickItems.length; i++) {
            let str = resp.tickItems.convertToArray()[i]
            console.info(`成交笔数：${str.transactionNum}==成交时间：${str.transactionTime}==成交价格：${str.transactionPrice}==买卖标识：${str.transactionStatus}==交易量：${str.singleVolume}==索引范围的最小值：${str.minValueOfIndexRange}==索引范围的最大值：${str.maxValueOfIndexRange}`)
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