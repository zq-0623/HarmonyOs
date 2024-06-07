import router from '@ohos.router'
import { HKStockInfoReq,ErrorInfo,HKStockInfoResp,Request, HKOddInfoItem } from 'SseCore'
let RequestMap = {
  "HKStockInfoReq": new HKStockInfoReq(),
} as Record<string, Request>
@Entry
@Component
struct HKStockInfoResponse {
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
      onSuccess: (resp: HKStockInfoResp) => {
        let date = new Date()
        let endTime = date.getTime()
        console.info('cost ' + (endTime - beginTime))
        this.message = resp.toString();
        if (resp.item) {
          if (resp.item.oddInfoItems) {
            for (let i = 0; i < resp.item.oddInfoItems.length; i++) {
              let str:HKOddInfoItem = resp.item.oddInfoItems[i]
              console.info(`碎股时间:${str.datetime}==碎股订单编号:${str.orderId}==碎股价格:${str.price}==碎股订单数量:${str.orderQty}==碎股经纪人编号:${str.brokerId}==碎股买卖方向:${str.side}`)
            }
          }
          let info = resp.item
          console.info(`vcm时间:${info.vcmDatetime}==市场调节机制起始时间:${info.vcmStartTime}==市场调节机制结束时间:${info.vcmEndTime}==市场调节机制参考价:${info.vcmRefPrice}==市场调节下限价:${info.vcmLowerPrice}==市场调节上限价${info.vcmUpperPrice}==集合竞价时间:${info.casDatetime}==未能配对买卖盘的方向:${info.casOrdImbQty}==未能配对买卖盘的数量:${info.casOrdImbQty}==参考价格:${info.casRefPrice}==集合竞价状态:${info.callAuctionStatus}==虚拟参考价:${info.virtualRefPrice}==虚拟未匹配:${info.virtualOrdImbQty}==买盘上下限价格区间:${info.buyPriceRange}==卖盘上下限价格区间:${info.sellPriceRange}`)
        }
      },
      onFail: (err: ErrorInfo) => {
        console.info("AHListRequest error:" + err.getMsg());
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