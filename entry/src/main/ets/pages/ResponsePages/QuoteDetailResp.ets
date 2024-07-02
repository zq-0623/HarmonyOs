import router from '@ohos.router'
import { QuoteDetailReq,QuoteResp,ErrorInfo,QuoteItem,Request } from 'SseCore'
let RequestMap = {
  "QuoteDetailReq": new QuoteDetailReq(),
} as Record<string, Request>
@Entry
@Component
struct QuoteDetailResponse {
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
    this.request.send({
      onSuccess: (resp: QuoteResp) => {   // 快照响应
        this.message = resp.toString();   // 输出response到手机屏幕  string类型
        let item: QuoteItem = resp.quoteItems![0]
        let count = item.buyPrices?.length
        console.info('count :' + count)
        if (resp.quoteItems) {
          for (let i = 0; i < resp.quoteItems.length; i++){
            let str = resp.quoteItems.convertToArray()[i]
            console.info(`股票状态:${str.status}代码:${str.id}=股票名称:${str.name}=交易时间:${str.datetime}=拼音:${str.pinyin}=市场:${str.market}=子类别:${str.subtype}=最新价:${str.lastPrice}=最高价:${str.highPrice}=最低价:${str.lowPrice}=今开价:${str.openPrice}=昨收价:${str.preClosePrice}=涨跌比率:${str.changeRate}=总量:${str.volume}=当前成交量:${str.nowVolume}=换手率:${str.turnoverRate}=涨跌幅限制类型:${str.upDownLimitType}=跌停价:${str.limitDown}=涨停价:${str.limitUP}=均价:${str.averageValue}=涨跌:${str.change}=成交金额:${str.amount}=量比:${str.volumeRatio}=买一价:${str.buyPrice}=卖一价:${str.sellPrice}=外盘量:${str.buyVolume}=内盘量:${str.sellVolume}=总值:${str.totalValue}=总值只有港股有值:${str.HKTotalValue}=流值:${str.flowValue}=净资产:${str.netAsset}=PE(市盈):${str.pe}=静态市盈率:${str.pe2}=PB(市净率):${str.pb}=总股本:${str.capitalization}=流通股:${str.circulatingShares}=五档/十档买价:${str.buyPrices}=五档/十档卖价:${str.sellPrices}=五档/十档委托总笔数（买）:${str.buySingleVolumes}=五档/十档委托总笔数（卖）:${str.sellSingleVolumes}=五档/十档买量:${str.buyVolumes}=五档/十档卖量:${str.sellVolumes}=振幅比率:${str.amplitudeRate}=收益:${str.receipts}=上涨家数:${str.upCount}=平盘家数:${str.sameCount}=下跌家数:${str.downCount}=期权类型:${str.optionType}=涨跌幅:${str.changeRate}=涨跌标识:${str.upDownFlag}=限价买数量上限:${str.buyQtyUpperLimit}=限价卖数量上限:${str.sellQtyUpperLimit}=市价买数量上限:${str.marketBuyQtyUpperLimit}=市价卖数量上限:${str.marketSellQtyUpperLimit}=盘后成交量:${str.afterHoursVolume}=盘后成交额:${str.afterHoursAmount}=盘后成交笔数:${str.afterHoursTransactionNumber}=盘后撤单买笔数:${str.afterHoursWithdrawBuyCount}=盘后撤单买数量:${str.afterHoursWithdrawBuyVolume}=盘后撤单卖笔数:${str.afterHoursWithdrawSellCount}=盘后撤单卖数量:${str.afterHoursWithdrawSellVolume}=盘后委托买入总量:${str.afterHoursBuyVolume}=盘后委托卖出总量:${str.afterHoursSellVolume}==前3日涨跌幅:${str.changeRate3}==前60日涨跌幅:${str.changeRate60}==昨日涨跌幅:${str.yesterdayChangeRate}==申购笔数wbn:${str.buy_cancel_count}==申购数量wba:${str.buy_cancel_num}==申购金额wbm:${str.buy_cancel_amount}==赎回笔数wsn:${str.sell_cancel_count}==赎回数量wsa:${str.sell_cancel_num}==赎回金额wsm:${str.sell_cancel_amount}`);
            if (str.buyBrokerInfos){      // 买经济席位列表   只有港股才有
              for (let element of str.buyBrokerInfos) {
                console.info("ID:" + element.id);
                console.info("证券名称:" + element.corp);
                console.info("证券全名:" + element.corportion);
                console.info("买卖方向:" + element.state);  // 0卖1买
              }
            }
            if (str.sellBrokerInfos){      // 卖经济席位列表   只有港股才有
              for (let element of str.sellBrokerInfos) {
                console.info("ID:" + element.id);
                console.info("证券名称:" + element.corp);
                console.info("证券全名:" + element.corportion);
                console.info("买卖方向:" + element.state);  // 0卖1买
              }
            }
            if (str.buyQtys) {        // 买队列列表
              for (let element of str.buyQtys) {
                let ids = element.ids;
                let qyts = element.quantities
                console.info("ID:" + JSON.stringify(ids))
                console.info("买量:" + JSON.stringify(qyts))
              }
            }
            if (str.sellQtys) {     // 卖队列列表
              for (let element of str.sellQtys) {
                let ids = element.ids;
                let qyts = element.quantities
                console.info("ID:" + JSON.stringify(ids))
                console.info("卖量:" + JSON.stringify(qyts))
              }
            }
          }
          if (resp.addValueModels) {
            for (let j = 0; j < resp.addValueModels.length; j++) {
              let str = resp.addValueModels.convertToArray()[j]
              console.info(`证券代码:${str.code}=超大单主动买入成交量:${str.ultraLargeBuyVolume}=超大单主动卖出成交量:${str.ultraLargeSellVolume}=超大单主动卖出成交量:${str.ultraLargeSellVolume}=超大单主动买入成交额:${str.ultraLargeBuyAmount}=超大单主动卖出成交额:${str.ultraLargeSellAmount}=大单主动买入成交量:${str.largeBuyVolume}`)
            }
          }
        }
      },
      onFail: (err: ErrorInfo) => {
        console.info("QuoteDetailRequest error:" + err.getMsg());
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