import router from '@ohos.router'
import { ABLinkReq,ErrorInfo,ABLinkResp,Request, ABLinkItem} from 'SseCore'
let RequestMap = {
  "ABLinkReq": new ABLinkReq(),
} as Record<string, Request>
@Entry
@Component
struct ABLinkResponse {
  @State message: string = 'Hello World'
  @State myParams: Object = router.getParams();
  @State autoRefresh: boolean = true; // 开关控制是否进行定时请求
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
    this.request.send({
      onSuccess: (resp: ABLinkResp) => {
        this.message = resp.toString();   // 输出response到手机屏幕  string类型
        if (resp.item) {
          let str = resp.item
          console.debug(`代码:${str.code}==名称:${str.name}==市场:${str.market}==类别:${str.subtype}==最新价:${str.lastPrice}==昨收价:${str.preClosePrice}==涨跌:${str.change}==涨幅:${str.changeRate}==	AB溢价率:${str.premiumRateAB}==BA溢价率:${str.premiumRateBA}`)
          // expect(str.code).assertEqual()
        }
      },
      onFail: (err: ErrorInfo) => {
        console.debug("AHListRequest error:" + err.getMsg());
      } });

    // const startContinuousRequest = () => {
    //   // 每5秒发送一次请求
    //   const intervalId = setInterval(() => {
    //     this.request.send({
    //       onSuccess: (resp: ABLinkResp) => {
    //         this.message = resp.toString();
    //         if (resp.item) {
    //           let str:ABLinkItem = resp.item;
    //           console.debug(`代码:${str.code}==名称:${str.name}==市场:${str.market}==类别:${str.subtype}==最新价:${str.lastPrice}==昨收价:${str.preClosePrice}==涨跌:${str.change}==涨幅:${str.changeRate}==AB溢价率:${str.premiumRateAB}==BA溢价率:${str.premiumRateBA}`);
    //         }
    //       },
    //       onFail: (err: ErrorInfo) => {
    //         console.debug("AHListRequest error:" + err.getMsg());
    //       }
    //     });
    //   }, 5000); // 5000毫秒 = 5秒
    //
    //   // 返回 intervalId 以便后续可以清除定时器
    //   return intervalId;
    // };

    // 启动持续请求
    // const requestId = startContinuousRequest();

    // 如果需要停止请求，可以使用 clearInterval(requestId);
    // clearInterval(requestId);

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

