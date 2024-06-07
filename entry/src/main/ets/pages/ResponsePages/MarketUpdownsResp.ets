import router from '@ohos.router'
import { MarketUpdownsReq,ErrorInfo,MarketUpdownsResp,Request } from 'SseCore'
let RequestMap = {
  "MarketUpdownsReq": new MarketUpdownsReq(),
} as Record<string, Request>
@Entry
@Component
struct MarketUpdownsResponse {
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
      onSuccess: (resp: MarketUpdownsResp) => {
        let date = new Date()
        let endTime = date.getTime()
        console.info('cost ' + (endTime - beginTime))
        this.message = resp.toString();   // 输出response到手机屏幕  string类型
        if (resp) {
          console.info("时间："+ resp.datetime)
          console.info("上涨家数："+ resp.advanceCount)
          console.info("下跌家数："+ resp.declineCount)
          console.info("平盘家数："+ resp.equalCount)
          console.info("涨停家数："+ resp.limitUpCount)
          console.info("跌停家数："+ resp.limitDownCount)
          console.info("昨日统计时间："+ resp.preDatetime)
          console.info("昨日上涨家数："+ resp.preAdvanceCount)
          console.info("昨日下跌家数："+ resp.preDeclineCount)
          console.info("昨日平盘家数："+ resp.preEqualCount)
          console.info("昨日涨停家数："+ resp.preLimitUpCount)
          console.info("昨日跌停家数："+ resp.preLimitDownCount)
          console.info("五日平均涨停家数："+ resp.fiveAverageLimitCount)
          console.info("区间涨跌家数："+ resp.riseFallRange)
        }
      },
      onFail: (err: ErrorInfo) => {
        console.info("MarketUpdownsResponse error:" + err.getMsg());
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