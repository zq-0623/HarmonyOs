// import router from '@ohos.router'
// import { TongLineReq,ErrorInfo,TongLineResp,Request } from 'SseCore'
// let RequestMap = {
//   "TongLineReq": new TongLineReq(),
// } as Record<string, Request>
// @Entry
// @Component
// struct TongLineResponse {
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
//       onSuccess: (resp: TongLineResp) => {
//         let date = new Date()
//         let endTime = date.getTime()
//         console.info('cost ' + (endTime - beginTime))
//         this.message = resp.toString();
//         if (resp.items) {
//           for (let i = 0; i < resp.items.length; i++) {
//             let str = resp.items.convertToArray()[i]
//             console.info(`日期:${str.datetime}==港股通(沪)/沪深股通(沪)初始额度:${str.SHInitialAmount}==港股通(沪)/沪深股通(沪)剩余额度:${str.SHRemainingAmount}==港股通(沪)/沪深股通(沪)净流入:${str.SHInflowAmount}==港股通(深)/沪深股通(深)初始额度:${str.SZInitialAmount}==港股通(深)/沪深股通(深)剩余额度:${str.SZRemainingAmount}==港股通(深)/沪深股通(深)净流入:${str.SZInflowAmount}==沪深合计净流入:${str.SHSZInflowAmount}`)
//           }
//         }
//       },
//       onFail: (err: ErrorInfo) => {
//         console.info("AHListRequest error:" + err.getMsg());
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