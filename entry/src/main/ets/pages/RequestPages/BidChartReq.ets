import router from '@ohos.router'
@Entry
@Component
struct BidChartReq {
  @State message: string = 'Hello World'
  requestList:Array<ListRequestType> = [
    {title: "集合竞价-SH1001",request: "BidChartReq",param:{code:"600000.sh", subtype:"1001"}},
    {title: "集合竞价-SH1002",request: "BidChartReq",param:{code:"900948.sh", subtype:"1002"}},
    {title: "集合竞价-SH1006",request: "BidChartReq",param:{code:"688009.sh", subtype:"1006"}},
    {title: "集合竞价-SH1100",request: "BidChartReq",param:{code:"513330.sh", subtype: "1100"}},
    {title: "集合竞价-SH1300",request: "BidChartReq",param:{code: "204001.sh", subtype: "1300"}},
    {title: "集合竞价-SH1400",request: "BidChartReq",param:{code: "000001.sh", subtype: "1400"}},
    {title: "集合竞价-SH3002",request: "BidChartReq",param:{code: "10006414.sh", subtype: "3002"}},
    {title: "集合竞价-SZ1001",request: "BidChartReq",param:{code: "000001.sz", subtype: "1001"}},
    {title: "集合竞价-SZ1002",request: "BidChartReq",param:{code: "200625.sz", subtype: "1002"}},
    {title: "集合竞价-SZ1004",request: "BidChartReq",param:{code: "300459.sz", subtype: "1004"}},
    {title: "集合竞价-SZ1100",request: "BidChartReq",param:{code: "159792.sz", subtype: "1100"}},
    {title: "集合竞价-SZ1300",request: "BidChartReq",param:{code: "131810.sz", subtype: "1300"}},
    {title: "集合竞价-SZ1400",request: "BidChartReq",param:{code: "399001.sz", subtype: "1400"}},
    {title: "集合竞价-SZ3002",request: "BidChartReq",param:{code: "90002507.sz", subtype: "3002"}},
    {title: "集合竞价-BZ1001",request: "BidChartReq",param:{code: "838030.bz", subtype: "1001"}},
    {title: "集合竞价-HK1010",request: "BidChartReq",param:{code: "00020.hk", subtype: "1010"}},
    {title: "集合竞价-CSI1400",request: "BidChartReq",param:{code: "000902.csi", subtype: "1400"}},
    {title: "集合竞价-BJ1000",request: "BidChartReq",param:{code: "831129.bj", subtype: "1000"}},
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                  router.pushUrl({ url: 'pages/ResponsePages/BidChartResp', params: value });
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
  subtype?: string;
}