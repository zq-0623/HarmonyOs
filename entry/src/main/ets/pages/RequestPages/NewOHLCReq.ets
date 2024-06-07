import router from '@ohos.router'
import { OHLCPeriod, OHLCPriceAdjustedMode, RequestType } from 'SseCore'
@Entry
@Component
struct NewThreeHundredK {
  @State message: string = 'Hello World'
  requestList:Array<ListRequestType> = [
    {title: "最新300根历史K线-SH1001",request: "OHLCReq",param:{code:"600000.sh", subtype:"1001",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,requestType:RequestType.RequestTypeRecent}},
    {title: "最新300根历史K线-SH1002",request: "OHLCReq",param:{code:"900948.sh", subtype:"1002",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,requestType:RequestType.RequestTypeRecent}},
    {title: "最新300根历史K线-SH1006",request: "OHLCReq",param:{code:"688009.sh", subtype:"1006",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,requestType:RequestType.RequestTypeRecent}},
    {title: "最新300根历史K线-SH1100",request: "OHLCReq",param:{code:"513330.sh", subtype:"1100",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,requestType:RequestType.RequestTypeRecent}},
    {title: "最新300根历史K线-SH1300",request: "OHLCReq",param:{code:"204001.sh", subtype:"1300",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,requestType:RequestType.RequestTypeRecent}},
    {title: "最新300根历史K线-SH3002",request: "OHLCReq",param:{code:"10006167.sh", subtype:"3002",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,requestType:RequestType.RequestTypeRecent}},
    {title: "最新300根历史K线-SZ1001",request: "OHLCReq",param:{code:"000001.sz", subtype: "1001",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,requestType:RequestType.RequestTypeRecent}},
    {title: "最新300根历史K线-SZ1002",request: "OHLCReq",param:{code:"200625.sz", subtype: "1002",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,requestType:RequestType.RequestTypeRecent}},
    {title: "最新300根历史K线-SZ1004",request: "OHLCReq",param:{code:"300459.sz", subtype: "1004",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,requestType:RequestType.RequestTypeRecent}},
    {title: "最新300根历史K线-SZ1100",request: "OHLCReq",param:{code: "159792.sz", subtype: "1100",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,requestType:RequestType.RequestTypeRecent}},
    {title: "最新300根历史K线-SZ1300",request: "OHLCReq",param:{code: "131810.sz", subtype: "1300",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,requestType:RequestType.RequestTypeRecent}},
    {title: "最新300根历史K线-SZ3002",request: "OHLCReq",param:{code: "90003505.sz", subtype: "3002",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,requestType:RequestType.RequestTypeRecent}},
    {title: "最新300根历史K线-BZ1001",request: "OHLCReq",param:{code: "836208.bz", subtype: "1001",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,requestType:RequestType.RequestTypeRecent}},
    {title: "最新300根历史K线-BZ1300",request: "OHLCReq",param:{code: "821003.bz", subtype: "1300",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,requestType:RequestType.RequestTypeRecent}},
    {title: "最新300根历史K线-BZ1400",request: "OHLCReq",param:{code: "899050.bz", subtype: "1400",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,requestType:RequestType.RequestTypeRecent}},
    {title: "最新300根历史K线-HK1000",request: "OHLCReq",param:{code: "01468.hk", subtype: "1010",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,requestType:RequestType.RequestTypeRecent}},
    {title: "最新300根历史K线-HK1100",request: "OHLCReq",param:{code: "03033.hk", subtype: "1100",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,requestType:RequestType.RequestTypeRecent}},
    {title: "最新300根历史K线-HK1300",request: "OHLCReq",param:{code: "04246.hk", subtype: "1300",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,requestType:RequestType.RequestTypeRecent}},
    {title: "最新300根历史K线-HK1400",request: "OHLCReq",param:{code: "HSI.hk", subtype: "1400",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,requestType:RequestType.RequestTypeRecent}},
    {title: "最新300根历史K线-HK1500",request: "OHLCReq",param:{code: "61759.hk", subtype: "1500",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,requestType:RequestType.RequestTypeRecent}},
    {title: "最新300根历史K线-HK1600",request: "OHLCReq",param:{code: "23140.hk", subtype: "1600",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,requestType:RequestType.RequestTypeRecent}},
    {title: "最新300根历史K线-CSI1400",request: "OHLCReq",param:{code: "000902.csi", subtype: "1400",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,requestType:RequestType.RequestTypeRecent}},
    {title: "最新300根历史K线-Notion",request: "OHLCReq",param:{code: "E01039.bk", subtype: "1400",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,requestType:RequestType.RequestTypeRecent}},
    {title: "最新300根历史K线-Area",request: "OHLCReq",param:{code: "F10031.bk", subtype: "1400",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,requestType:RequestType.RequestTypeRecent}},
    {title: "最新300根历史K线-Trade",request: "OHLCReq",param:{code: "A20090.bk", subtype: "1400",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,requestType:RequestType.RequestTypeRecent}},
    {title: "最新300根历史K线-Trade_sw1",request: "OHLCReq",param:{code: "D10032.bk", subtype: "1400",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,requestType:RequestType.RequestTypeRecent}},
    {title: "最新300根历史K线-Trade_sw",request: "OHLCReq",param:{code: "D20167.bk", subtype: "1400",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,requestType:RequestType.RequestTypeRecent}},
    {title: "最新300根历史K线-Notion_szyp",request: "OHLCReq",param:{code: "J10570.bk", subtype: "1400",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,requestType:RequestType.RequestTypeRecent}},
    {title: "最新300根历史K线-Area_szyp",request: "OHLCReq",param:{code: "I10034.bk", subtype: "1400",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,requestType:RequestType.RequestTypeRecent}},
    {title: "最新300根历史K线-Trade_szyp",request: "OHLCReq",param:{code: "H10052.bk", subtype: "1400",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,requestType:RequestType.RequestTypeRecent}},
    {title: "最新300根历史K线-Trade_fz",request: "OHLCReq",param:{code: "G10076.bk", subtype: "1400",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,requestType:RequestType.RequestTypeRecent}},
    {title: "最新300根历史K线-BJ1000",request: "OHLCReq",param:{code: "830899.bj", subtype: "1000",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,requestType:RequestType.RequestTypeRecent}},
    {title: "最新300根历史K线-BJ1400",request: "OHLCReq",param:{code: "899001.bj", subtype: "1400",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,requestType:RequestType.RequestTypeRecent}},
    {title: "最新300根历史K线-CFF",request: "OHLCReq",param:{code: "IO2403-P-3200.cff", subtype: "optionHO",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,requestType:RequestType.RequestTypeRecent}},
    {title: "最新300根历史K线-DCE",request: "OHLCReq",param:{code: "a2405-C-4100.dce", subtype: "futurea",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,requestType:RequestType.RequestTypeRecent}},
    {title: "最新300根历史K线-CZCE",request: "OHLCReq",param:{code: "AP0001.czce", subtype: "futureAP",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,requestType:RequestType.RequestTypeRecent}},
    {title: "最新300根历史K线-SHFE",request: "OHLCReq",param:{code: "al2405C21200.shfe", subtype: "futureag",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,requestType:RequestType.RequestTypeRecent}},
    {title: "最新300根历史K线-INE",request: "OHLCReq",param:{code: "bc0001.ine", subtype: "futurebc",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,requestType:RequestType.RequestTypeRecent}},
    {title: "最新300根历史K线-GB1400",request: "OHLCReq",param:{code: "M00003.gb", subtype: "1400",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,requestType:RequestType.RequestTypeRecent}},
    {title: "最新300根历史K线-GB1001",request: "OHLCReq",param:{code: "AUDUSD.gb", subtype: "1001",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,requestType:RequestType.RequestTypeRecent}},
    {title: "最新300根历史K线-UK1540",request: "OHLCReq",param:{code: "CYPC.uk", subtype: "1540",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,requestType:RequestType.RequestTypeRecent}},
    {title: "K线-SH1001",request: "OHLCReq",param:{code:"600000.sh",period:OHLCPeriod.OHLCPeriodMin1,count:30,subtype:"1001",requestType:RequestType.RequestTypeRecent,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone}}
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                  router.pushUrl({ url: 'pages/ResponsePages/OHLCResp', params: value });
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
  period?: OHLCPeriod;
  requestType?: RequestType;
  priceAdjustedMode?:OHLCPriceAdjustedMode;
  count?: number;
}