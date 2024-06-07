import router from '@ohos.router'
@Entry
@Component
struct TradeDateReq {
  @State message: string = 'Hello World'
  requestList:Array<ListRequestType> = [
    {title: "传空",request: "TradeDateReq",param:{market:""}},
    {title: "不传参数",request: "TradeDateReq"},
    {title: "传不存在市场",request: "TradeDateReq",param:{market:"AB"}},
    {title: "市场当年交易日-SH",request: "TradeDateReq",param:{market:"SH"}},
    {title: "市场当年交易日-SZ",request: "TradeDateReq",param:{market:"SZ"}},
    {title: "市场当年交易日-BJ",request: "TradeDateReq",param:{market:"BJ"}},
    {title: "市场当年交易日-BZ",request: "TradeDateReq",param:{market:"BZ"}},
    {title: "市场当年交易日-HK",request: "TradeDateReq",param:{market:"HK"}},
    {title: "市场当年交易日-SHHK",request: "TradeDateReq",param:{market:"SHHK"}},
    {title: "市场当年交易日-SZHK",request: "TradeDateReq",param:{market:"SZHK"}},
    {title: "市场当年交易日-CFF",request: "TradeDateReq",param:{market:"CFF"}},
    {title: "市场当年交易日-CZCE",request: "TradeDateReq",param:{market:"CZCE"}},
    {title: "市场当年交易日-DCE",request: "TradeDateReq",param:{market:"DCE"}},
    {title: "市场当年交易日-HKSH",request: "TradeDateReq",param:{market:"HKSH"}},
    {title: "市场当年交易日-HKSZ",request: "TradeDateReq",param:{market:"HKSZ"}},
    {title: "市场当年交易日-多市场",request: "TradeDateReq",param:{market:"SH,SZ,BJ,BZ,HK,SHHK,SZHK,CFF,CZCE,DCE,HKSH,HKSZ"}},
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                  router.pushUrl({ url: 'pages/ResponsePages/TradeDateResp', params: value });
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
  market?: string
}