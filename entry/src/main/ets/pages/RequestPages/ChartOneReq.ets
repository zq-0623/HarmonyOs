import router from '@ohos.router'
import { ChartType } from 'SseCore'
@Entry
@Component
struct ChartOneReq {
  @State message: string = 'Hello World'
  requestList:Array<ListRequestType> = [
    {title: "分时走势-SH1001",request: "ChartReq",param:{code: "600000.sh", subtype: "1001",chartType:ChartType.ChartTypeOneDay,returnAFData:true}},
    {title: "分时走势-SH1002",request: "ChartReq",param:{code: "900948.sh", subtype: "1002",chartType:ChartType.ChartTypeOneDay,returnAFData:true}},
    {title: "分时走势-SH1006",request: "ChartReq",param:{code: "688272.sh", subtype: "1006",chartType:ChartType.ChartTypeOneDay,returnAFData:true}},
    {title: "分时走势-SH1100",request: "ChartReq",param:{code: "513330.sh", subtype: "1100",chartType:ChartType.ChartTypeOneDay,returnAFData:true}},
    {title: "分时走势-SH1300",request: "ChartReq",param:{code: "204001.sh", subtype: "1300",chartType:ChartType.ChartTypeOneDay,returnAFData:true}},
    {title: "分时走势-SH1400",request: "ChartReq",param:{code: "000001.sh", subtype: "1400",chartType:ChartType.ChartTypeOneDay,returnAFData:true}},
    {title: "分时走势-SH3002",request: "ChartReq",param:{code: "10006414.sh", subtype: "3002",chartType:ChartType.ChartTypeOneDay,returnAFData:true}},
    {title: "分时走势-SZ1001",request: "ChartReq",param:{code: "000001.sz", subtype: "1001",chartType:ChartType.ChartTypeOneDay,returnAFData:true}},
    {title: "分时走势-SZ1002",request: "ChartReq",param:{code: "200625.sz", subtype: "1002",chartType:ChartType.ChartTypeOneDay,returnAFData:true}},
    {title: "分时走势-SZ1004",request: "ChartReq",param:{code: "300459.sz", subtype: "1004",chartType:ChartType.ChartTypeOneDay,returnAFData:true}},
    {title: "分时走势-SZ1100",request: "ChartReq",param:{code: "159792.sz", subtype: "1100",chartType:ChartType.ChartTypeOneDay,returnAFData:true}},
    {title: "分时走势-SZ1300",request: "ChartReq",param:{code: "131810.sz", subtype: "1300",chartType:ChartType.ChartTypeOneDay,returnAFData:true}},
    {title: "分时走势-SZ1400",request: "ChartReq",param:{code: "399001.sz", subtype: "1400",chartType:ChartType.ChartTypeOneDay,returnAFData:true}},
    {title: "分时走势-SZ3002",request: "ChartReq",param:{code: "90002507.sz", subtype: "3002",chartType:ChartType.ChartTypeOneDay,returnAFData:true}},
    {title: "分时走势-BZ1001",request: "ChartReq",param:{code: "834021.bz", subtype: "1001",chartType:ChartType.ChartTypeOneDay,returnAFData:true}},
    {title: "分时走势-BZ1300",request: "ChartReq",param:{code: "821001.bz", subtype: "1300",chartType:ChartType.ChartTypeOneDay,returnAFData:true}},
    {title: "分时走势-BZ1400",request: "ChartReq",param:{code: "899050.bz", subtype: "1400",chartType:ChartType.ChartTypeOneDay,returnAFData:true}},
    {title: "分时走势-Notion",request: "ChartReq",param:{code: "E01039.bk", subtype: "1400",chartType:ChartType.ChartTypeOneDay,returnAFData:true}},
    {title: "分时走势-Area",request: "ChartReq",param:{code: "F10031.bk", subtype: "1400",chartType:ChartType.ChartTypeOneDay,returnAFData:true}},
    {title: "分时走势-Trade",request: "ChartReq",param:{code: "A20090.bk", subtype: "1400",chartType:ChartType.ChartTypeOneDay,returnAFData:true}},
    {title: "分时走势-Trade_sw1",request: "ChartReq",param:{code: "D10032.bk", subtype: "1400",chartType:ChartType.ChartTypeOneDay,returnAFData:true}},
    {title: "分时走势-Trade_sw",request: "ChartReq",param:{code: "D20167.bk", subtype: "1400",chartType:ChartType.ChartTypeOneDay,returnAFData:true}},
    {title: "分时走势-Notion_szyp",request: "ChartReq",param:{code: "J10570.bk", subtype: "1400",chartType:ChartType.ChartTypeOneDay,returnAFData:true}},
    {title: "分时走势-Area_szyp",request: "ChartReq",param:{code: "I10034.bk", subtype: "1400",chartType:ChartType.ChartTypeOneDay,returnAFData:true}},
    {title: "分时走势-Trade_szyp",request: "ChartReq",param:{code: "H10052.bk", subtype: "1400",chartType:ChartType.ChartTypeOneDay,returnAFData:true}},
    {title: "分时走势-Trade_fz",request: "ChartReq",param:{code: "G10076.bk", subtype: "1400",chartType:ChartType.ChartTypeOneDay,returnAFData:true}},
    {title: "分时走势-HK1000",request: "ChartReq",param:{code: "00020.hk", subtype: "1010",chartType:ChartType.ChartTypeOneDay,returnAFData:true}},
    {title: "分时走势-HK1100",request: "ChartReq",param:{code: "03033.hk", subtype: "1100",chartType:ChartType.ChartTypeOneDay,returnAFData:true}},
    {title: "分时走势-HK1300",request: "ChartReq",param:{code: "04246.hk", subtype: "1300",chartType:ChartType.ChartTypeOneDay,returnAFData:true}},
    {title: "分时走势-HK1400",request: "ChartReq",param:{code: "HSI.hk", subtype: "1400",chartType:ChartType.ChartTypeOneDay,returnAFData:true}},
    {title: "分时走势-HK1500",request: "ChartReq",param:{code: "61759.hk", subtype: "1500",chartType:ChartType.ChartTypeOneDay,returnAFData:true}},
    {title: "分时走势-HK1600",request: "ChartReq",param:{code: "23140.hk", subtype: "1600",chartType:ChartType.ChartTypeOneDay,returnAFData:true}},
    {title: "分时走势-CSI1400",request: "ChartReq",param:{code: "000902.csi", subtype: "1400",chartType:ChartType.ChartTypeOneDay,returnAFData:true}},
    {title: "分时走势-CFF",request: "ChartReq",param:{code: "IO2403-P-3200.cff", subtype: "optionHO",chartType:ChartType.ChartTypeOneDay,returnAFData:true}},
    {title: "分时走势-DCE",request: "ChartReq",param:{code: "a0001.dce", subtype: "futurea",chartType:ChartType.ChartTypeOneDay,returnAFData:true}},
    {title: "分时走势-CZCE",request: "ChartReq",param:{code: "AP0001.czce", subtype: "futureAP",chartType:ChartType.ChartTypeOneDay,returnAFData:true}},
    {title: "分时走势-SHFE",request: "ChartReq",param:{code: "al2405C21200.shfe", subtype: "futureag",chartType:ChartType.ChartTypeOneDay,returnAFData:true}},
    {title: "分时走势-INE",request: "ChartReq",param:{code: "bc0001.ine", subtype: "futurebc",chartType:ChartType.ChartTypeOneDay,returnAFData:true}},
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                  router.pushUrl({ url: 'pages/ResponsePages/ChartOneResp', params: value });
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
  chartType?: number;
  returnAFData?: boolean;
}