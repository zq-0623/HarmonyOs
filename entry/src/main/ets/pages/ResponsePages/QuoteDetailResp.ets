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
    let date = new Date()
    let beginTime = date.getTime()
    this.request.send({
      onSuccess: (resp: QuoteResp) => {   // 快照响应
        let date = new Date()
        let endTime = date.getTime()
        console.info('cost ' + (endTime - beginTime))
        this.message = resp.toString();   // 输出response到手机屏幕  string类型
        let item: QuoteItem = resp.quoteItems![0]
        let count = item.buyPrices?.length
        console.info('count :' + count)

        if (resp.quoteItems) {
          for (let i = 0; i < resp.quoteItems.length; i++){
            console.info("股票状态：" + resp.quoteItems.convertToArray()[i].status)
            console.info("代码：" + resp.quoteItems.convertToArray()[i].id)
            console.info("股票名称：" + resp.quoteItems.convertToArray()[i].name)
            console.info("交易时间：" + resp.quoteItems.convertToArray()[i].datetime)
            console.info("拼音：" + resp.quoteItems.convertToArray()[i].pinyin)
            console.info("市场：" + resp.quoteItems.convertToArray()[i].market)
            console.info("子类别：" + resp.quoteItems.convertToArray()[i].subtype)
            console.info("最新价：" + resp.quoteItems.convertToArray()[i].lastPrice)
            console.info("最高价：" + resp.quoteItems.convertToArray()[i].highPrice)
            console.info("最低价：" + resp.quoteItems.convertToArray()[i].lowPrice)
            console.info("今开价：" + resp.quoteItems.convertToArray()[i].openPrice)
            console.info("昨收价：" + resp.quoteItems.convertToArray()[i].preClosePrice)
            console.info("涨跌比率：" + resp.quoteItems.convertToArray()[i].changeRate)
            console.info("总量：" + resp.quoteItems.convertToArray()[i].volume)
            console.info("当前成交量：" + resp.quoteItems.convertToArray()[i].nowVolume)
            console.info("换手率：" + resp.quoteItems.convertToArray()[i].turnoverRate)
            console.info("涨跌幅限制类型：" + resp.quoteItems.convertToArray()[i].upDownLimitType)
            console.info("跌停价：" + resp.quoteItems.convertToArray()[i].limitDown)
            console.info("涨停价：" + resp.quoteItems.convertToArray()[i].limitUP)
            console.info("均价：" + resp.quoteItems.convertToArray()[i].averageValue)
            console.info("均价：" + resp.quoteItems.convertToArray()[i].averageValue)
            console.info("涨跌：" + resp.quoteItems.convertToArray()[i].change)
            console.info("成交金额：" + resp.quoteItems.convertToArray()[i].amount)
            console.info("量比：" + resp.quoteItems.convertToArray()[i].volumeRatio)
            console.info("买一价：" + resp.quoteItems.convertToArray()[i].buyPrice)
            console.info("卖一价：" + resp.quoteItems.convertToArray()[i].sellPrice)
            console.info("外盘量：" + resp.quoteItems.convertToArray()[i].buyVolume)
            console.info("内盘量：" + resp.quoteItems.convertToArray()[i].sellVolume)
            console.info("总值：" + resp.quoteItems.convertToArray()[i].totalValue)
            console.info("总值只有港股有值：" + resp.quoteItems.convertToArray()[i].HKTotalValue)
            console.info("流值：" + resp.quoteItems.convertToArray()[i].flowValue)
            console.info("净资产：" + resp.quoteItems.convertToArray()[i].netAsset)
            console.info("PE(市盈)：" + resp.quoteItems.convertToArray()[i].pe)
            console.info("静态市盈率：" + resp.quoteItems.convertToArray()[i].pe2)
            console.info("PB(市净率)：" + resp.quoteItems.convertToArray()[i].pb)
            console.info("总股本：" + resp.quoteItems.convertToArray()[i].capitalization)
            console.info("流通股：" + resp.quoteItems.convertToArray()[i].circulatingShares)
            console.info("五档/十档 买价：" + resp.quoteItems.convertToArray()[i].buyPrices)
            console.info("五档/十档 卖价：" + resp.quoteItems.convertToArray()[i].sellPrices)
            console.info("五档/十档 委托总笔数（买）：" + resp.quoteItems.convertToArray()[i].buySingleVolumes)
            console.info("五档/十档 委托总笔数（卖）：" + resp.quoteItems.convertToArray()[i].sellSingleVolumes)
            console.info("五档/十档 买量：" + resp.quoteItems.convertToArray()[i].buyVolumes)
            console.info("五档/十档 卖量：" + resp.quoteItems.convertToArray()[i].sellVolumes)
            console.info("振幅比率：" + resp.quoteItems.convertToArray()[i].amplitudeRate)
            console.info("收益：" + resp.quoteItems.convertToArray()[i].receipts)
            console.info("上涨家数：" + resp.quoteItems.convertToArray()[i].upCount)
            console.info("平盘家数：" + resp.quoteItems.convertToArray()[i].sameCount)
            console.info("下跌家数：" + resp.quoteItems.convertToArray()[i].downCount)
            console.info("期权类型：" + resp.quoteItems.convertToArray()[i].optionType)
            console.info("涨跌幅：" + resp.quoteItems.convertToArray()[i].changeRate)
            console.info("涨跌标识：" + resp.quoteItems.convertToArray()[i].upDownFlag)
            console.info("限价买数量上限：" + resp.quoteItems.convertToArray()[i].buyQtyUpperLimit)
            console.info("限价卖数量上限：" + resp.quoteItems.convertToArray()[i].sellQtyUpperLimit)
            console.info("市价买数量上限：" + resp.quoteItems.convertToArray()[i].marketBuyQtyUpperLimit)
            console.info("市价卖数量上限：" + resp.quoteItems.convertToArray()[i].marketSellQtyUpperLimit)
            console.info("盘后成交量：" + resp.quoteItems.convertToArray()[i].afterHoursVolume)
            console.info("盘后成交额：" + resp.quoteItems.convertToArray()[i].afterHoursAmount)
            console.info("盘后成交笔数：" + resp.quoteItems.convertToArray()[i].afterHoursTransactionNumber)
            console.info("盘后撤单买笔数：" + resp.quoteItems.convertToArray()[i].afterHoursWithdrawBuyCount)
            console.info("盘后撤单买数量：" + resp.quoteItems.convertToArray()[i].afterHoursWithdrawBuyVolume)
            console.info("盘后撤单卖笔数：" + resp.quoteItems.convertToArray()[i].afterHoursWithdrawSellCount)
            console.info("盘后撤单卖数量：" + resp.quoteItems.convertToArray()[i].afterHoursWithdrawSellVolume)
            console.info("盘后委托买入总量：" + resp.quoteItems.convertToArray()[i].afterHoursBuyVolume)
            console.info("盘后委托卖出总量：" + resp.quoteItems.convertToArray()[i].afterHoursSellVolume)
            console.info("============================================================================")
            console.info("============================================================================")
            console.info("============================================================================")
          }
          if (resp.addValueModels) {
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