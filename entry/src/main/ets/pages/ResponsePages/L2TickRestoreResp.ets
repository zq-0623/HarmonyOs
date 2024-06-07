import router from '@ohos.router'
import { L2TickRestoreReq,L2TickRestoreResp,ErrorInfo,Request} from 'SseCore'
let RequestMap = {
  "L2TickRestoreReq": new L2TickRestoreReq(),
} as Record<string, Request>
@Entry
@Component
struct L2TickRestoreResponse {
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
      onSuccess: (resp: L2TickRestoreResp) => {
        let date = new Date()
        let endTime = date.getTime()
        console.info('cost ' + (endTime - beginTime))
        this.message = resp.toString();
        if (resp.items){
          console.log("起始引索:" + resp.startIndex)
          console.log("结束引索:" + resp.endIndex)
          for (let i = 0; i < resp.items.length; i++) {
            let str = resp.items[i]
            console.info(`交易时间:${str.transactionTime}买卖标识:${str.transactionStatus}==交易量:${str.singleVolume}==成交价格:${str.transactionPrice}==索引:${str.index}==买委托序号:${str.bn}==卖委托序号:${str.on}==买委托量:${str.bq}==卖委托量:${str.oq}==买方剩余量:${str.br}==卖方剩余量:${str.sr}`)
          }
        }
        else {
          console.error("接口返回数据为空！！！")
        }
      },
      onFail: (err: ErrorInfo) => {
        console.error("L2TickRestoreRequest error:" + err.getMsg());
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