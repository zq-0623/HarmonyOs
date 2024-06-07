import router from '@ohos.router'
import { ChartIndexReq,ErrorInfo,ChartIndexResp,Request } from 'SseCore'
let RequestMap = {
  "ChartIndexReq": new ChartIndexReq(),
} as Record<string, Request>
@Entry
@Component
struct ChartIndexResponse {
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
      onSuccess: (resp: ChartIndexResp) => {   // 快照响应
        let date = new Date()
        let endTime = date.getTime()
        console.info('cost ' + (endTime - beginTime))
        this.message = resp.toString();   // 输出response到手机屏幕  string类型
        if (resp.items && resp.items.length >0) {
          console.info("开始下标：" + resp.beginIndex)
          console.info("结束下标：" + resp.endIndex)
          for (let i = 0; i < resp.items.length; i++) {
            console.info("时间：" + resp.items.convertToArray()[i].datetime)
            console.info("大单净差：" + resp.items.convertToArray()[i].ddx)
            console.info("主力动向：" + resp.items.convertToArray()[i].ddy)
            console.info("涨跌动因：" + resp.items.convertToArray()[i].ddz)
            console.info("大单差分：" + resp.items.convertToArray()[i].bbd)
            console.info("单数比：" + resp.items.convertToArray()[i].ratioBS)
            console.info("超大单净流入：" + resp.items.convertToArray()[i].largeMoneyInflow)
            console.info("大单净流入：" + resp.items.convertToArray()[i].bigMoneyInflow)
            console.info("中单净流入：" + resp.items.convertToArray()[i].midMoneyInflow)
            console.info("小单净流入：" + resp.items.convertToArray()[i].smallMoneyInflow)
            console.info("超大单成交单数：" + resp.items.convertToArray()[i].largeTradeNum)
            console.info("大单成交单数：" + resp.items.convertToArray()[i].bigTradeNum)
            console.info("中单成交单数：" + resp.items.convertToArray()[i].midTradeNum)
            console.info("小单成交单数：" + resp.items.convertToArray()[i].smallTradeNum)
            console.info("大单净量：" + resp.items.convertToArray()[i].bigNetVolume)
            console.info("主力资金流入(板块指数返回)：" + resp.items.convertToArray()[i].mainforceMoneyInflow)
            console.info("主力资金流出(板块指数返回)：" + resp.items.convertToArray()[i].mainforceMoneyOutflow)
          }
        }
      },
      onFail: (err: ErrorInfo) => {
        console.info("ChartIndexRequest error:" + err.getMsg());
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