// import router from '@ohos.router'
// import { ErrorInfo, HSAmountAllReq, HSAmountAllResp, HSAmountItem,Request } from 'SseCore'
//
// let RequestMap = {
//   "HSAmountAllReq": new HSAmountAllReq(),
// } as Record<string, Request>
// @Entry
// @Component
// struct HSAmountAllResponse {
//   @State message: string = 'Hello World'
//   @State myParams: Object = router.getParams();
//   private title: string = '';
//   private request: Request = new Request();
//   private param: Record<string, Object> = {};
//   build() {
//     Column() {
//       Text(this.title)
//         .padding(5)
//         .margin({ bottom: 5 })
//         .fontSize(20)
//         .border({ width: 2 })
//         .width('90%')
//       Scroll() {
//         Text(this.message)
//           .width('90%')
//           .margin({ left: 15, right: 15, bottom: 5 })
//           .backgroundColor(0xFF56CA6A)
//           .padding({ left: 10, right: 10, top: 5, bottom: 25 })
//       }
//     }.padding({ top: 20 })
//   }
//   private intervalId?: number
//   private sendReq(){
//     for (let keyValue of Object.entries(this.param)) {
//       Reflect.set(this.request, keyValue[0], keyValue[1]);
//     }
//     let date = new Date()
//     let beginTime = date.getTime()
//     this.request.send({
//       onSuccess: (resp: HSAmountAllResp) => {
//         let date = new Date()
//         let endTime = date.getTime()
//         console.info('cost ' + (endTime - beginTime))
//         this.message = resp.toString();
//         if (resp.amountItem) {
//           let str:HSAmountItem = resp.amountItem
//           console.info(`南向港股通沪每日初始额度:${str.hgtInitialQuotaS}==南向港股通沪日中剩余额度:${str.hgtRemainingQuotaS}==南向港股通沪额度状态:${str.hgtQuotaStatusS}==南向港股通沪总买入成交额:${str.hgtTotalBuyAmountS}==南向港股通沪总卖出成交额:${str.hgtTotalSellAmountS}==南向港股通沪买卖总成交额:${str.hgtBuySellTotalAmountS}==南向港股通深每日初始额度:${str.sgtInitialQuotaS}==南向港股通深日中剩余额度:${str.sgtRemainingQuotaS}==南向港股通深额度状态:${str.sgtQuotaStatusS}==南向港股通深总买入成交额:${str.sgtTotalBuyAmountS}==南向港股通深总卖出成交额:${str.sgtTotalSellAmountS}==南向港股通深买卖总成交额:${str.sgtBuySellTotalAmountS}`)
//           console.info(`北向沪股通每日初始额度:${str.hgtInitialQuotaN}==北向沪股通日中剩余额度:${str.hgtRemainingQuotaN}==北向沪股通总买入成交额:${str.hgtTotalBuyAmountN}==北向沪股通总卖出成交额:${str.hgtTotalSellAmountN}==北向沪股通买卖总成交额:${str.hgtBuySellTotalAmountN}==北向深股通每日初始额度:${str.sgtInitialQuotaN}==北向深股通日中剩余额度:${str.sgtRemainingQuotaN}==北向深股通总买入成交额:${str.sgtTotalBuyAmountN}==北向深股通总卖出成交额:${str.sgtTotalSellAmountN}==北向深股通买卖总成交额:${str.sgtBuySellTotalAmountN}`)
//         }
//       },
//       onFail: (err: ErrorInfo) => {
//         console.info("HSAmountAllResponse error:" + err.getMsg());
//       } });
//   }
//   async aboutToAppear() {
//     let recordParam = this.myParams as Record<string, Object>;
//     this.title = recordParam['title'] as string;
//     this.param = recordParam['param'] as Record<string, Object>;
//     this.request = RequestMap[recordParam['request'] as string];
//     this.sendReq()
//   }
//   aboutToDisappear(){
//     clearInterval(this.intervalId)
//   }
// }