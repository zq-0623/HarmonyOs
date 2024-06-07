// import router from '@ohos.router'
// import { ABLinkReq,ErrorInfo,ABLinkResp,Request} from 'SseCore'
// let RequestMap = {
//   "ABLinkReq": new ABLinkReq(),
// } as Record<string, Request>
// @Entry
// @Component
// struct ABLinkResponse {
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
//       onSuccess: (resp: ABLinkResp) => {   // 快照响应
//         let date = new Date()
//         let endTime = date.getTime()
//         console.info('cost ' + (endTime - beginTime))
//         this.message = resp.toString();   // 输出response到手机屏幕  string类型
//         if (resp.item) {
//           console.info("代码：" + resp.item.code)
//           console.info("名称：" + resp.item.name)
//           console.info("市场：" + resp.item.market)
//           console.info("类别：" + resp.item.subtype)
//           console.info("最新价：" + resp.item.lastPrice)
//           console.info("昨收价：" + resp.item.preClosePrice)
//           console.info("涨跌：" + resp.item.change)
//           console.info("涨幅：" + resp.item.changeRate)
//           console.info("AB溢价率：" + resp.item.premiumRateAB)
//           console.info("BA溢价率：" + resp.item.premiumRateBA)
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

import { ErrorInfo, ABLinkResp, Request } from 'SseCore'
import { RequestMap, sendRequest } from '../../common/BaseResponse'
import router from '@ohos.router'


@Entry
@Component
struct ABLinkResponse {
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
  private sendReq() {
    let request = RequestMap["ABLinkReq"];
    sendRequest(request, this.param, (resp: ABLinkResp) => {
      this.message = resp.toString();
      if (resp.item) {
        console.info("代码：" + resp.item.code)
        console.info("名称：" + resp.item.name)
        console.info("市场：" + resp.item.market)
        console.info("类别：" + resp.item.subtype)
        console.info("最新价：" + resp.item.lastPrice)
        console.info("昨收价：" + resp.item.preClosePrice)
        console.info("涨跌：" + resp.item.change)
        console.info("涨幅：" + resp.item.changeRate)
        console.info("AB溢价率：" + resp.item.premiumRateAB)
        console.info("BA溢价率：" + resp.item.premiumRateBA)
        console.info("3333333333333333333333：" )
      }
    }, (err: ErrorInfo) => {
      console.info("ABLinkResponse error:" + err.getMsg());
    });
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