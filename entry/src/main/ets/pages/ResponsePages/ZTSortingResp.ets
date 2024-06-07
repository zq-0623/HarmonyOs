import router from '@ohos.router'
import { ZTSortingReq,ErrorInfo,Request,ZTSortingResp } from 'SseCore'
let RequestMap = {
  "ZTSortingReq": new ZTSortingReq(),
} as Record<string, Request>
@Entry
@Component
struct ZTSortingResponse {
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
      onSuccess: (resp: ZTSortingResp) => {
        let date = new Date()
        let endTime = date.getTime()
        console.info('cost ' + (endTime - beginTime))
        this.message = resp.toString();
        if (resp.items) {
          for (let i = 0; i < resp.items.length; i++) {
            let str = resp.items[i]
            console.info(`涨停时间:${str.ztdateTime}==代码:${str.code}==名称:${str.name}==行情时间:${str.dateTime}==市场别:${str.market}==次类别:${str.subtype}==最新价:${str.lastPrice}==昨收价:${str.preClosePrice}==涨跌幅:${str.changeRate}==五档委买量:${str.buyVolumes}==融资标识:${str.bu}==融券标识:${str.su}`)
          }
        }
      },
      onFail: (err: ErrorInfo) => {
        console.info("ZTSortingResponse error:" + err.getMsg());
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