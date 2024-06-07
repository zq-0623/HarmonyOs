import router from '@ohos.router'
@Entry
@Component
struct CategoryCodeReq {   // 新三板，期货不支持
  @State message: string = 'Hello World'
  requestList:Array<ListRequestType> = [
    {title: "板块类别个股列表-SH1001",request: "CategoryCodeReq",param:{code:"SH1001"}},
    {title: "板块类别个股列表-SH1002",request: "CategoryCodeReq",param:{code:"SH1002"}},
    {title: "板块类别个股列表-SH1006",request: "CategoryCodeReq",param:{code:"SH1006"}},
    {title: "板块类别个股列表-SH1100",request: "CategoryCodeReq",param:{code:"SH1100"}},
    {title: "板块类别个股列表-SH1300",request: "CategoryCodeReq",param:{code:"SH1300"}},
    {title: "板块类别个股列表-SH1400",request: "CategoryCodeReq",param:{code:"SH1400"}},
    {title: "板块类别个股列表-SH8100",request: "CategoryCodeReq",param:{code:"SH8100"}},
    {title: "板块类别个股列表-SH3002",request: "CategoryCodeReq",param:{code:"SH3002"}},
    {title: "板块类别个股列表-CSI1400",request: "CategoryCodeReq",param:{code:"CSI1400"}},
    {title: "板块类别个股列表-SZ1001",request: "CategoryCodeReq",param:{code:"SZ1001"}},
    {title: "板块类别个股列表-SZ1002",request: "CategoryCodeReq",param:{code:"SZ1002"}},
    {title: "板块类别个股列表-SZ1004",request: "CategoryCodeReq",param:{code:"SZ1004"}},
    {title: "板块类别个股列表-SZ1100",request: "CategoryCodeReq",param:{code:"SZ1100"}},
    {title: "板块类别个股列表-SZ1300",request: "CategoryCodeReq",param:{code:"SZ1300"}},
    {title: "板块类别个股列表-SZ1400",request: "CategoryCodeReq",param:{code:"SZ1400"}},
    {title: "板块类别个股列表-SZ8100",request: "CategoryCodeReq",param:{code:"SZ8100"}},
    {title: "板块类别个股列表-BZ1001",request: "CategoryCodeReq",param:{code:"BZ1001"}},
    {title: "板块类别个股列表-BZ1300",request: "CategoryCodeReq",param:{code:"BZ1300"}},
    {title: "板块类别个股列表-BZ1400",request: "CategoryCodeReq",param:{code:"BZ1400"}},
    {title: "板块类别个股列表-BJ1000",request: "CategoryCodeReq",param:{code:"BJ1000"}},
    {title: "板块类别个股列表-BJ1400",request: "CategoryCodeReq",param:{code:"BJ1400"}},
    {title: "板块类别个股列表-HKUA2301",request: "CategoryCodeReq",param:{code:"HKUA2301"}},
    {title: "板块类别个股列表-SZHK",request: "CategoryCodeReq",param:{code:"SZHK"}},
    {title: "板块类别个股列表-SHHGT",request: "CategoryCodeReq",param:{code:"SHHGT"}},
    {title: "板块类别个股列表-SZSGT",request: "CategoryCodeReq",param:{code:"SZSGT"}},
    {title: "板块类别个股列表-HKGGT",request: "CategoryCodeReq",param:{code:"HKGGT"}},
    {title: "板块类别个股列表-HKGGTEQTY",request: "CategoryCodeReq",param:{code:"HKGGTEQTY"}},
    {title: "板块类别个股列表-HKGGTTRST",request: "CategoryCodeReq",param:{code:"HKGGTTRST"}},
    {title: "板块类别个股列表-SZSGTEQTY",request: "CategoryCodeReq",param:{code:"SZSGTEQTY"}},
    {title: "板块类别个股列表-SZSGTTRST",request: "CategoryCodeReq",param:{code:"SZSGTTRST"}},
    {title: "板块类别个股列表-SHHGTEQTY",request: "CategoryCodeReq",param:{code:"SHHGTEQTY"}},
    {title: "板块类别个股列表-SHHGTEQTY",request: "CategoryCodeReq",param:{code:"SHHGTEQTY"}},
    {title: "板块类别个股列表-SHHGTTRST",request: "CategoryCodeReq",param:{code:"SHHGTTRST"}},
    {title: "板块类别个股列表-HK1010",request: "CategoryCodeReq",param:{code:"HK1010"}},
    {title: "板块类别个股列表-HK1100",request: "CategoryCodeReq",param:{code:"HK1100"}},
    {title: "板块类别个股列表-HK1100",request: "CategoryCodeReq",param:{code:"HK1100"}},
    {title: "板块类别个股列表-HK1300",request: "CategoryCodeReq",param:{code:"HK1300"}},
    {title: "板块类别个股列表-HK1400",request: "CategoryCodeReq",param:{code:"HK1400"}},
    {title: "板块类别个股列表-HK1500",request: "CategoryCodeReq",param:{code:"HK1500"}},
    {title: "板块类别个股列表-HK1600",request: "CategoryCodeReq",param:{code:"HK1600"}},
    {title: "板块类别个股列表-GB1400",request: "CategoryCodeReq",param:{code:"GB1400"}},
    {title: "板块类别个股列表-GB1001",request: "CategoryCodeReq",param:{code:"GB1001"}},
    {title: "板块类别个股列表-CFF",request: "CategoryCodeReq",param:{code:"CFF_ALL"}},
    {title: "板块类别个股列表-DCE",request: "CategoryCodeReq",param:{code:"DCE_ALL"}},
    {title: "板块类别个股列表-CZCE",request: "CategoryCodeReq",param:{code:"CZCE_ALL"}},
    {title: "板块类别个股列表-SHFE",request: "CategoryCodeReq",param:{code:"SHFE_ALL"}},
    {title: "板块类别个股列表-INE",request: "CategoryCodeReq",param:{code:"INE_ALL"}},
    {title: "板块类别个股列表-UK1540",request: "CategoryCodeReq",param:{code:"UK1540"}},
    {title: "板块类别个股列表-UK1530",request: "CategoryCodeReq",param:{code:"UK1530"}},
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                  router.pushUrl({ url: 'pages/ResponsePages/CategoryCodeResp', params: value });
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