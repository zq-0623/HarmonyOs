import router from '@ohos.router'
import {
  QuoteCustomField
} from 'SseCore'
import { CateType,SortType,FuturesQuoteField,CateSortingReqType } from 'SseCore'
import { addValue } from '../../common/AddValueCustomField'
import { QuoteFiled } from '../../common/quoteCustomField'

@Entry
@Component
struct CateSortingReq {
  @State message: string = 'Hello World'
  requestList:Array<ListRequestType> = [
      {title: "分类涨跌幅排行-SHETF",request: "CateSortingReq",param:{cateId: CateType.SH1120, param: `1,100,${SortType.quote_LAST_PRICE},0,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypeSection}},
      {title: "分类涨跌幅排行-SZETF",request: "CateSortingReq",param:{cateId: CateType.SZ1120, param: `1,100,${SortType.quote_LAST_PRICE},0,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypeSection}},
      {title: "分类涨跌幅排行-SH1001",request: "CateSortingReq",param:{cateId: CateType.SH1001, param: `1,1000,${SortType.quote_LAST_PRICE},0,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypeSection}},
      {title: "分类涨跌幅排行-SZ120",request: "CateSortingReq",param:{cateId: CateType.SZ1120, param: `0,1000,${SortType.quote_LAST_PRICE},0,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypeSection}},
    {title: "分类涨跌幅排行-SH1002",request: "CateSortingReq",param:{cateId: CateType.SH1002, param: `2,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypeSection}},
    {title: "分类涨跌幅排行-SH1006",request: "CateSortingReq",param:{cateId: CateType.SH1006, param: `3,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypeSection}},
    {title: "分类涨跌幅排行-SH1100",request: "CateSortingReq",param:{cateId: CateType.SH1100, param: `4,51,${SortType.quote_STATE},1,0`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypeSection}},
    {title: "分类涨跌幅排行-SH1300",request: "CateSortingReq",param:{cateId: CateType.SH1300, param: `0,52,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypeSection}},
    {title: "分类涨跌幅排行-SH1400",request: "CateSortingReq",param:{cateId: CateType.SH1400, param: `0,60,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-SH8100",request: "CateSortingReq",param:{cateId: CateType.SH8100, param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-SH9800",request: "CateSortingReq",param:{cateId: CateType.SHCXG, param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-CSI1400",request: "CateSortingReq",param:{cateId: CateType.CSI1400, param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-SZ1001",request: "CateSortingReq",param:{cateId: CateType.SZ1001, param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-SZ1002",request: "CateSortingReq",param:{cateId: CateType.SZ1002, param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-SZ1004",request: "CateSortingReq",param:{cateId: CateType.SZ1004, param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-SZ1100",request: "CateSortingReq",param:{cateId: CateType.SZ1100, param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-SZ1300",request: "CateSortingReq",param:{cateId: CateType.SZ1300, param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-SZ1400",request: "CateSortingReq",param:{cateId: CateType.SZ1400, param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-SZ9800",request: "CateSortingReq",param:{cateId: CateType.SZCXG, param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-SZ8100",request: "CateSortingReq",param:{cateId: CateType.SZ8100, param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-BZ1001",request: "CateSortingReq",param:{cateId: CateType.BZ1001, param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-BZ1300",request: "CateSortingReq",param:{cateId: CateType.BZ1300, param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-BJ1000",request: "CateSortingReq",param:{cateId: CateType.BJ1012, param: `0,100,${SortType.quote_VOLUME},1,1`,quoteColumns:[QuoteCustomField.quote_NAME,QuoteCustomField.quote_RECEIPTS],addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-HKUA2301",request: "CateSortingReq",param:{cateId: CateType.HKUA2301, param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-SZHK",request: "CateSortingReq",param:{cateId: CateType.SZHK, param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-HKHGT",request: "CateSortingReq",param:{cateId: CateType.HKHGT, param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-HKSGT",request: "CateSortingReq",param:{cateId: CateType.HKSGT, param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-SHHGT",request: "CateSortingReq",param:{cateId: CateType.SHHGT, param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-SZSGT",request: "CateSortingReq",param:{cateId: CateType.SZSGT, param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-HKGGT",request: "CateSortingReq",param:{cateId: CateType.HKGGT, param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-HKTong",request: "CateSortingReq",param:{cateId: CateType.HKTong, param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-HKGGTEQTY",request: "CateSortingReq",param:{cateId: CateType.HKGGTEQTY, param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-HKGGTTRST",request: "CateSortingReq",param:{cateId: CateType.HKGGTTRST, param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-SZSGTEQTY",request: "CateSortingReq",param:{cateId: CateType.SZSGTEQTY, param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-SZSGTTRST",request: "CateSortingReq",param:{cateId: CateType.SZSGTTRST, param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-SHHGTEQTY",request: "CateSortingReq",param:{cateId: CateType.SHHGTEQTY, param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-SHHGTTRST",request: "CateSortingReq",param:{cateId: CateType.SHHGTTRST, param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-HK1010",request: "CateSortingReq",param:{cateId: CateType.HK1010, param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-HK1000",request: "CateSortingReq",param:{cateId: CateType.HK1000, param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-HK1300",request: "CateSortingReq",param:{cateId: CateType.HK1300, param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},

    {title: "分类涨跌幅排行-HK1400",request: "CateSortingReq",param:{cateId: CateType.HK1400, param: `0,20,${SortType.quote_LOW_PRICE},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypeSection}},

    {title: "分类涨跌幅排行-HK1500",request: "CateSortingReq",param:{cateId: CateType.HK1500, param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-HK1600",request: "CateSortingReq",param:{cateId: CateType.HK1600, param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-GB1400",request: "CateSortingReq",param:{cateId: CateType.GB1400, param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-GB1001",request: "CateSortingReq",param:{cateId: CateType.GB1001, param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-CFF_ALL",request: "CateSortingReq",param:{cateId: CateType.CFF_ALL, param: `0,50,${FuturesQuoteField.volume},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-DCE_ALL",request: "CateSortingReq",param:{cateId: CateType.DCE_ALL, param: `1,50,${FuturesQuoteField.volume},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-CZCE_ALL",request: "CateSortingReq",param:{cateId: CateType.CZCE_ALL, param: `0,50,${FuturesQuoteField.volume},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-SHFE_ALL",request: "CateSortingReq",param:{cateId: CateType.SHFE_ALL, param: `0,50,${FuturesQuoteField.volume},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-INE_ALL",request: "CateSortingReq",param:{cateId: CateType.INE_ALL, param: `0,50,${FuturesQuoteField.volume},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-UK1540",request: "CateSortingReq",param:{cateId: CateType.UK1540, param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-SH",request: "CateSortingReq",param:{cateId:"000001.sh", param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-SZ",request: "CateSortingReq",param:{cateId:"399001.sz", param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-CSI",request: "CateSortingReq",param:{cateId:"930781.csi", param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-BZ",request: "CateSortingReq",param:{cateId:"899050.bz", param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-HK",request: "CateSortingReq",param:{cateId:"HSI.hk", param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-BJ",request: "CateSortingReq",param:{cateId:"899001.bj", param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-FZ1401",request: "CateSortingReq",param:{cateId:"FZ1401", param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-FZ0701",request: "CateSortingReq",param:{cateId:"FZ0701", param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
    {title: "分类涨跌幅排行-FZ0201",request: "CateSortingReq",param:{cateId:"FZ0201", param: `0,50,${SortType.quote_CHANGERATE3},1,1`,quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns,type:CateSortingReqType.CateSortingReqTypePage}},
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                  router.pushUrl({ url: 'pages/ResponsePages/CateSortingResp', params: value });
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
  cateId?: string;
  param?: string;
  reqType?: CateSortingReqType
  quoteColumns?: number[]
  addValueColumns?: number[]
  type?: CateSortingReqType
  FuturesQuote?:FuturesQuoteField
}