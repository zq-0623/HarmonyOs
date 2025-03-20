import router from '@ohos.router'
import { BidChartReq,ErrorInfo,BidChartResp,Request, BidItem } from 'SseCore'
let RequestMap = {
  "BidChartReq": new BidChartReq(),
} as Record<string, Request>
@Entry
@Component
struct BidChartResponse {
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
    let date = new Date()
    let beginTime = date.getTime()
    this.request.send({
      onSuccess: (resp: BidChartResp) => {
        let date = new Date()
        let endTime = date.getTime()
        console.info('cost ' + (endTime - beginTime))
        this.message = resp.toString();
        console.info("指数交易时间：" + resp.systemDatetime)
        console.info("总点数：" + resp.tickCount)
        if (resp.bidItems && resp.bidItems.length > 0)
          for (let i = 0; i < resp.bidItems.length; i++) {
            let str:BidItem = resp.bidItems.convertToArray()[i]
            console.info(`时间:${str.datetime}==最新价:${str.lastPrice}==参考价:${str.referencePrice}==买一:${str.buyVolume1}==买二:${str.buyVolume2}==卖一:${str.sellVolume1}==卖二:${str.sellVolume2}`)
          }
        },
      onFail: (err: ErrorInfo) => {
        console.info("BidChartRequest error:" + err.getMsg());
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