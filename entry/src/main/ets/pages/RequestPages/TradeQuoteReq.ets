import router from '@ohos.router'
@Entry
@Component
struct TradeQuoteReq {
  @State message: string = 'Hello World'
  requestList:Array<ListRequestType> = [
    {title: "请求交易行情-SH1001",request: "TradeQuoteReq",param:{code:"600000.sh"}},
    {title: "请求交易行情-SH1002",request: "TradeQuoteReq",param:{code:"900948.sh"}},
    {title: "请求交易行情-SH1006",request: "TradeQuoteReq",param:{code:"688009.sh"}},
    {title: "请求交易行情-SH1100",request: "TradeQuoteReq",param:{code:"513330.sh"}},
    {title: "请求交易行情-SH1300",request: "TradeQuoteReq",param:{code:"204001.sh"}},
    {title: "请求交易行情-SH1400",request: "TradeQuoteReq",param:{code:"000001.sh"}},
    {title: "请求交易行情-SH3002",request: "TradeQuoteReq",param:{code:"10006414.sh"}},
    {title: "请求交易行情-SZ1001",request: "TradeQuoteReq",param:{code:"000001.sz"}},
    {title: "请求交易行情-SZ1002",request: "TradeQuoteReq",param:{code:"200625.sz"}},
    {title: "请求交易行情-SZ1004",request: "TradeQuoteReq",param:{code:"300459.sz"}},
    {title: "请求交易行情-SZ1100",request: "TradeQuoteReq",param:{code:"159792.sz"}},
    {title: "请求交易行情-SZ1300",request: "TradeQuoteReq",param:{code:"131810.sz"}},
    {title: "请求交易行情-SZ1400",request: "TradeQuoteReq",param:{code:"399001.sz"}},
    {title: "请求交易行情-SZ3002",request: "TradeQuoteReq",param:{code:"90002507.sz"}},
    {title: "请求交易行情-BZ1001",request: "TradeQuoteReq",param:{code:"836208.bz"}},
    {title: "请求交易行情-BZ1300",request: "TradeQuoteReq",param:{code:"821003.bz"}},
    {title: "请求交易行情-BZ1400",request: "TradeQuoteReq",param:{code:"899050.bz"}},
    {title: "请求交易行情-HK1000",request: "TradeQuoteReq",param:{code:"01468.hk"}},
    {title: "请求交易行情-HK1100",request: "TradeQuoteReq",param:{code:"03033.hk"}},
    {title: "请求交易行情-HK1300",request: "TradeQuoteReq",param:{code:"04246.hk"}},
    {title: "请求交易行情-HK1400",request: "TradeQuoteReq",param:{code:"HSI.hk"}},
    {title: "请求交易行情-HK1500",request: "TradeQuoteReq",param:{code:"61759.hk"}},
    {title: "请求交易行情-HK1600",request: "TradeQuoteReq",param:{code:"23140.hk"}},
    {title: "请求交易行情-CSI1400",request: "TradeQuoteReq",param:{code:"000902.csi"}},
    {title: "请求交易行情-Area",request: "TradeQuoteReq",param:{code: "F10031.bk"}},
    {title: "请求交易行情-Trade",request: "TradeQuoteReq",param:{code: "A20090.bk"}},
    {title: "请求交易行情-Trade_sw1",request: "TradeQuoteReq",param:{code: "D10032.bk"}},
    {title: "请求交易行情-Trade_sw",request: "TradeQuoteReq",param:{code: "D20167.bk"}},
    {title: "请求交易行情-Notion_szyp",request: "TradeQuoteReq",param:{code: "J10570.bk"}},
    {title: "请求交易行情-Area_szyp",request: "TradeQuoteReq",param:{code: "I10034.bk"}},
    {title: "请求交易行情-Trade_szyp",request: "TradeQuoteReq",param:{code: "H10052.bk"}},
    {title: "请求交易行情-Trade_fz",request: "TradeQuoteReq",param:{code: "G10076.bk"}},
    {title: "请求交易行情-BJ1000",request: "TradeQuoteReq",param:{code: "830899.bj"}},
    {title: "请求交易行情-BJ1400",request: "TradeQuoteReq",param:{code: "899001.bj"}},
    {title: "请求交易行情-CFF",request: "TradeQuoteReq",param:{code: "IO2403-P-3200.cff"}},
    {title: "请求交易行情-SHFE",request: "TradeQuoteReq",param:{code: "al2405C21200.shfe"}},
    {title: "请求交易行情-INE",request: "TradeQuoteReq",param:{code: "bc0001.ine"}},
    {title: "请求交易行情-GB1400",request: "TradeQuoteReq",param:{code: "M00003.gb"}},
    {title: "请求交易行情-GB1001",request: "TradeQuoteReq",param:{code: "AUDUSD.gb"}},
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                router.pushUrl({ url: 'pages/ResponsePages/TradeQuoteResp', params: value });
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