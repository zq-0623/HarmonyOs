import router from '@ohos.router'
import { TickReq,TickResp,ErrorInfo,Request } from 'SseCore'
let RequestMap = {
  "TickReq": new TickReq(),
} as Record<string, Request>

@Entry
@Component
struct TickResponse {
  @State message: string = 'Hello World'
  @State myParams: Object = router.getParams();
  @State autoRefresh: boolean = true; // 开关控制是否进行定时请求
  private title: string = '';
  private request: Request = new Request();
  private param: Record<string, Object> = {};

  build() {
    Column() {
      Text(this.title).padding(5).margin({ bottom: 5 }).fontSize(20).border({ width: 2 }).width('90%')
      // Button("set Level").onClick(() => {
      //   SseSDK.permission().clearHkPermission()
      //   SseSDK.permission().addHkPermission(Permission.HKD1)
      //   let tickReq = new TickReq()
      //   tickReq.stockId = '01468.hk'
      //   tickReq.subtype = '1010'
      //   tickReq.param = '0,100,-1'
      //   tickReq.send({
      //     onSuccess:(resp:TickResp) => {
      //       if (resp && resp.tickItems && resp.tickItems.length > 0 ) {
      //         console.info('headerParams:' + resp.headerParams)
      //         for (let i = 0; i < resp.tickItems.length; i++) {
      //           let str = resp.tickItems.convertToArray()[i]
      //           console.info(`买卖方向：${str.transactionStatus}==交易时间：${str.transactionTime}==交易量：${str.singleVolume}==成交价格：${str.transactionPrice}`)
      //         }
      //       }
      //     },
      //     onFail:(error:ErrorInfo) =>{
      //       console.error("error:" + error)
      //     }
      //   })
      // }).width('80%')
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
      onSuccess: (resp: TickResp) => {
        let date = new Date()
        let endTime = date.getTime()
        console.info('cost ' + (endTime - beginTime))
        this.message = resp.toString();
        if (resp.tickItems) {
          console.info('headerParams:' + resp.headerParams)
          for (let i = 0; i < resp.tickItems.length; i++) {
            let str = resp.tickItems.convertToArray()[i]
            console.info(`买卖方向：${str.transactionStatus}==交易时间：${str.transactionTime}==交易量：${str.singleVolume}==成交价格：${str.transactionPrice}`)
          }
        }
      },
      onFail: (err: ErrorInfo) => {
        console.info("TickRequest error:" + err.getMsg());
      } });

  }

  private startAutoRefresh() {
    this.stopAutoRefresh(); // 先清除可能存在的定时器
    this.intervalId = setInterval(() => {
      if (this.autoRefresh) {
        this.sendReq();
      }
    }, 3000);
  }

  private stopAutoRefresh() {
    if (this.intervalId) {
      clearInterval(this.intervalId);
      this.intervalId = undefined;
    }
  }

  async aboutToAppear() {
    let recordParam = this.myParams as Record<string, Object>;
    this.title = recordParam['title'] as string;
    this.param = recordParam['param'] as Record<string, Object>;
    this.request = RequestMap[recordParam['request'] as string];

    this.sendReq(); // 立即请求一次
    if (this.autoRefresh) {
      this.startAutoRefresh();
    }
  }

  aboutToDisappear() {
    this.stopAutoRefresh();
  }
}