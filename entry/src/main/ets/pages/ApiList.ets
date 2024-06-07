import router from '@ohos.router'
@Entry
@Component
struct ApiList {
  @State message: string = 'Hello World'
  requestList:Array<ListRequestType> = [
    {title: "搜索",request: "SearchReq"},
    {title: "搜索V2",request: "SearchReqV2"},
    {title: "自选行情",request: "QuoteReq"},
    {title: "快照行情",request: "QuoteDetailReq"},
    {title: "UK市场行情快照",request: "UKQuoteReq"},
    {title: "个股所属板块",request: "SectionQuoteReq"},
    {title: "分时走势",request: "ChartOneReq"},
    {title: "五日走势",request: "ChartFiveReq"},
    {title: "历史分时走势",request: "HistoryChartReq"},
    {title: "集合竞价",request: "BidChartReq"},
    {title: "增值走势",request: "ChartIndexReq"},
    {title: "历史K线接口",request:"OHLC"},
    {title: "增值K线",request: "OHLCIndexReq"},
    {title: "请求明细",request: "TickReq"},
    {title: "分类涨跌幅排行",request: "CateSortingReq"},
    {title: "板块排行",request: "SectionSortingReq"},
    {title: "AH股列表",request: "AHListReq"},
    {title: "AH股联动",request: "AHLinkReq"},
    {title: "CDR/GDR联动列表",request: "DRListReq"},
    {title: "CDR/GDR联动",request: "DRLinkReq"},
    {title: "AB股列表",request: "ABListReq"},
    {title: "AB股联动",request: "ABLinkReq"},
    {title: "可转债行情列表",request: "KZZListReq"},
    {title: "可转债联动",request: "KZZLinkReq"},
    {title: "可转债静态信息接口",request: "KZZInfoReq"},
    {title: "沪深京当日涨跌统计数据请求类",request: "MarketUpdownsReq"},
    {title: "当日或30日复盘涨跌请求类",request: "CompoundUpdownsReq"},
    {title: "实时涨停行情统计",request: "ZTSortingReq"},
    {title: "期权行情",request: "OptionReq"},
    {title: "期权T型报价",request: "OptionTReq"},
    {title: "标的证券列表",request: "UnderlyingStockReq"},
    {title: "交割月列表",request: "ExpireMonthReq"},
    {title: "港股波动调节等信息",request: "HKStockInfoReq"},
    {title: "次新股",request: "SubnewStockReq"},
    {title: "次新债列表",request: "SubnewBondReq"},
    {title: "市场当年交易日",request: "TradeDateReq"},
    {title: "板块类别个股列表",request: "CategoryCodeReq"},
    {title: "市场总览",request: "MarketOverviewReq"},
    {title: "L2单独分笔明细",request: "L2TickReq"},
    {title: "L2单独逐笔明细",request: "L2TickDetailReq"},
    {title: "分价",request: "PriceVolumeReq"},
    {title: "分量",request: "VolumeReq"},
    {title: "L2plus逐笔委托",request: "L2TickEntrustReq"},
    {title: "L2plus逐笔还原",request: "L2TickRestoreReq"},
    {title: "推送",request: "Push"},
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                if (value.request === "Push") {
                  router.pushUrl({url: 'pages/RequestPages/TCPPush'})
                }
                if (value.request === "QuoteDetailReq") {
                  router.pushUrl({url: 'pages/RequestPages/QuoteDetailReq'})
                }
                if (value.request === "QuoteReq") {
                  router.pushUrl({url: 'pages/RequestPages/QuoteReq'})
                }
                if (value.request === "UKQuoteReq") {
                  router.pushUrl({url: 'pages/RequestPages/UKQuoteReq'})
                }
                if (value.request === "SearchReq") {
                  router.pushUrl({url: 'pages/RequestPages/SearchReq'})
                }
                if (value.request === "SearchReqV2") {
                  router.pushUrl({url: 'pages/RequestPages/SearchReqV2'})
                }
                if (value.request === "CateSortingReq") {
                  router.pushUrl({url: 'pages/RequestPages/CateSortingReq'})
                }
                if (value.request === "ChartOneReq") {
                  router.pushUrl({url: 'pages/RequestPages/ChartOneReq'})
                }
                if (value.request === "ChartFiveReq") {
                  router.pushUrl({url: 'pages/RequestPages/ChartFiveReq'})
                }
                if (value.request === "BidChartReq") {
                  router.pushUrl({url: 'pages/RequestPages/BidChartReq'})
                }
                if (value.request === "HistoryChartReq") {
                  router.pushUrl({url: 'pages/RequestPages/HistoryChartReq'})
                }
                if (value.request === "TickReq") {
                  router.pushUrl({url: 'pages/RequestPages/TickReq'})
                }
                if (value.request === "L2TickReq") {
                  router.pushUrl({url: 'pages/RequestPages/L2TickReq'})
                }
                if (value.request === "L2TickDetailReq") {
                  router.pushUrl({url: 'pages/RequestPages/L2TickDetailReq'})
                }
                if (value.request === "PriceVolumeReq") {
                  router.pushUrl({url: 'pages/RequestPages/PriceVolumeReq'})
                }
                if (value.request === "OHLC"){
                  router.pushUrl({url:'pages/RequestPages/OHLCReq'})
                }
                if (value.request === "SectionQuoteReq") {
                  router.pushUrl({url: 'pages/RequestPages/SectionQuoteReq'})
                }
                if (value.request === "SectionSortingReq") {
                  router.pushUrl({url: 'pages/RequestPages/SectionSortingReq'})
                }
                if (value.request === "CompoundUpdownsReq") {
                  router.pushUrl({url: 'pages/RequestPages/CompoundUpdownsReq'})
                }
                if (value.request === "MarketUpdownsReq") {
                  router.pushUrl({url: 'pages/RequestPages/MarketUpdownsReq'})
                }
                if (value.request === "ChartIndexReq") {
                  router.pushUrl({url: 'pages/RequestPages/ChartIndexReq'})
                }
                if (value.request === "OHLCIndexReq") {
                  router.pushUrl({url: 'pages/RequestPages/OHLCIndexReq'})
                }
                if (value.request === "OptionReq") {
                  router.pushUrl({url: 'pages/RequestPages/OptionReq'})
                }
                if (value.request === "OptionTReq") {
                  router.pushUrl({url: 'pages/RequestPages/OptionTReq'})
                }
                if (value.request === "UnderlyingStockReq") {
                  router.pushUrl({url: 'pages/RequestPages/UnderlyingStockReq'})
                }
                if (value.request === "ExpireMonthReq") {
                  router.pushUrl({url: 'pages/RequestPages/ExpireMonthReq'})
                }
                if (value.request === "KZZLinkReq") {
                  router.pushUrl({url: 'pages/RequestPages/KZZLinkReq'})
                }
                if (value.request === "AHLinkReq") {
                  router.pushUrl({url: 'pages/RequestPages/AHLinkReq'})
                }
                if (value.request === "DRLinkReq") {
                  router.pushUrl({url: 'pages/RequestPages/DRLinkReq'})
                }
                if (value.request === "ABLinkReq") {
                  router.pushUrl({url: 'pages/RequestPages/ABLinkReq'})
                }
                if (value.request === "CategoryCodeReq") {
                  router.pushUrl({url: 'pages/RequestPages/CategoryCodeReq'})
                }
                if (value.request === "AHListReq") {
                  router.pushUrl({url: 'pages/RequestPages/AHListReq'})
                }
                if (value.request === "DRListReq") {
                  router.pushUrl({url: 'pages/RequestPages/DRListReq'})
                }
                if (value.request === "ABListReq") {
                  router.pushUrl({url: 'pages/RequestPages/ABListReq'})
                }
                if (value.request === "KZZListReq") {
                  router.pushUrl({url: 'pages/RequestPages/KZZListReq'})
                }
                if (value.request === "KZZInfoReq") {
                  router.pushUrl({url: 'pages/RequestPages/KZZInfoReq'})
                }
                if (value.request === "HKStockInfoReq") {
                  router.pushUrl({url: 'pages/RequestPages/HKStockInfoReq'})
                }
                if (value.request === "SubnewStockReq") {
                  router.pushUrl({url: 'pages/RequestPages/SubnewStockReq'})
                }
                if (value.request === "SubnewBondReq") {
                  router.pushUrl({url: 'pages/RequestPages/SubnewBondReq'})
                }
                if (value.request === "TradeDateReq") {
                  router.pushUrl({url: 'pages/RequestPages/TradeDateReq'})
                }
                if (value.request === "ZTSortingReq") {
                  router.pushUrl({url: 'pages/RequestPages/ZTSortingReq'})
                }
                if (value.request === "MarketOverviewReq") {
                  router.pushUrl({url: 'pages/RequestPages/MarketOverviewReq'})
                }
                if (value.request === "VolumeReq") {
                  router.pushUrl({url: 'pages/RequestPages/VolumeReq'})
                }
                if (value.request === "L2TickEntrustReq") {
                  router.pushUrl({url: 'pages/RequestPages/L2TickEntrustReq'})
                }
                if (value.request === "L2TickRestoreReq") {
                  router.pushUrl({url: 'pages/RequestPages/L2TickRestoreReq'})
                }
              }).align(Alignment.Center).width('80%');
            }
          }.width('100%')
        })
      }
    }.padding({top: 50})
  }
}

export  interface ListRequestType {
  title?: string;
  request?: string;
  param?: Params;
}
export  interface Params {
  code?: string;
}