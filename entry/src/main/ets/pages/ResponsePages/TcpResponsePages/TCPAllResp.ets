/**
 * Author:lu
 * Date:2024/5/10
 * IDEA:SseHarmonyOS
 * FileName:TCPAllResp
 */
import router from '@ohos.router'
import { IPush, SseSDK, MQTTManager,SubscribeType, OHLCItem, ChartResp, TickResp, L2TickDetailResp,
  L2TickEntrustResp,
  L2TickRestoreResp,
  QuoteItem,
  ThousandsData,
  QXData,
  TickDetailItem,
  TickEntrustItem,
  TickRestorePush,
  ThousandsItem} from 'SseCore';
import hilog from '@ohos.hilog';

@Entry
@Component
struct AllPush {
  @State message: string = 'Hello World'
  @State  myParams: Object = router.getParams();
  private  title: string = '';
  private param: Record<string, Object> = {} ;

  build() {
    Column() {
      Text(this.title).padding(5).margin({bottom: 5}).fontSize(20).border({ width: 2 }).width('90%')
      Scroll() {
        Text(this.message)
          .width('90%')
          .margin({ left: 15,  right: 15, bottom: 5 })
          .backgroundColor(0xFF56CA6A)
          .padding(5)
      }
    }.padding({ top: 20 })
  }

