import router from '@ohos.router'
import { QuoteDetailReq,UKQuoteReq,SearchReq,SearchReqV2,TradeQuoteReq,QuoteReq,CateSortingReq
,ChartReq,L2TickReq,L2TickDetailReq,Request,TickReq,HistoryChartReq,PriceVolumeReq,OHLCReq,SectionQuoteReq,SectionSortingReq,
  MarketUpdownsReq,ChartIndexReq,OHLCIndexReq,UnderlyingStockReq,ExpireMonthReq,OptionTReq,OptionReq,BidChartReq,
  ABLinkReq,AHLinkReq,DRLinkReq,KZZLinkReq,AHListReq,CategoryCodeReq,DRListReq,ABListReq,KZZListReq,IndexUpdownsReq,
  HKStockInfoReq,SubnewStockReq,SubnewBondReq,TradeDateReq,ZTSortingReq,KZZInfoReq,MarketOverviewReq,VolumeReq,
  L2TickEntrustReq,L2TickRestoreReq,CompoundUpdownsReq } from 'SseCore'

let RequestMap = {
  "QuoteDetailReq": new QuoteDetailReq(),
  "TradeQuoteReq": new TradeQuoteReq(),
  "QuoteReq": new QuoteReq(),
  "UKQuoteReq": new UKQuoteReq(),
  "SearchReq": new SearchReq(),
  "SearchReqV2": new SearchReqV2(),
  "CateSortingReq": new CateSortingReq(),
  "ChartReq": new ChartReq(),
  "TickReq": new TickReq(),
  "L2TickReq": new L2TickReq(),
  "L2TickDetailReq": new L2TickDetailReq(),
  "HistoryChartReq": new HistoryChartReq(),
  "PriceVolumeReq": new PriceVolumeReq(),
  "OHLCReq": new OHLCReq(),
  "SectionQuoteReq": new SectionQuoteReq(),
  "SectionSortingReq": new SectionSortingReq(),
  // "HSAmountAllReq": new HSAmountAllReq(),   // 下掉
  // "TongLineReq": new TongLineReq(),   // 下掉
  // "HKTLineReq": new HKTLineReq(),   // 下掉
  "CompoundUpdownsReq": new CompoundUpdownsReq(),
  "MarketUpdownsReq": new MarketUpdownsReq(),
  "ChartIndexReq": new ChartIndexReq(),
  "OHLCIndexReq": new OHLCIndexReq(),
  "UnderlyingStockReq": new UnderlyingStockReq(),
  "ExpireMonthReq": new ExpireMonthReq(),
  "OptionTReq": new OptionTReq(),
  "OptionReq": new OptionReq(),
  "BidChartReq": new BidChartReq(),
  "ABLinkReq": new ABLinkReq(),
  "AHLinkReq": new AHLinkReq(),
  "DRLinkReq": new DRLinkReq(),
  "KZZLinkReq": new KZZLinkReq(),
  "CategoryCodeReq" : new CategoryCodeReq(),
  "AHListReq" : new AHListReq(),
  "DRListReq" : new DRListReq(),
  "ABListReq" : new ABListReq(),
  "KZZListReq" : new KZZListReq(),
  "IndexUpdownsReq" : new IndexUpdownsReq(),
  "HKStockInfoReq" : new HKStockInfoReq(),
  "SubnewStockReq" : new SubnewStockReq(),
  "SubnewBondReq" : new SubnewBondReq(),
  "TradeDateReq" : new TradeDateReq(),
  "ZTSortingReq" : new ZTSortingReq(),
  "KZZInfoReq" : new KZZInfoReq(),
  "MarketOverviewReq" : new MarketOverviewReq(),
  "VolumeReq" : new VolumeReq(),
  "L2TickEntrustReq" : new L2TickEntrustReq(),
  "L2TickRestoreReq" : new L2TickRestoreReq(),

} as Record<string, Request>

@Entry
@Component
struct ApiDetail {
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
    // let date = new Date()
    // let beginTime = date.getTime()
    // this.request.send({
    //   onSuccess: (resp: Response) => {   // 快照响应
    //     let date = new Date()
    //     let endTime = date.getTime()
    //     console.info('cost ' + (endTime - beginTime))
    //     this.message = resp.toString();   // 输出response到手机屏幕  string类型
    //     // if (resp.quoteItems && resp.addValueModels) {
    //     //   console.info('代码：' + resp.quoteItems.convertToArray()[0].id)
    //     //   // console.info('增值数据：' + resp.addValueModels.convertToArray()[0].code)
    //     // }
    //   },
    //   onFail: (err: ErrorInfo) => {
    //     console.info("QuoteDetailReq onFail:" + err.getMsg());
    //   } });

  }

  async aboutToAppear() {

    let recordParam = this.myParams as Record<string, Object>;
    this.title = recordParam['title'] as string;
    this.param = recordParam['param'] as Record<string, Object>;
    this.request = RequestMap[recordParam['request'] as string];


    this.sendReq()
   // this.intervalId = setInterval(()=>{
   //   this.sendReq()
   //  }, 5000)

  }

  aboutToDisappear(){
    clearInterval(this.intervalId)
  }
}