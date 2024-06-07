import router from '@ohos.router'
@Entry
@Component
struct HistoryChartReq {
  @State message: string = 'Hello World'
  // 根据某个日期获取历史分时，注：港股不支持获取当天的历史分时，沪深京港当日数据不完整,建议用当日分时替代,沪深支持近一年 其它市场支持近两个月
  requestList:Array<ListRequestType> = [
    {title: "历史分时走势-SH1001",request: "HistoryChartReq",param:{code:"600000.sh", subtype:"1001",date:"20240313"}},
    {title: "历史分时走势-SH1002",request: "HistoryChartReq",param:{code:"900948.sh", subtype:"1002",date:"20240313"}},
    {title: "历史分时走势-SH1006",request: "HistoryChartReq",param:{code:"688009.sh", subtype:"1006",date:"20240313"}},
    {title: "历史分时走势-SH1100",request: "HistoryChartReq",param:{code:"513330.sh", subtype:"1100",date:"20240313"}},
    {title: "历史分时走势-SH1300",request: "HistoryChartReq",param:{code:"204001.sh", subtype:"1300",date:"20240313"}},
    {title: "历史分时走势-SH1400",request: "HistoryChartReq",param:{code:"000001.sh", subtype: "1400",date:"20240313"}},
    {title: "历史分时走势-SH3002",request: "HistoryChartReq",param:{code:"10006414.sh", subtype:"3002",date:"20240313"}},
    {title: "历史分时走势-SZ1001",request: "HistoryChartReq",param:{code:"000001.sz", subtype: "1001",date:"20240313"}},
    {title: "历史分时走势-SZ1002",request: "HistoryChartReq",param:{code:"200625.sz", subtype: "1002",date:"20240313"}},
    {title: "历史分时走势-SZ1004",request: "HistoryChartReq",param:{code:"300459.sz", subtype: "1004",date:"20240313"}},
    {title: "历史分时走势-SZ1100",request: "HistoryChartReq",param:{code: "159792.sz", subtype: "1100",date:"20240313"}},
    {title: "历史分时走势-SZ1300",request: "HistoryChartReq",param:{code: "131810.sz", subtype: "1300",date:"20240313"}},
    {title: "历史分时走势-SZ1400",request: "HistoryChartReq",param:{code: "399001.sz", subtype: "1400",date:"20240313"}},
    {title: "历史分时走势-SZ3002",request: "HistoryChartReq",param:{code: "90002507.sz", subtype: "3002",date:"20240313"}},
    {title: "历史分时走势-BZ1001",request: "HistoryChartReq",param:{code: "836208.bz", subtype: "1001",date:"20240313"}},
    {title: "历史分时走势-BZ1300",request: "HistoryChartReq",param:{code: "821003.bz", subtype: "1300",date:"20240313"}},
    {title: "历史分时走势-BZ1400",request: "HistoryChartReq",param:{code: "899050.bz", subtype: "1400",date:"20240313"}},
    {title: "历史分时走势-HK1000",request: "HistoryChartReq",param:{code: "01468.hk", subtype: "1010",date:"20240313"}},
    {title: "历史分时走势-HK1100",request: "HistoryChartReq",param:{code: "03033.hk", subtype: "1100",date:"20240313"}},
    {title: "历史分时走势-HK1300",request: "HistoryChartReq",param:{code: "04246.hk", subtype: "1300",date:"20240313"}},
    {title: "历史分时走势-HK1400",request: "HistoryChartReq",param:{code: "HSI.hk", subtype: "1400",date:"20240313"}},
    {title: "历史分时走势-HK1500",request: "HistoryChartReq",param:{code: "61759.hk", subtype: "1500",date:"20240313"}},
    {title: "历史分时走势-HK1600",request: "HistoryChartReq",param:{code: "23140.hk", subtype: "1600",date:"20240313"}},
    {title: "历史分时走势-CSI1400",request: "HistoryChartReq",param:{code: "000902.csi", subtype: "1400",date:"20240313"}},
    {title: "历史分时走势-Notion",request: "HistoryChartReq",param:{code: "E01039.bk", subtype: "1400",date:"20240313"}},
    {title: "历史分时走势-Area",request: "HistoryChartReq",param:{code: "F10031.bk", subtype: "1400",date:"20240313"}},
    {title: "历史分时走势-Trade",request: "HistoryChartReq",param:{code: "A20090.bk", subtype: "1400",date:"20240313"}},
    {title: "历史分时走势-Trade_sw1",request: "HistoryChartReq",param:{code: "D10032.bk", subtype: "1400",date:"20240313"}},
    {title: "历史分时走势-Trade_sw",request: "HistoryChartReq",param:{code: "D20167.bk", subtype: "1400",date:"20240313"}},
    {title: "历史分时走势-Notion_szyp",request: "HistoryChartReq",param:{code: "J10570.bk", subtype: "1400",date:"20240313"}},
    {title: "历史分时走势-Area_szyp",request: "HistoryChartReq",param:{code: "I10034.bk", subtype: "1400",date:"20240313"}},
    {title: "历史分时走势-Trade_szyp",request: "HistoryChartReq",param:{code: "H10052.bk", subtype: "1400",date:"20240313"}},
    {title: "历史分时走势-Trade_fz",request: "HistoryChartReq",param:{code: "G10076.bk", subtype: "1400",date:"20240313"}},
    {title: "历史分时走势-BJ1000",request: "HistoryChartReq",param:{code: "830899.bj", subtype: "1000",date:"20240313"}},
    {title: "历史分时走势-BJ1400",request: "HistoryChartReq",param:{code: "899001.bj", subtype: "1400",date:"20240313"}},
    {title: "历史分时走势-CFF",request: "HistoryChartReq",param:{code: "IO2403-P-3200.cff", subtype: "optionHO",date:"20240313"}},
    {title: "历史分时走势-DCE",request: "HistoryChartReq",param:{code: "a2405-C-4100.dce", subtype: "futurea",date:"20240313"}},
    {title: "历史分时走势-CZCE",request: "HistoryChartReq",param:{code: "AP0001.czce", subtype: "futureAP",date:"20240313"}},
    {title: "历史分时走势-SHFE",request: "HistoryChartReq",param:{code: "al2405C21200.shfe", subtype: "futureag",date:"20240313"}},
    {title: "历史分时走势-INE",request: "HistoryChartReq",param:{code: "bc0001.ine", subtype: "futurebc",date:"20240313"}},
    {title: "历史分时走势-GB1400",request: "HistoryChartReq",param:{code: "M00003.gb", subtype: "1400",date:"20240313"}},
    {title: "历史分时走势-GB1001",request: "HistoryChartReq",param:{code: "AUDUSD.gb", subtype: "1001",date:"20240313"}},
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                  router.pushUrl({ url: 'pages/ResponsePages/HistoryChartResp', params: value });
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
  date?: string;
}