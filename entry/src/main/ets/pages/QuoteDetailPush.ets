// import router from '@ohos.router'
// import { SseSDK ,AddValueModel,QuoteItem,IPush,} from 'SseCore'
// import { StringBuilder } from './StringBuilder'
// import { ArrayList } from '@kit.ArkTS'
//
// @Entry
// @Component
// struct QuoteDetailPush {
//   @State message: string = 'Hello World'
//   @State  myParams: Object = router.getParams();
//   private  title: string = '';
//   private param: Record<string, Object> = {} ;
//
//   build() {
//     Column() {
//       Text(this.title).padding(5).margin({bottom: 5}).fontSize(20).border({ width: 2 }).width('90%')
//       Scroll() {
//         Text(this.message)
//           .width('90%')
//           .margin({ left: 15,  right: 15, bottom: 5 })
//           .backgroundColor(0xFF56CA6A)
//           .padding(5)
//       }
//     }.padding({ top: 20 })
//
//   }
//
//   async aboutToAppear() {
//     let recordParam = this.myParams as Record<string, Object>;
//     this.title = recordParam['title'] as  string;
//     this.param = recordParam['param'] as Record<string, Object>
//     let iPush: IPush = new IPush();
//     iPush.quotePush = {push:(item) => {
//       if (item && item.buyPrices) {
//         let count = item.buyPrices.length
//       }
//       this.message = this.getMsg(item, new AddValueModel());
//       console.info("代码：" + JSON.stringify(item.id))
//       console.info("最高价：" + JSON.stringify(item.highPrice))
//       console.info("最新价：" + JSON.stringify(item.lastPrice))
//     }};
//     SseSDK.setIPush(iPush);
//    TCPManager.getInstance().subscribe(this.param["code"] as string)
//   }
//
//   aboutToDisappear(){
//     let codeStrs = this.param["code"] as  string
//     TCPManager.getInstance().unSubscribe(codeStrs.split(','))
//   }
//
//   private getMsg(item: QuoteItem, model: AddValueModel) {
//     let sb = new StringBuilder();
//     let count = SseSDK.permission().getInfoLevel() === "1" ? "五" : "十";
//
//     sb.append("股票状态:" + (item.status == null ? "-" : item.status)).append("\n");
//     sb.append("代码:" + (item.id == null ? "-" : item.id)).append("\n");
//     sb.append("名称:" + (item.name == null ? "-" : item.name)).append("\n");
//     let subTitleTime = (item.datetime);
//     //时间
//     if (subTitleTime != null && subTitleTime.length == 14) {
//       subTitleTime = this.Stringinsert(subTitleTime, ":", 12);
//       subTitleTime = this.Stringinsert(subTitleTime, ":", 10);
//       subTitleTime = this.Stringinsert(subTitleTime, " ", 8);
//       subTitleTime = this.Stringinsert(subTitleTime, "-", 6);
//       subTitleTime = subTitleTime.substring(14 - 10);
//     }
//     sb.append("交易时间:" + (item.datetime == null ? "-" : subTitleTime)).append("\n");
//     sb.append("拼音:" + (item.pinyin == null ? "-" : item.pinyin)).append("\n");
//     sb.append("市场别:" + (item.market == null ? "-" : item.market)).append("\n");
//     sb.append("次类别:" + (item.subtype == null ? "-" : item.subtype)).append("\n");
//     sb.append("最新价:" + (item.lastPrice == null ? "-" : item.lastPrice)).append("\n");
//     sb.append("最高价:" + (item.highPrice == null ? "-" : item.highPrice)).append("\n");
//     sb.append("最低价:" + (item.lowPrice == null ? "-" : item.lowPrice)).append("\n");
//     sb.append("今开价:" + (item.openPrice == null ? "-" : item.openPrice)).append("\n");
//     sb.append("昨收价:" + (item.preClosePrice == null ? "-" : item.preClosePrice)).append("\n");
//     sb.append("涨跌比率:" + (item.changeRate == null ? "-" : item.changeRate)).append("\n");
//     sb.append("总量:" + (item.volume == null ? "-" : item.volume)).append("\n");
//     sb.append("当前成交量:" + (item.nowVolume == null ? "-" : item.nowVolume)).append("\n");
//     sb.append("换手率:" + (item.turnoverRate == null ? "-" : item.turnoverRate)).append("\n");
//     sb.append("涨停价:" + (item.limitUP == null ? "-" : item.limitUP)).append("\n");
//     sb.append("跌停价:" + (item.limitDown == null ? "-" : item.limitDown)).append("\n");
//     sb.append("均价:" + (item.averageValue == null ? "-" : item.averageValue)).append("\n");
//     sb.append("涨跌:" + (item.change == null ? "-" : item.change)).append("\n");
//     sb.append("成交金额:" + (item.amount == null ? "-" : item.amount)).append("\n");
//     sb.append("量比:" + (item.volumeRatio == null ? "-" : item.volumeRatio)).append("\n");
//     sb.append("买一价:" + (item.buyPrice == null ? "-" : item.buyPrice)).append("\n");
//     sb.append("卖一价:" + (item.sellPrice == null ? "-" : item.sellPrice)).append("\n");
//     sb.append("外盘量:" + (item.buyVolume == null ? "-" : item.buyVolume)).append("\n");
//     sb.append("内盘量:" + (item.sellVolume == null ? "-" : item.sellVolume)).append("\n");
//     sb.append("总值:" + (item.totalValue == null ? "-" : item.totalValue)).append("\n");
//     sb.append("流值:" + (item.flowValue == null ? "-" : item.flowValue)).append("\n");
//     sb.append("净资产:" + (item.netAsset == null ? "-" : item.netAsset)).append("\n");
//     sb.append("PE(市盈):" + (item.pe == null ? "-" : item.pe)).append("\n");
//     sb.append("市净率:" + (item.pb == null ? "-" : item.pb)).append("\n");
//     sb.append("总股本:" + (item.capitalization == null ? "-" : item.capitalization)).append("\n");
//     sb.append("流通股:" + (item.circulatingShares == null ? "-" : item.circulatingShares)).append("\n");
//     sb.append(count + "档买价:" + (item.buyPrices == null ? "-" : this.getStringFromlist(item.buyPrices))).append("\n");
//     sb.append(count + "档买量:" + (item.buyVolumes == null ? "-" : this.getStringFromlist(item.buyVolumes))).append("\n");
//     sb.append(count + "档买量-单量:" + (item.buySingleVolumes == null ? "-" : this.getStringFromlist(item.buySingleVolumes))).append("\n");
//     sb.append(count + "档卖价:" + (item.sellPrices == null ? "-" : this.getStringFromlist(item.sellPrices))).append("\n");
//     sb.append(count + "档卖量:" + (item.sellVolumes == null ? "-" : this.getStringFromlist(item.sellVolumes))).append("\n");
//     sb.append(count + "档卖量-单量:" + (item.sellSingleVolumes == null ? "-" : this.getStringFromlist(item.sellSingleVolumes))).append("\n");
//     sb.append("总买量:" + (item.sumBuy == null ? "-" : item.sumBuy)).append("\n");
//     sb.append("总卖量:" + (item.sumSell == null ? "-" : item.sumSell)).append("\n");
//     sb.append("振幅比率:" + (item.amplitudeRate == null ? "-" : item.amplitudeRate)).append("\n");
//     sb.append("收益:" + (item.receipts == null ? "-" : item.receipts)).append("\n");
//     sb.append("涨跌旗标:" + (item.upDownFlag == null ? "-" : item.upDownFlag)).append("\n");
//
//
//     sb.append("上漲家数:" + (item.upCount == null ? "-" : item.upCount)).append("\n");
//     sb.append("平盘家数:" + (item.sameCount == null ? "-" : item.sameCount)).append("\n");
//     sb.append("下跌家数:" + (item.downCount == null ? "-" : item.downCount)).append("\n");
//     sb.append("合约代码:" + (item.contractID == null ? "-" : item.contractID)).append("\n");
//     sb.append("标的证券代码:" + (item.objectID == null ? "-" : item.objectID)).append("\n");
//     sb.append("标的证券简称:" + (item.stockSymbol == null ? "-" : item.stockSymbol)).append("\n");
//     sb.append("标的证券类型:" + (item.stockType == null ? "-" : item.stockType)).append("\n");
//     sb.append("合约单位:" + (item.stockUnit == null ? "-" : item.stockUnit)).append("\n");
//     sb.append("执行价格:" + (item.exePrice == null ? "-" : item.exePrice)).append("\n");
//     sb.append("首交易日:" + (item.startDate == null ? "-" : item.startDate)).append("\n");
//     sb.append("最后交易日:" + (item.endDate == null ? "-" : item.endDate)).append("\n");
//     sb.append("行权日:" + (item.exeDate == null ? "-" : item.exeDate)).append("\n");
//     sb.append("交割日:" + (item.delDate == null ? "-" : item.delDate)).append("\n");
//     sb.append("到期日:" + (item.expDate == null ? "-" : item.expDate)).append("\n");
//     sb.append("合约版号:" + (item.version == null ? "-" : item.version)).append("\n");
//     sb.append("前结算价:" + (item.presetPrice == null ? "-" : item.presetPrice)).append("\n");
//     sb.append("当日结算价:" + (item.setPrice == null ? "-" : item.setPrice)).append("\n");
//     sb.append("标的证券昨收:" + (item.stockClose == null ? "-" : item.stockClose)).append("\n");
//     sb.append("标的证券价格:" + (item.stockLast == null ? "-" : item.stockLast)).append("\n");
//     sb.append("有无涨跌限制:" + (item.isLimit == null ? "-" : item.isLimit)).append("\n");
//     sb.append("合约保证金:" + (item.marginUnit == null ? "-" : item.marginUnit)).append("\n");
//     sb.append("一手的合约数:" + (item.roundLot == null ? "-" : item.roundLot)).append("\n");
//     sb.append("内涵价值:" + (item.inValue == null ? "-" : item.inValue)).append("\n");
//     sb.append("时间价值:" + (item.timeValue == null ? "-" : item.timeValue)).append("\n");
//     sb.append("昨日持仓量(张):" + (item.preInterest == null ? "-" : item.preInterest)).append("\n");
//     sb.append("持仓量:" + (item.openInterest == null ? "-" : item.openInterest)).append("\n");
//     sb.append("交易时段:" + (item.tradePhase == null ? "-" : item.tradePhase)).append("\n");
//     sb.append("剩余天数:" + (item.remainDate == null ? "-" : item.remainDate)).append("\n");
//     sb.append("杠杆比率:" + (item.leverageRatio == null ? "-" : item.leverageRatio)).append("\n");
//     sb.append("溢价率:" + (item.premiumRate == null ? "-" : item.premiumRate)).append("\n");
//
//     sb.append("加权平均价:" + (item.add_option_avg_price == null ? "-" : item.add_option_avg_price)).append("\n");
//     sb.append("加权平均涨跌BP:" + (item.add_option_avg_pb == null ? "-" : item.add_option_avg_pb)).append("\n");
//
//     sb.append("昨收盘加权平均价:" + (item.add_option_avg_close == null ? "-" : item.add_option_avg_close)).append("\n");
//     sb.append("静态市盈率的计算因子:" + (item.pe2_unit == null ? "-" : item.pe2_unit)).append("\n");
//     sb.append("港股最小交易单位:" + (item.hk_volum_for_every_hand == null ? "-" : item.hk_volum_for_every_hand))
//       .append("\n");
//
//
//     sb.append("买入撤单笔数:" + (item.buy_cancel_count == null ? "-" : item.buy_cancel_count)).append("\n");
//     sb.append("买入撤单数量:" + (item.buy_cancel_num == null ? "-" : item.buy_cancel_num)).append("\n");
//
//     sb.append("买入撤单金额:" + (item.buy_cancel_amount == null ? "-" : item.buy_cancel_amount)).append("\n");
//     sb.append("卖出撤单笔数:" + (item.sell_cancel_count == null ? "-" : item.sell_cancel_count)).append("\n");
//     sb.append("卖出撤单数量:" + (item.sell_cancel_num == null ? "-" : item.sell_cancel_num)).append("\n");
//     sb.append("卖出撤单金额:" + (item.sell_cancel_amount == null ? "-" : item.sell_cancel_amount)).append("\n");
//
//     sb.append("回购期限:" + (item.rp == null ? "-" : item.rp)).append("\n");
//
//     sb.append("实际占款天数:" + (item.cd == null ? "-" : item.cd)).append("\n");
//     sb.append("VCM:" + (item.VCMFlag == null ? "-" : item.VCMFlag)).append("\n");
//     sb.append("CAS:" + (item.CASFlag == null ? "-" : item.CASFlag)).append("\n");
//     sb.append("委比:" + (item.orderRatio == null ? "-" : item.orderRatio)).append("\n");
//
//     sb.append("-------------------------------\n");
//     sb.append("日增:" + (item.position_chg == null ? "-" : item.position_chg)).append("\n");
//     sb.append("委差:" + (item.entrustDiff == null ? "-" : item.entrustDiff)).append("\n");
//     sb.append("仓差:" + (item.posDiff == null ? "-" : item.posDiff)).append("\n");
//     sb.append("现期差:" + (item.currDiff == null ? "-" : item.currDiff)).append("\n");
//     sb.append("交割日期:" + (item.deliveryDay == null ? "-" : item.deliveryDay)).append("\n");
//     sb.append("change1:" + (item.change1 == null ? "-" : item.change1)).append("\n");
//     sb.append("总买:" + (item.totalBid == null ? "-" : item.totalBid)).append("\n");
//     sb.append("总卖:" + (item.totalAsk == null ? "-" : item.totalAsk)).append("\n");
//     sb.append("-------------------------------\n");
//
//     sb.append("隐含波动率:" + (item.impliedVolatility == null ? "-" : item.impliedVolatility)).append("\n");
//     sb.append("无风险利率:" + (item.riskFreeInterestRate == null ? "-" : item.riskFreeInterestRate)).append("\n");
//     sb.append("delta:" + (item.delta == null ? "-" : item.delta)).append("\n");
//     sb.append("grama:" + (item.gramma == null ? "-" : item.gramma)).append("\n");
//     sb.append("theta:" + (item.theta == null ? "-" : item.theta)).append("\n");
//     sb.append("vega:" + (item.vega == null ? "-" : item.vega)).append("\n");
//     sb.append("rho:" + (item.rho == null ? "-" : item.rho)).append("\n");
//     sb.append("-------------------------------\n");
//     sb.append("每股收益:" + (item.earningsPerShare == null ? "-" : item.earningsPerShare)).append("\n");
//     sb.append("全年预估每股收益:" + (item.receipts == null ? "-" : item.receipts)).append("\n");
//     sb.append("挂牌日期:" + (item.listDate == null ? "-" : item.listDate)).append("\n");
//     sb.append("起始日:" + (item.valueDate == null ? "-" : item.valueDate)).append("\n");
//     sb.append("到期日:" + (item.expiringDate == null ? "-" : item.expiringDate)).append("\n");
//     sb.append("做市商数量:" + (item.marketMakerQty == null ? "-" : item.marketMakerQty)).append("\n");
//     sb.append("除权除息:" + (item.exRighitDividend == null ? "-" : item.exRighitDividend)).append("\n");
//
//     sb.append("其他业务状态:" + (item.serviceStatus == null ? "-" : item.serviceStatus)).append("\n");
//     sb.append("停牌标志:" + (item.suspendedSymbol == null ? "-" : item.suspendedSymbol)).append("\n");
//     sb.append("转让状态:" + (item.stateOfTransfer == null ? "-" : item.stateOfTransfer)).append("\n");
//     sb.append("转让类型:" + (item.typeOfTransfer == null ? "-" : item.typeOfTransfer)).append("\n");
//     sb.append("到期日:" + (item.expiringDate == null ? "-" : item.expiringDate)).append("\n");
//     sb.append("证券级别:" + (item.securityLevel == null ? "-" : item.securityLevel)).append("\n");
//     sb.append("市盈率(静):" + (item.pe2 == null ? "-" : item.pe2)).append("\n");
//
//     sb.append("非限售股本:" + (item.unRestrictedShareCapital == null ? "-" : item.unRestrictedShareCapital)).append("\n");
//     sb.append("每笔限量:" + (item.mbxl == null ? "-" : item.mbxl)).append("\n");
//     sb.append("最小申报数量:" + (item.zxsbsl == null ? "-" : item.zxsbsl)).append("\n");
//     sb.append("发行市盈率:" + (item.issuePE == null ? "-" : item.issuePE)).append("\n");
//     sb.append("每股面值:" + (item.mgmz == null ? "-" : item.mgmz)).append("\n");
//     sb.append("折合比例:" + (item.zhbl == null ? "-" : item.zhbl)).append("\n");
//     sb.append("-------------------------------\n");
//
//     sb.append("权涨幅:" + (item.blockChg == null ? "-" : item.blockChg)).append("\n");
//     sb.append("均涨幅:" + (item.averageChg == null ? "-" : item.averageChg)).append("\n");
//     sb.append("五日指数涨跌幅:" + (item.indexChg5 == null ? "-" : item.indexChg5)).append("\n");
//     sb.append("10日指数涨跌幅:" + (item.indexChg10 == null ? "-" : item.indexChg10)).append("\n");
//     sb.append("-------------------------------\n")
//     sb.append("[增值指标]\n");
//
//
//     sb.append("证券代码:" + (model.getCode() == null ? "-" : model.getCode())).append("\n");
//     sb.append("当前快照日期:" + (model.getDate() == null ? "-" : model.getDate())).append("\n");
//     sb.append("当前快照时间:" + (model.getTime() == null ? "-" : model.getTime())).append("\n");
//     sb.append("超大单主动买入成交量:" + (model.getUltraLargeBuyVolume() == null ? "-" : model.getUltraLargeBuyVolume()))
//       .append("\n");
//     sb.append("超大单主动卖出成交量:" + (model.getUltraLargeSellVolume() == null ? "-" : model.getUltraLargeSellVolume()))
//       .append("\n");
//     sb.append("超大单主动买入成交额:" + (model.getUltraLargeBuyAmount() == null ? "-" : model.getUltraLargeBuyAmount()))
//       .append("\n");
//     sb.append("超大单主动卖入成交额:" + (model.getUltraLargeSellAmount() == null ? "-" : model.getUltraLargeSellAmount()))
//       .append("\n");
//
//     sb.append("大单主动买入成交量:" + (model.getLargeBuyVolume() == null ? "-" : model.getLargeBuyVolume()))
//       .append("\n");
//     sb.append("大单主动卖出成交量:" + (model.getLargeSellVolume() == null ? "-" : model.getLargeSellVolume()))
//       .append("\n");
//     sb.append("大单主动买入成交额:" + (model.getLargeBuyAmount() == null ? "-" : model.getLargeBuyAmount()))
//       .append("\n");
//     sb.append("大单主动卖入成交额:" + (model.getLargeSellAmount() == null ? "-" : model.getLargeSellAmount()))
//       .append("\n");
//
//     sb.append("中单主动买入成交量:" + (model.getMediumBuyVolume() == null ? "-" : model.getMediumBuyVolume()))
//       .append("\n");
//     sb.append("中单主动卖出成交量:" + (model.getMediumSellVolume() == null ? "-" : model.getMediumSellVolume()))
//       .append("\n");
//     sb.append("中单主动买入成交额:" + (model.getMediumBuyAmount() == null ? "-" : model.getMediumBuyAmount()))
//       .append("\n");
//     sb.append("中单主动卖入成交额:" + (model.getMediumSellAmount() == null ? "-" : model.getMediumSellAmount()))
//       .append("\n");
//
//     sb.append("小单主动买入成交量:" + (model.getSmallBuyVolume() == null ? "-" : model.getSmallBuyVolume()))
//       .append("\n");
//     sb.append("小单主动卖出成交量:" + (model.getSmallSellVolume() == null ? "-" : model.getSmallSellVolume()))
//       .append("\n");
//     sb.append("小单主动买入成交额:" + (model.getSmallBuyAmount() == null ? "-" : model.getSmallBuyAmount()))
//       .append("\n");
//     sb.append("小单主动卖入成交额:" + (model.getSmallSellAmount() == null ? "-" : model.getSmallSellAmount()))
//       .append("\n");
//
//
//     sb.append("超大单净流入:" + (model.getUltraLargeNetInflow() == null ? "-" : model.getUltraLargeNetInflow()))
//       .append("\n");
//     sb.append("大单净流入:" + (model.getLargeNetInflow() == null ? "-" : model.getLargeNetInflow())).append("\n");
//     sb.append("中单净流入:" + (model.getMediumNetInflow() == null ? "-" : model.getMediumNetInflow())).append("\n");
//     sb.append("小单净流入:" + (model.getSmallNetInflow() == null ? "-" : model.getSmallNetInflow())).append("\n");
//
//     sb.append("主力资金流入:" + (model.getFundsInflows() == null ? "-" : this.getStringFromArray(model.getFundsInflows())))
//       .append("\n");
//     sb.append("主力资金流出:" + (model.getFundsOutflows() == null ? "-" : this.getStringFromArray(model.getFundsOutflows())))
//       .append("\n");
//     sb.append("散户资金流入:" + (model.getOthersFundsInflows() == null ? "-" : this.getStringFromArray(model.getOthersFundsInflows())))
//       .append("\n");
//     sb.append("散户资金流出:" + (model.getOthersFundsOutflows() == null ? "-" : this.getStringFromArray(model.getOthersFundsOutflows())))
//       .append("\n");
//
//
//     sb.append("超大单差:" + (model.getUltraLargeDiffer() == null ? "-" : model.getUltraLargeDiffer())).append("\n");
//     sb.append("大单差:" + (model.getLargeDiffer() == null ? "-" : model.getLargeDiffer())).append("\n");
//     sb.append("中单差:" + (model.getMediumDiffer() == null ? "-" : model.getMediumDiffer())).append("\n");
//     sb.append("小单差:" + (model.getSmallDiffer() == null ? "-" : model.getSmallDiffer())).append("\n");
//
//     sb.append("每单大买单成交手数（超大单+大单）:" + (model.getLargeBuyDealCount() == null ? "-" : model.getLargeBuyDealCount()))
//       .append("\n");
//     sb.append("每单大卖单成交手数（超大单+大单）:" + (model.getLargeSellDealCount() == null ? "-" : model.getLargeSellDealCount()))
//       .append("\n");
//
//
//     sb.append("每单成交手数移动平均值:" + (model.getDealCountMovingAverage() == null ? "-" : model.getDealCountMovingAverage()))
//       .append("\n");
//
//
//     sb.append("买入单数:" + (model.getBuyCount() == null ? "-" : model.getBuyCount())).append("\n");
//     sb.append("卖出单数:" + (model.getSellCount() == null ? "-" : model.getSellCount())).append("\n");
//
//
//     sb.append("BBD:" + (model.getBBD() == null ? "-" : model.getBBD())).append("\n");
//     sb.append("BBD5:" + (model.getBBD5() == null ? "-" : model.getBBD5())).append("\n");
//
//
//     sb.append("BBD10:" + (model.getBBD10() == null ? "-" : model.getBBD10())).append("\n");
//     sb.append("DDX:" + (model.getDDX() == null ? "-" : model.getDDX())).append("\n");
//
//     sb.append("DDX5:" + (model.getDDX5() == null ? "-" : model.getDDX5())).append("\n");
//     sb.append("DDX10:" + (model.getDDX10() == null ? "-" : model.getDDX10())).append("\n");
//
//     sb.append("DDY:" + (model.getDDY() == null ? "-" : model.getDDY())).append("\n");
//     sb.append("DDY5:" + (model.getDDY5() == null ? "-" : model.getDDY5())).append("\n");
//
//     sb.append("DDY10:" + (model.getDDY10() == null ? "-" : model.getDDY10())).append("\n");
//     sb.append("DDZ:" + (model.getDDZ() == null ? "-" : model.getDDZ())).append("\n");
//
//     sb.append("RatioBS:" + (model.getRatioBS() == null ? "-" : model.getRatioBS())).append("\n");
//
//     sb.append("-------------------------------\n");
//     let result = sb.toString();
//     return result;
//   }
//
//   private Stringinsert(a: string, b: string, t: number) {
//     if (a == null) {
//       a = "       ";
//     }
//     let aa = a.substring(0, t);
//     let bb = a.substring(t, a.length);
//     return aa + b + bb;
//   }
//
//   private getStringFromArray(array?: string[]) {
//     if (!array) {
//       return "";
//     }
//     let sb = new StringBuilder();
//     sb.append("[");
//     for (let str of array) {
//       sb.append(str).append(",");
//
//     }
//     sb.append("]");
//     let result = sb.toString();
//     return result;
//   }
//   private getStringFromlist(array: ArrayList<string| undefined>) {
//     let sb = new StringBuilder();
//     sb.append("[");
//     for (let str of array) {
//       sb.append(str).append(",");
//
//     }
//     sb.append("]");
//     let result = sb.toString();
//     return result;
//   }
// }