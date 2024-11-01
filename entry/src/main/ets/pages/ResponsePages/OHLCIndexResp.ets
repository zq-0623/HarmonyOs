import router from '@ohos.router'
import { OHLCIndexReq,ErrorInfo,OHLCIndexResp,Request } from 'SseCore'
let RequestMap = {
  "OHLCIndexReq": new OHLCIndexReq(),
} as Record<string, Request>
@Entry
@Component
struct OHLCIndexResponse {
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
      onSuccess: (resp: OHLCIndexResp) => {
        let date = new Date()
        let endTime = date.getTime()
        // console.info('cost ' + (endTime - beginTime))
        this.message = resp.toString();
        if (resp.items && resp.items.length > 0) {
          for (let i = 0; i < resp.items.length; i++) {
            let str = resp.items.convertToArray()[i]
            console.info(`时间：${str.datetime}==大单净差：${str.ddx}==主力动向：${str.ddy}==涨跌动因：${str.ddz}==大单差分：${str.bbd}==单数比：${str.ratioBS}==超大单净流入：${str.largeMoneyInflow}==大单净流入：${str.bigMoneyInflow}==中单净流入：${str.midMoneyInflow}==小单净流入：${str.smallMoneyInflow}==超大单成交单数：${str.largeTradeNum}==大单成交单数：${str.bigTradeNum}==中单成交单数：${str.midTradeNum}==小单成交单数：${str.smallTradeNum}==大单净量：${str.bigNetVolume}==主力资金流入(板块指数返回)：${str.mainforceMoneyInflow}==主力资金流出(板块指数返回)：${str.mainforceMoneyOutflow}`)
          }
        }
      },
      onFail: (err: ErrorInfo) => {
        console.info("OHLCIndexRequest error:" + err.getMsg());
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