  async aboutToAppear() {
    let recordParam = this.myParams as Record<string, Object>;
    this.title = recordParam['title'] as  string;
    this.param = recordParam['param'] as Record<string, Object>
    let iPush: IPush = new IPush();
    //打印逐笔明细
    iPush.tickDetailPush  = {push:(code:string,resp:L2TickDetailResp) => {
      if (resp.tickDetailItems && resp.tickDetailItems.length > 0) {
        console.info('headersParams:' + resp.headerParams)
        for (let i = 0; i < resp.tickDetailItems.length; i++) {
          let str:TickDetailItem = resp.tickDetailItems.convertToArray()[i]
          console.info(`买卖标识:${str.transactionStatus}==交易时间:${str.transactionTime}==交易量:${str.singleVolume}==成交价格:${str.transactionPrice}`)
        }
      }
    }};
    // 分笔明细
    iPush.tickPush  = {push:(code:string,resp:TickResp) => {
      this.message = resp.toString();
      console.info("头里返回的数据:" + resp.headerParams)
      if (resp.tickItems) {
        for (let i = 0; i < resp.tickItems.length; i++) {
          let str = resp.tickItems.convertToArray()[i]
          console.info(`买卖方向：${str.transactionStatus}==交易时间：${str.transactionTime}==交易量：${str.singleVolume}==成交价格：${str.transactionPrice}`)
        }
        console.error("==================第二次订阅====================")
      }
    }};
    //打印快照
    iPush.quotePush = {push:(item:QuoteItem) => {
      if (item) {
        hilog.isLoggable(0x0001,'testLog',hilog.LogLevel.DEBUG)
        console.info(`时间:${item.datetime}==代码:${item.id}==最新价:${item.lastPrice}`)
        console.info(`股票状态:${item.status}==名称:${item.name}==市场别:${item.market}`)
        console.info(`次类别:${item.subtype}==最高价:${item.highPrice}==最低价:${item.lowPrice}`)
        console.info(`今开价:${item.openPrice}==昨收价:${item.preClosePrice}==涨跌比率:${item.changeRate}`)
        console.info(`总量:${item.volume}==当前成交量:${item.nowVolume}==换手率:${item.turnoverRate}`)
      }
    }};
    //打印分时
    iPush.chartPush = {push:(code:string,resp:ChartResp) => {
      this.message = resp.toString();
      console.info("总点数:" + resp.tickCount)
      console.info("市场交易时间:" + resp.systemDatetime)
      console.info("日期列表:" + resp.systemDatetime)
      console.info("交易时间段:" + resp.timezones)
      if (resp.OHLCItems) {
        for (let i = 0; i < resp.OHLCItems.length; i++) {
          let str:OHLCItem = resp.OHLCItems[i]
          console.info(`时间:${str.datetime}==开盘价:${str.openPrice}==最高价${str.highPrice}==最低价${str.lowPrice}==收盘价:${str.closePrice}==交易量:${str.tradeVolume}==均价:${str.averagePrice}==参考价/昨收价:${str.referencePrice}==量比:${str.volumeRatio}==总委买:${str.entrustBuyVolume}==总委卖:${str.entrustSellVolume}==委差:${str.entrustDiff}`)
        }
      }
      if (resp.AFItems) {
        for (let j = 0; j < resp.AFItems.length; j++) {
          let str:OHLCItem = resp.AFItems[j]
          console.info(`时间:${str.datetime}==收盘价:${str.closePrice}==参考价/昨收价:${str.referencePrice}`)
        }
      }
      if (resp.tradeDates) {
        for (let k = 0; k < resp.tradeDates.length; k++) {
          let str:string = resp.tradeDates[k]
          console.info("日期列表:"  + str)
        }
      }
      if (resp.referencePrices){
        resp.referencePrices.forEach((key:string, value:string) => {
          console.info("价格：" + key)
          console.info("时间：" + value)
        })
      }
    }};
    //打印5日
    iPush.chart5Push = {push:(code:string,resp:ChartResp) => {
      this.message = resp.toString();
      console.info("总点数:" + resp.tickCount)
      console.info("市场交易时间:" + resp.systemDatetime)
      console.info("日期列表:" + resp.systemDatetime)
      console.info("交易时间段:" + resp.timezones)
      if (resp.OHLCItems) {
        for (let i = 0; i < resp.OHLCItems.length; i++) {
          let str:OHLCItem = resp.OHLCItems[i]
          console.info(`时间:${str.datetime}==开盘价:${str.openPrice}==最高价${str.highPrice}==最低价${str.lowPrice}==收盘价:${str.closePrice}==交易量:${str.tradeVolume}==均价:${str.averagePrice}==参考价/昨收价:${str.referencePrice}==量比:${str.volumeRatio}==总委买:${str.entrustBuyVolume}==总委卖:${str.entrustSellVolume}==委差:${str.entrustDiff}`)
        }
      }
      if (resp.AFItems) {
        for (let j = 0; j < resp.AFItems.length; j++) {
          let str:OHLCItem = resp.AFItems[j]
          console.info(`时间:${str.datetime}==收盘价:${str.closePrice}==参考价/昨收价:${str.referencePrice}`)
        }
      }
      if (resp.tradeDates) {
        for (let k = 0; k < resp.tradeDates.length; k++) {
          let str: string = resp.tradeDates[k]
          console.info("日期列表:"  + str)
        }
      }
      if (resp.referencePrices){
        resp.referencePrices.forEach((key:string, value:string) => {
          console.info("价格：" + key)
          console.info("时间：" + value)
        })
      }
    }};

    //打印逐笔委托
    iPush.tickEntrustPush   = {push:(code:string,resp:L2TickEntrustResp) => {
      console.log("起始引索:" + resp.startIndex)
      console.log("结束引索:" + resp.endIndex)
      if (resp.items){
        for(let i = 0; i < resp.items.length; i++){
          let str:TickEntrustItem = resp.items[i]
          console.info(`委托序号:${str.sn}==委托价:${str.price}==委托量:${str.volume}==买卖方:${str.bs}==卖委时间:${str.time}`)
        }
      }
    }};
    //打印逐笔还原
    iPush.tickRestorePush = {push:(code:string,resp:L2TickRestoreResp) => {
      if (resp.items){
        console.log("起始引索:" + resp.startIndex)
        console.log("结束引索:" + resp.endIndex)
        for (let i = 0; i < resp.items.length; i++) {
          let str = resp.items[i]
          console.info(`交易时间:${str.transactionTime}买卖标识:${str.transactionStatus}==交易量:${str.singleVolume}==成交价格:${str.transactionPrice}==索引:${str.index}==买委托序号:${str.bn}==卖委托序号:${str.on}==买委托量:${str.bq}==卖委托量:${str.oq}==买方剩余量:${str.br}==卖方剩余量:${str.sr}`)
        }
      }
    }};
    //打印千档
    iPush.thousandsPush  = {push:(code:string,data:ThousandsData) => {
      console.info(`testData${data.code}`)
      if (data.buyItems && data.buyItems.length > 0) {
        for (let i = 0; i < data.buyItems.length; i++) {
          let str:ThousandsItem = data.buyItems[i]
          console.info(`股票代码:${str.originalPrice}==买卖方向:${str.bs}==委托价格:${str.price}==委托量:${str.volume}==笔数(委托单子数量):${str.count}`)
        }
      }
      if (data.sellItems && data.sellItems.length > 0) {
        for (let j = 0; j < data.sellItems.length; j++) {
          let str = data.sellItems[j]
          console.info(`股票代码:${str.originalPrice}==买卖方向:${str.bs}==委托价格:${str.price}==委托量:${str.volume}==笔数(委托单子数量):${str.count}`)
        }
      }
    }};
    //打印全息
    iPush.qxPush = {push:(code:string,data:QXData) => {
      console.info(`股票代码:${data.code}==价格:${data.price}`)
      if (data.items && data.items.length > 0) {
        for (let i = 0; i < data.items.length; i++) {
          let str = data.items[i]
          console.info(`委托序号:${str.sn}==买卖方向:${str.bs}==委托量:${str.volume}`)
        }

      }
    }};

    //订阅
    SseSDK.setIPush(iPush);
    MQTTManager.getInstance().subscribe(this.param["code"] as  string,SubscribeType.TickRestore)
    // MQTTManager.getInstance().subscribe(this.param["code"] as  string,SubscribeType.TickEntrust)
    // MQTTManager.getInstance().subscribe(this.param["code"] as  string,SubscribeType.Tick)
    MQTTManager.getInstance().subscribe(this.param["code"] as  string,SubscribeType.Thousands)
    MQTTManager.getInstance().subscribe(this.param["code"] as  string,SubscribeType.TickDetail)
    MQTTManager.getInstance().subscribe(this.param["code"] as  string,SubscribeType.Snap)
    // MQTTManager.getInstance().subscribe(this.param["code"] as  string,SubscribeType.Line)
    // MQTTManager.getInstance().subscribe(this.param["code"] as  string,SubscribeType.Line5)
    // MQTTManager.getInstance().subscribe(this.param["code"] as  string,SubscribeType.QX)
  }
//解订阅
  aboutToDisappear(){
    let codeStrs = this.param["code"] as  string
    MQTTManager.getInstance().unSubscribe(codeStrs,SubscribeType.TickDetail)
    MQTTManager.getInstance().unSubscribe(codeStrs,SubscribeType.Snap)
    MQTTManager.getInstance().unSubscribe(codeStrs,SubscribeType.Thousands)
    MQTTManager.getInstance().unSubscribe(codeStrs,SubscribeType.TickRestore)
    // MQTTManager.getInstance().unSubscribe(codeStrs,SubscribeType.All)
  }
}