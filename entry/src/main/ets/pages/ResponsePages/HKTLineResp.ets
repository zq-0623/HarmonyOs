// import router from '@ohos.router'
// import { HKTLineReq,ErrorInfo,HKTLineResp,Request } from 'SseCore'
//
// let RequestMap = {
//   "HKTLineReq": new HKTLineReq(),
// } as Record<string, Request>
// @Entry
// @Component
// struct HKTLineResponse {
//   @State message: string = 'Hello World'
//   @State myParams: Object = router.getParams();
  @State autoRefresh: boolean = true; // 开关控制是否进行定时请求
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
//       onSuccess: (resp: HKTLineResp) => {
//         let date = new Date()
//         let endTime = date.getTime()
//         console.info('cost ' + (endTime - beginTime))
//         this.message = resp.toString();
//         if (resp.items) {
//           for (let i = 0; i < resp.items.length; i++) {
//             let str = resp.items.convertToArray()[i]
//             console.info(`日期:${str.datetime}==南北向资金沪买入成交额:${str.SHBuyAmount}==南北向资金沪卖出成交额:${str.SHSellAmount}==南北向资金沪净买入成交额:${str.SHInflowAmount}==南北向资金深买入成交额:${str.SZBuyAmount}==南北向资金深卖出成交额:${str.SZSellAmount}==南北向资金深净买入成交额:${str.SZInflowAmount}==沪深合计净买入:${str.SHSZInflowAmount}`)
//           }
//         }
//       },
//       onFail: (err: ErrorInfo) => {
//         console.info("HKTLineResponse error:" + err.getMsg());
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