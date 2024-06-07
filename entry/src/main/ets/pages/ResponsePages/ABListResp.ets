import router from '@ohos.router'
import { ABListReq,ErrorInfo,ABListResp,Request } from 'SseCore'
let RequestMap = {
  "ABListReq": new ABListReq(),
} as Record<string, Request>
@Entry
@Component
struct ABListResponse {
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
      onSuccess: (resp: ABListResp) => {   // 快照响应
        let date = new Date()
        let endTime = date.getTime()
        console.info('cost ' + (endTime - beginTime))
        this.message = resp.toString();   // 输出response到手机屏幕  string类型
        if (resp.items) {
          console.info("A股行情时间：" + resp.items[0].dateTimeA)
          console.info("A股代码：" + resp.items[0].codeA)
          console.info("A股名称：" + resp.items[0].nameA)
          console.info("A股市场：" + resp.items[0].marketA)
          console.info("A股次类别：" + resp.items[0].subtypeA)
          console.info("A股最新价：" + resp.items[0].lastPriceA)
          console.info("A股前收盘价：" + resp.items[0].preClosePriceA)
          console.info("A股涨跌幅：" + resp.items[0].changeRateA)
          console.info("B股行情时间：" + resp.items[0].dateTimeB)
          console.info("B股代码：" + resp.items[0].codeB)
        }
      },
      onFail: (err: ErrorInfo) => {
        console.info("ABListResponse error:" + err.getMsg());
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