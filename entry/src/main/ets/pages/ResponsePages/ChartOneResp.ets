import router from '@ohos.router'
import { ChartReq,ErrorInfo,ChartResp,Request, OHLCItem } from 'SseCore'
let RequestMap = {
  "ChartReq": new ChartReq(),
} as Record<string, Request>

@Entry
@Component
struct ChartOneResponse {
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
      onSuccess: (resp: ChartResp) => {
        this.message = resp.toString();
        console.info("市场交易时间：" + resp.systemDatetime)
        if (resp.tradeDates) {
          console.info("日期列表：" + resp.tradeDates.convertToArray()[0])
        }
        console.info("连续竞价总点数：" + resp.tickCount)
        console.info("盘后交易总点数：" + resp.afTickCount)
        console.info("交易时间段：" + resp.timezones)
        if (resp.referencePrices){
          resp.referencePrices.forEach((key:string, value:string) => {
            console.info(`时间:${value}==价格:${key}`)
          })
        }
        if (resp.OHLCItems) {
          for (let i = 0; i < resp.OHLCItems.length; i++) {
            let str:OHLCItem = resp.OHLCItems.convertToArray()[i]
            console.info(`交易时间:${str.datetime}==开盘价:${str.openPrice}==最高价:${str.highPrice}==最低价:${str.lowPrice}==收盘价:${str.closePrice}==交易量:${str.tradeVolume}==均价:${str.averagePrice}==参考价/昨收价:${str.referencePrice}==成交额:${str.amount}==红绿柱MD值(仅指数):${str.rgbar}==持仓量(中金所):${str.openInterest}==基金净值:${str.IOPV}==基金净值参考价:${str.referenceIOPVPrice}==量比:${str.volumeRatio}==总委买:${str.entrustBuyVolume}==总委卖:${str.entrustSellVolume}==委差:${str.entrustDiff}`)
          }
        }
        if (resp.AFItems) {
          for (let i = 0; i < resp.AFItems.length; i++) {
            for (let i = 0; i < resp.AFItems.length; i++) {
              let str:OHLCItem = resp.AFItems.convertToArray()[i]
              console.info(`交易时间:${str.datetime}==开盘价:${str.openPrice}==最高价:${str.highPrice}==最低价:${str.lowPrice}==收盘价:${str.closePrice}==交易量:${str.tradeVolume}==均价:${str.averagePrice}==参考价/昨收价:${str.referencePrice}`)
            }
          }
        }
        if (resp.referenceIOPVPrices) {
          resp.referenceIOPVPrices.forEach((key:string,value:string) =>{
            console.info(`时间:${value}==价格:${key}`)
          })
        }
      },
      onFail: (err: ErrorInfo) => {
        console.info("ChartOneRequest error:" + err.getMsg());
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