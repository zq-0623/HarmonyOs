import router from '@ohos.router'
import { UKQuoteReq ,ErrorInfo,UKQuoteResp,Request} from 'SseCore'
let RequestMap = {
  "UKQuoteReq": new UKQuoteReq(),
} as Record<string, Request>
@Entry
@Component
struct UKQuoteResponse {
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
      onSuccess: (resp: UKQuoteResp) => {   // 快照响应
        let date = new Date()
        let endTime = date.getTime()
        console.info('cost ' + (endTime - beginTime))
        this.message = resp.toString();   // 输出response到手机屏幕  string类型
        if (resp.items) {
          console.info("代码：" + resp.items[0].code)
          console.info("名称：" + resp.items[0].name)
          console.info("次类别：" + resp.items[0].subtype)
          console.info("最新价：" + resp.items[0].lastPrice)
          console.info("开盘价：" + resp.items[0].openPrice)
          console.info("日期：" + resp.items[0].datetime)
          console.info("成交量：" + resp.items[0].volume)
          console.info("成交额：" + resp.items[0].amount)
          console.info("成交笔数：" + resp.items[0].transactionNumber)
          console.info("收盘买一价：" + resp.items[0].buyPrice)
          console.info("收盘卖一价：" + resp.items[0].sellPrice)
          console.info("日内最高价(自动交易)：" + resp.items[0].highPriceDayAuto)
          console.info("日内最高价(非自动交易)：" + resp.items[0].highPriceNonDayAuto)
          console.info("日内最低价(自动交易)：" + resp.items[0].lowPriceDayAuto)
          console.info("日内最低价(非自动交易)：" + resp.items[0].lowPriceNonDayAuto)
          console.info("近一年来最高价(自动交易)：" + resp.items[0].highPriceYearAuto)
          console.info("近一年来最高价(非自动交易)：" + resp.items[0].highPriceNonYearAuto)
          console.info("近一年来最低价(自动交易),：" + resp.items[0].lowPriceYearAuto)
          console.info("近一年来最低价(非自动交易)：" + resp.items[0].lowPriceNonYearAuto)
          console.info("近一年来最高价出现日期(自动交易)：" + resp.items[0].highPriceTimeYearAuto)
          console.info("近一年来最高价出现日期(非自动交易)：" + resp.items[0].highPriceTimeYearNonAuto)
          console.info("近一年来最低价出现日期(自动交易)：" + resp.items[0].lowPriceTimeYearAuto)
          console.info("近一年来最低价出现日期(非自动交易)：" + resp.items[0].lowPriceTimeYearNonAuto)
          console.info("均价：" + resp.items[0].averagePrice)
          console.info("币种：" + resp.items[0].currency)
          console.info("上市日期：" + resp.items[0].listingDate)
          console.info("转换基数：" + resp.items[0].conversionBase)
          console.info("基础证券转换基数：" + resp.items[0].securitiesConversionBase)
          console.info("GDR标识：" + resp.items[0].GDR)
          console.info("CDR标识：" + resp.items[0].DR)
          console.info("GDR基础证券代码 或者 CDR代码：" + resp.items[0].DRStockCode)
          console.info("GDR基础证券名称 或者 CDR名称：" + resp.items[0].DRStockName)
          console.info("GDR基础证券次类别 或者 CDR次类别：" + resp.items[0].DRSubtypes)
          console.info("标的收盘参考价：" + resp.items[0].subjectClosingReferencePrice)
          console.info("溢价：" + resp.items[0].premiumRate)
        }
      },
      onFail: (err: ErrorInfo) => {
        console.info("UKQuoteRequest error:" + err.getMsg());
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