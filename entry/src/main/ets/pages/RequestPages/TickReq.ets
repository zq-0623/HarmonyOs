import router from '@ohos.router'
@Entry
@Component
struct TickReq {
  @State message: string = 'Hello World'
  requestList:Array<ListRequestType> = [
    {title: "请求明细-SH1001",request: "TickReq",param:{stockId:"600000.sh", param:"931,100,-1", subtype:"1001"}},
    {title: "请求明细-SH1002",request: "TickReq",param:{stockId:"900948.sh", param:"0,100,-1", subtype:"1002"}},
    {title: "请求明细-SH1006",request: "TickReq",param:{stockId:"688009.sh", param:"931,100,2", subtype:"1006"}},
    {title: "请求明细-SH1100",request: "TickReq",param:{stockId:"513330.sh", param:"0,100,-1", subtype:"1100"}},
    {title: "请求明细-SH1300",request: "TickReq",param:{stockId:"204001.sh", param:"0,100,0", subtype:"1300"}},
    {title: "请求明细-SH1400",request: "TickReq",param:{stockId:"000001.sh", param:"0,100,-1", subtype:"1400"}},
    {title: "请求明细-SH3002",request: "TickReq",param:{stockId:"10006956.sh", param:"0,100,-1", subtype:"3002"}},
    {title: "请求明细-SZ1001",request: "TickReq",param:{stockId:"000001.sz", param:"0,100,0", subtype:"1001"}},
    {title: "请求明细-SZ1002",request: "TickReq",param:{stockId:"200625.sz", param:"0,100,-1", subtype:"1002"}},
    {title: "请求明细-SZ1004",request: "TickReq",param:{stockId:"300459.sz", param:"0,100,-1", subtype:"1004"}},
    {title: "请求明细-SZ1100",request: "TickReq",param:{stockId:"159792.sz", param:"0,100,-1", subtype:"1100"}},
    {title: "请求明细-SZ1300",request: "TickReq",param:{stockId:"131810.sz", param:"0,100,-1", subtype:"1300"}},
    {title: "请求明细-SZ1400",request: "TickReq",param:{stockId:"399001.sz", param:"0,100,-1", subtype:"1400"}},
    {title: "请求明细-SZ3002",request: "TickReq",param:{stockId:"90003342.sz", param:"0,100,-1", subtype:"3002"}},
    {title: "请求明细-BZ1001",request: "TickReq",param:{stockId:"836208.bz", param:"0,100,-1", subtype:"1001"}},
    {title: "请求明细-BZ1300",request: "TickReq",param:{stockId:"821003.bz", param:"0,100,-1", subtype:"1300"}},
    {title: "请求明细-BZ1400",request: "TickReq",param:{stockId:"899050.bz", param:"0,100,-1", subtype:"1400"}},
    {title: "请求明细-HK1000",request: "TickReq",param:{stockId:"01468.hk", param:"0,100,-1", subtype:"1000"}},
    {title: "请求明细-HK1100",request: "TickReq",param:{stockId:"03033.hk", param:"0,100,-1", subtype:"1100"}},
    {title: "请求明细-HK1300",request: "TickReq",param:{stockId:"04246.hk", param:"0,100,-1", subtype:"1300"}},
    {title: "请求明细-HK1400",request: "TickReq",param:{stockId:"HSI.hk", param:"0,100,-1", subtype:"1400"}},
    {title: "请求明细-HK1500",request: "TickReq",param:{stockId:"61759.hk", param:"0,100,-1", subtype:"1500"}},
    {title: "请求明细-HK1600",request: "TickReq",param:{stockId:"23140.hk", param:"0,100,-1", subtype:"1600"}},
    {title: "请求明细-CSI1400",request: "TickReq",param:{stockId:"000902.csi", param:"0,100,-1", subtype:"1400"}},
    // {title: "请求明细-Area",request: "TickReq",param:{stockId: "F10031.bk", subtype: "1400",param:"0,100,-1"}},
    // {title: "请求明细-Trade",request: "TickReq",param:{stockId: "A20090.bk", subtype: "1400",param:"0,100,-1"}},
    // {title: "请求明细-Trade_sw1",request: "TickReq",param:{stockId: "D10032.bk", subtype: "1400",param:"0,100,-1"}},
    // {title: "请求明细-Trade_sw",request: "TickReq",param:{stockId: "D20167.bk", subtype: "1400",param:"0,100,-1"}},
    // {title: "请求明细-Notion_szyp",request: "TickReq",param:{stockId: "J10570.bk", subtype: "1400",param:"0,100,-1"}},
    // {title: "请求明细-Area_szyp",request: "TickReq",param:{stockId: "I10034.bk", subtype: "1400",param:"0,100,-1"}},
    // {title: "请求明细-Trade_szyp",request: "TickReq",param:{stockId: "H10052.bk", subtype: "1400",param:"0,100,-1"}},
    // {title: "请求明细-Trade_fz",request: "TickReq",param:{stockId: "G10076.bk", subtype: "1400",param:"0,100,-1"}},
    {title: "请求明细-BJ1000",request: "TickReq",param:{stockId: "830899.bj", subtype: "1000",param:"0,100,-1"}},
    {title: "请求明细-BJ1400",request: "TickReq",param:{stockId: "899001.bj", subtype: "1400",param:"0,100,-1"}},
    {title: "请求明细-CFF",request: "TickReq",param:{stockId: "IM2404.cff", subtype: "optionHO",param:"0,100,-1"}},
    {title: "请求明细-DCE",request: "TickReq",param:{stockId: "a0001.dce", subtype: "futurea",param:"0,100,-1"}},
    {title: "请求明细-CZCE",request: "TickReq",param:{stockId: "AP0001.czce", subtype: "futureAP",param:"0,100,-1"}},
    {title: "请求明细-SHFE",request: "TickReq",param:{stockId: "al2405C21200.shfe", subtype: "futureag",param:"0,100,-1"}},
    {title: "请求明细-INE",request: "TickReq",param:{stockId: "bc0001.ine", subtype: "futurebc",param:"0,100,-1"}},
    {title: "请求明细-GB1400",request: "TickReq",param:{stockId: "M00003.gb", subtype: "1400",param:"0,100,-1"}},
    {title: "请求明细-GB1001",request: "TickReq",param:{stockId: "AUDUSD.gb", subtype: "1001",param:"0,100,-1"}},
    {title: "请求明细-UK1540",request: "TickReq",param:{stockId: "CPIC.uk", subtype: "1540",param:"931,20,2"}},
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                  router.pushUrl({ url: 'pages/ResponsePages/TickResp', params: value });
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
  param?: string;
  subtype?: string;
  stockId? : string;
}