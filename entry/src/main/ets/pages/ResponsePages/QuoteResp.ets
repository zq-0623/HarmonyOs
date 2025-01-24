import router from '@ohos.router'
import { QuoteResp,ErrorInfo,QuoteReq,Request } from 'SseCore'
let RequestMap = {
  "QuoteReq": new QuoteReq(),
} as Record<string, Request>

@Entry
@Component
struct QuoteResponse {
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
      onSuccess: (resp: QuoteResp) => {
        let date = new Date()
        let endTime = date.getTime()
        console.info('cost ' + (endTime - beginTime))
        this.message = resp.toString();   // 输出response到手机屏幕  string类型
        if (resp.quoteItems && resp.addValueModels) {
          for (let i = 0; i < resp.quoteItems.length; i++) {
            // let str = resp.quoteItems.convertToArray()[i]
            // console.info(`股票状态:${str.status}代码:${str.id}=股票名称:${str.name}=换手率:${str.turnoverRate}=前5日换手率:${str.turnoverRate5}=前10日换手率:${str.turnoverRate10}=前20日换手率:${str.turnoverRate20}=交易时间:${str.datetime}=拼音:${str.pinyin}=市场:${str.market}=子类别:${str.subtype}=最新价:${str.lastPrice}=最高价:${str.highPrice}=最低价:${str.lowPrice}=今开价:${str.openPrice}=昨收价:${str.preClosePrice}=涨跌比率:${str.changeRate}=总量:${str.volume}=当前成交量:${str.nowVolume}=换手率:${str.turnoverRate}=涨跌幅限制类型:${str.upDownLimitType}=跌停价:${str.limitDown}=涨停价:${str.limitUP}=均价:${str.averageValue}=涨跌:${str.change}=成交金额:${str.amount}=量比:${str.volumeRatio}=买一价:${str.buyPrice}=卖一价:${str.sellPrice}=外盘量:${str.buyVolume}=内盘量:${str.sellVolume}=总值:${str.totalValue}=总值只有港股有值:${str.HKTotalValue}=流值:${str.flowValue}=净资产:${str.netAsset}=PE(市盈):${str.pe}=静态市盈率:${str.pe2}=PB(市净率):${str.pb}=总股本:${str.capitalization}=流通股:${str.circulatingShares}=五档/十档买价:${str.buyPrices}=五档/十档卖价:${str.sellPrices}=五档/十档委托总笔数（买）:${str.buySingleVolumes}=五档/十档委托总笔数（卖）:${str.sellSingleVolumes}=五档/十档买量:${str.buyVolumes}=五档/十档卖量:${str.sellVolumes}=振幅比率:${str.amplitudeRate}=收益:${str.receipts}=上涨家数:${str.upCount}=平盘家数:${str.sameCount}=下跌家数:${str.downCount}=期权类型:${str.optionType}=涨跌幅:${str.changeRate}=涨跌标识:${str.upDownFlag}=限价买数量上限:${str.buyQtyUpperLimit}=限价卖数量上限:${str.sellQtyUpperLimit}=市价买数量上限:${str.marketBuyQtyUpperLimit}=市价卖数量上限:${str.marketSellQtyUpperLimit}=盘后成交量:${str.afterHoursVolume}=盘后成交额:${str.afterHoursAmount}=盘后成交笔数:${str.afterHoursTransactionNumber}=盘后撤单买笔数:${str.afterHoursWithdrawBuyCount}=盘后撤单买数量:${str.afterHoursWithdrawBuyVolume}=盘后撤单卖笔数:${str.afterHoursWithdrawSellCount}=盘后撤单卖数量:${str.afterHoursWithdrawSellVolume}=盘后委托买入总量:${str.afterHoursBuyVolume}=盘后委托卖出总量:${str.afterHoursSellVolume}==前3日涨跌幅:${str.changeRate3}==前60日涨跌幅:${str.changeRate60}==昨日涨跌幅:${str.yesterdayChangeRate}==申购笔数wbn:${str.buy_cancel_count}==申购数量wba:${str.buy_cancel_num}==申购金额wbm:${str.buy_cancel_amount}==赎回笔数wsn:${str.sell_cancel_count}==赎回数量wsa:${str.sell_cancel_num}==赎回金额wsm:${str.sell_cancel_amount}==总卖量:${str.sumSell}==总买量:${str.sumBuy}==均买价:${str.averageBuy}==均卖价:${str.averageSell}==前3日涨跌幅:${str.changeRate3}==前60日涨跌幅:${str.changeRate60}==昨日涨跌幅:${str.yesterdayChangeRate}==沪深京指数换手率:${str.indexTurnoverRate}==沪深京指数总市值:${str.indexTotalValue}==沪深京指数动态市盈率:${str.indexTTM}==沪深京指数市净率:${str.indexPB}==沪深市场ETF基金折价率（溢价率）:${str.premiumDiscountRates}==ETF申购笔数:${str.buy_cancel_count}==ETF申购数量:${str.buy_cancel_num}==ETF申购金额:${str.buy_cancel_amount}==ETF赎回笔数:${str.sell_cancel_count}==ETF赎回数量:${str.sell_cancel_num}==ETF赎回金额:${str.sell_cancel_amount}`);
            // console.info("股票状态：" + resp.quoteItems.convertToArray()[i].status)
            // console.info("代码：" + resp.quoteItems.convertToArray()[i].id)
            // console.info("代码：" + resp.quoteItems.convertToArray()[i].id)
            // console.info("股票名称：" + resp.quoteItems.convertToArray()[i].name)
            // console.info("交易时间：" + resp.quoteItems.convertToArray()[i].datetime)
            // console.info("拼音：" + resp.quoteItems.convertToArray()[i].pinyin)
            // console.info("市场：" + resp.quoteItems.convertToArray()[i].market)
            // console.info("子类别：" + resp.quoteItems.convertToArray()[i].subtype)
            // console.info("最新价：" + resp.quoteItems.convertToArray()[i].lastPrice)
            // console.info("最高价：" + resp.quoteItems.convertToArray()[i].highPrice)
            // console.info("最低价：" + resp.quoteItems.convertToArray()[i].lowPrice)
            // console.info("今开价：" + resp.quoteItems.convertToArray()[i].openPrice)
            // console.info("昨收价：" + resp.quoteItems.convertToArray()[i].preClosePrice)
            // console.info("前结算价：" + resp.quoteItems.convertToArray()[i].presetPrice)
            // console.info("涨跌比率：" + resp.quoteItems.convertToArray()[i].changeRate)
            // console.info("总量：" + resp.quoteItems.convertToArray()[i].volume)
            // console.info("当前成交量：" + resp.quoteItems.convertToArray()[i].nowVolume)
            // console.info("换手率：" + resp.quoteItems.convertToArray()[i].turnoverRate)
            // console.info("涨跌幅限制类型：" + resp.quoteItems.convertToArray()[i].upDownLimitType)
            // console.info("跌停价：" + resp.quoteItems.convertToArray()[i].limitDown)
            // console.info("涨停价：" + resp.quoteItems.convertToArray()[i].limitUP)
            // console.info("均价：" + resp.quoteItems.convertToArray()[i].averageValue)
            // console.info("均价：" + resp.quoteItems.convertToArray()[i].averageValue)
            // console.info("涨跌：" + resp.quoteItems.convertToArray()[i].change)
            // console.info("成交金额：" + resp.quoteItems.convertToArray()[i].amount)
            // console.info("量比：" + resp.quoteItems.convertToArray()[i].volumeRatio)
            // console.info("买一价：" + resp.quoteItems.convertToArray()[i].buyPrice)
            // console.info("卖一价：" + resp.quoteItems.convertToArray()[i].sellPrice)
            // console.info("外盘量：" + resp.quoteItems.convertToArray()[i].buyVolume)
            // console.info("内盘量：" + resp.quoteItems.convertToArray()[i].sellVolume)
            // console.info("总值：" + resp.quoteItems.convertToArray()[i].totalValue)
            // console.info("总值只有港股有值：" + resp.quoteItems.convertToArray()[i].HKTotalValue)
            // console.info("流值：" + resp.quoteItems.convertToArray()[i].flowValue)
            // console.info("净资产：" + resp.quoteItems.convertToArray()[i].netAsset)
            // console.info("PE(市盈)：" + resp.quoteItems.convertToArray()[i].pe)
            // console.info("静态市盈率：" + resp.quoteItems.convertToArray()[i].pe2)
            // console.info("PB(市净率)：" + resp.quoteItems.convertToArray()[i].pb)
            // console.info("总股本：" + resp.quoteItems.convertToArray()[i].capitalization)
            // console.info("流通股：" + resp.quoteItems.convertToArray()[i].circulatingShares)
            // console.info("五档/十档 买价：" + resp.quoteItems.convertToArray()[i].buyPrices)
            // console.info("五档/十档 卖价：" + resp.quoteItems.convertToArray()[i].sellPrices)
            // console.info("五档/十档 委托总笔数（买）：" + resp.quoteItems.convertToArray()[i].buySingleVolumes)
            // console.info("五档/十档 委托总笔数（卖）：" + resp.quoteItems.convertToArray()[i].sellSingleVolumes)
            // console.info("五档/十档 买量：" + resp.quoteItems.convertToArray()[i].buyVolumes)
            // console.info("五档/十档 卖量：" + resp.quoteItems.convertToArray()[i].sellVolumes)
            // console.info("振幅比率：" + resp.quoteItems.convertToArray()[i].amplitudeRate)
            // console.info("收益：" + resp.quoteItems.convertToArray()[i].receipts)
            // console.info("上涨家数：" + resp.quoteItems.convertToArray()[i].upCount)
            // console.info("平盘家数：" + resp.quoteItems.convertToArray()[i].sameCount)
            // console.info("下跌家数：" + resp.quoteItems.convertToArray()[i].downCount)
            // console.info("期权类型：" + resp.quoteItems.convertToArray()[i].optionType)
            // console.info("涨跌幅：" + resp.quoteItems.convertToArray()[i].changeRate)
            // console.info("涨跌标识：" + resp.quoteItems.convertToArray()[i].upDownFlag)
            // console.info("限价买数量上限：" + resp.quoteItems.convertToArray()[i].buyQtyUpperLimit)
            // console.info("限价卖数量上限：" + resp.quoteItems.convertToArray()[i].sellQtyUpperLimit)
            // console.info("市价买数量上限：" + resp.quoteItems.convertToArray()[i].marketBuyQtyUpperLimit)
            // console.info("市价卖数量上限：" + resp.quoteItems.convertToArray()[i].marketSellQtyUpperLimit)
          }
          for (let j = 0; j < resp.addValueModels.length; j++) {
            console.info("证券代码：" + resp.addValueModels.convertToArray()[j].code)
            console.info("超大单主动买入成交量：" + resp.addValueModels.convertToArray()[j].ultraLargeBuyVolume)
            console.info("超大单主动卖出成交量	：" + resp.addValueModels.convertToArray()[j].ultraLargeSellVolume)
            console.info("超大单主动卖出成交量	：" + resp.addValueModels.convertToArray()[j].ultraLargeSellVolume)
            console.info("超大单主动买入成交额	：" + resp.addValueModels.convertToArray()[j].ultraLargeBuyAmount)
            console.info("超大单主动卖出成交额	：" + resp.addValueModels.convertToArray()[j].ultraLargeSellAmount)
            console.info("大单主动买入成交量：" + resp.addValueModels.convertToArray()[j].largeBuyVolume)
          }
        }
        else {
          console.info("接口返回数据为空！！！")
        }
      },
      onFail: (err: ErrorInfo) => {
        console.info("QuoteRequest error：:" + err.getMsg());
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