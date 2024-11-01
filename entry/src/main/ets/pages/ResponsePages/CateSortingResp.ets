import router from '@ohos.router'
import { CateSortingReq,ErrorInfo,CateSortingResp,Request, QuoteItem, AddValueModel } from 'SseCore'
let RequestMap = {
  "CateSortingReq": new CateSortingReq(),
} as Record<string, Request>
@Entry
@Component
struct CateSortingResponse {
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
    this.request.send({
      onSuccess: (resp: CateSortingResp) => {
        console.log("总页数===>" + resp.totalPage)
        console.log("总条数===>" + resp.totalNumber)
        if (resp.list && resp.list.length > 0) {
          for (let i = 0; i < resp.list.length;i++){
            let str:QuoteItem = resp.list.convertToArray()[i]
            console.info(`交易状态:${str.status}==代码:${str.id}==名称:${str.name}==最低价:${str.lowPrice}==收益:${str.receipts}==市场:${str.market}==子类别:${str.subtype}==交易时间:${str.datetime}==最新价:${str.lastPrice}==最高价:${str.highPrice}==昨收价:${str.preClosePrice}==昨结价(期权期货):${str.presetPrice}==涨跌:${str.change}==涨跌幅:${str.changeRate}==涨跌比率:${str.changeRate}==总量:${str.volume}==当前成交量:${str.nowVolume}==换手率:${str.turnoverRate}==前5日涨跌幅:${str.changeRate5}==前3日涨跌幅:${str.changeRate3}==前60日涨跌幅:${str.changeRate60}==昨日涨跌幅:${str.yesterdayChangeRate}`)
          }
        }
        if (resp.addValueModel && resp.addValueModel.length > 0) {
          for(let j = 0; j < resp.addValueModel.length; j++){
            let str1:AddValueModel = resp.addValueModel.convertToArray()[j]
            console.info(`证券代码:${str1.code}==当前快照日期:${str1.date}==当前快照时间:${str1.time}==超大单主动买入成交量:${str1.ultraLargeBuyVolume}==超大单主动卖出成交量:${str1.ultraLargeSellVolume}==超大单主动买入成交额:${str1.ultraLargeBuyAmount}`)
          }

        }
      },
      onFail: (err: ErrorInfo) => {
        console.info("CateSortingRequest error:" + err.getMsg());
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