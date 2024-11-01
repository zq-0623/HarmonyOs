import router from '@ohos.router'
import { ABListReq,ErrorInfo,ABListResp,Request, ABLinkItem, ABListItem } from 'SseCore'
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
      onSuccess: (resp: ABListResp) => {   // 快照响应
        let date = new Date()
        let endTime = date.getTime()
        console.info('cost ' + (endTime - beginTime))
        this.message = resp.toString();   // 输出response到手机屏幕  string类型
        if (resp.items) {
          for (let i = 0; i < resp.items.length; i++) {
            let str:ABListItem = resp.items[i]
            console.info(`A股行情时间:${str.dateTimeA}==A股代码:${str.codeA}==A股名称:${str.nameA}==A股市场:${str.marketA}==A股次类别:${str.subtypeA}==A股最新价:${str.lastPriceA}==A股前收盘价:${str.preClosePriceA}==A股涨跌幅:${str.changeRateA}==B股行情时间:${str.dateTimeB}==B股代码:${str.codeB}==B股名称:${str.nameB}==B股市场别:${str.marketB}==B股类别:${str.subtypeB}==B股最新价:${str.lastPriceB}==B股前收盘价:${str.preClosePriceB}==B股涨幅:${str.changeRateB}==AB溢价率:${str.premiumRateAB}==BA溢价率:${str.premiumRateBA}==B股涨跌:${str.changeB}==A股涨跌:${str.changeA}`)
          }
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