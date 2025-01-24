/**
 * Author:qiang
 * Date:2024/4/11
 * IDEA:SseHarmonyOS
 * FileName:forwardDateOHLCReq
 */
import router from '@ohos.router'
import { OHLCPeriod, OHLCPriceAdjustedMode, RequestType } from 'SseCore'
@Entry
@Component
struct forwardDateOHLCReq {
  @State message: string = 'Hello World'
  requestList:Array<ListRequestType> = [
    {title: "给定日期之前300根-SH不复权",request: "OHLCReq",param:{code:"605398.sh", subtype:"1001",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,date:"20250108111300",requestType:RequestType.RequestTypeOlder,count:300}},
    {title: "给定日期之前300根-SH前复权",request: "OHLCReq",param:{code:"605398.sh", subtype:"1001",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,date:"20250108111300",requestType:RequestType.RequestTypeOlder,count:300}},
    {title: "给定日期之前300根-SH后复权",request: "OHLCReq",param:{code:"605398.sh", subtype:"1001",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeBackward,date:"20250108111300",requestType:RequestType.RequestTypeOlder,count:300}},
    {title: "给定日期之前300根-SZ不复权",request: "OHLCReq",param:{code:"001391.sz", subtype:"1001",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,date:"20250108111300",requestType:RequestType.RequestTypeOlder,count:300}},
    {title: "给定日期之前300根-SZ前复权",request: "OHLCReq",param:{code:"001391.sz", subtype:"1001",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,date:"20250108111300",requestType:RequestType.RequestTypeOlder,count:300}},
    {title: "给定日期之前300根-SZ后复权",request: "OHLCReq",param:{code:"001391.sz", subtype:"1001",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeBackward,date:"20250108111300",requestType:RequestType.RequestTypeOlder,count:300}},
    {title: "给定日期之前300根-BZ不复权",request: "OHLCReq",param:{code:"832662.bz", subtype:"1001",period:OHLCPeriod.OHLCPeriodMin30,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,date:"20250108111300",requestType:RequestType.RequestTypeOlder,count:300}},
    {title: "给定日期之前300根-BZ不复权",request: "OHLCReq",param:{code:"832662.bz", subtype:"1001",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,date:"20250108111300",requestType:RequestType.RequestTypeOlder,count:300}},
    {title: "给定日期之前300根-BZ前复权",request: "OHLCReq",param:{code:"832662.bz", subtype:"1001",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,date:"20250108111300",requestType:RequestType.RequestTypeOlder,count:300}},
    {title: "给定日期之前300根-BZ后复权",request: "OHLCReq",param:{code:"832662.bz", subtype:"1001",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeBackward,date:"20250108111300",requestType:RequestType.RequestTypeOlder,count:300}},
    {title: "给定日期之前300根-HK不复权",request: "OHLCReq",param:{code:"02013.hk", subtype:"1010",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeNone,date:"20250103140000",requestType:RequestType.RequestTypeOlder,count:300}},
    {title: "给定日期之前300根-HK前复权",request: "OHLCReq",param:{code:"02013.hk", subtype:"1010",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,date:"20250103140000",requestType:RequestType.RequestTypeOlder,count:300}},
    {title: "给定日期之前300根-HK后复权",request: "OHLCReq",param:{code:"02013.hk", subtype:"1001",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeBackward,date:"20250103140000",requestType:RequestType.RequestTypeOlder,count:300}},
    {title: "给定日期之前300根-SH1001",request: "OHLCReq",param:{code:"600010.sh", subtype:"1001",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,date:"20250103140000",requestType:RequestType.RequestTypeOlder,count:300}},
    {title: "给定日期之前300根-SH1002",request: "OHLCReq",param:{code:"900948.sh", subtype:"1002",period:OHLCPeriod.OHLCPeriodDay,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeBackward,date:"20250103140000",requestType:RequestType.RequestTypeOlder,count:300}},
    {title: "给定日期之前300根-SH1006",request: "OHLCReq",param:{code:"688009.sh", subtype:"1006",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,date:"20240414",requestType:RequestType.RequestTypeOlder,count:10}},
    {title: "给定日期之前300根-SH1100",request: "OHLCReq",param:{code:"513330.sh", subtype:"1100",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,date:"20240414",requestType:RequestType.RequestTypeOlder,count:10}},
    {title: "给定日期之前300根-SH1300",request: "OHLCReq",param:{code:"204001.sh", subtype:"1300",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,date:"20240414",requestType:RequestType.RequestTypeOlder,count:10}},
    {title: "给定日期之前300根-SH3002",request: "OHLCReq",param:{code:"10006414.sh", subtype:"3002",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,date:"20240414",requestType:RequestType.RequestTypeOlder,count:10}},
    {title: "给定日期之前300根-SZ1001",request: "OHLCReq",param:{code:"000001.sz", subtype: "1001",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,date:"20240414",requestType:RequestType.RequestTypeOlder,count:10}},
    {title: "给定日期之前300根-SZ1002",request: "OHLCReq",param:{code:"200625.sz", subtype: "1002",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,date:"20240414",requestType:RequestType.RequestTypeOlder,count:10}},
    {title: "给定日期之前300根-SZ1004",request: "OHLCReq",param:{code:"300459.sz", subtype: "1004",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,date:"20240414",requestType:RequestType.RequestTypeOlder,count:10}},
    {title: "给定日期之前300根-SZ1100",request: "OHLCReq",param:{code: "159792.sz", subtype: "1100",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,date:"20240414",requestType:RequestType.RequestTypeOlder,count:10}},
    {title: "给定日期之前300根-SZ1300",request: "OHLCReq",param:{code: "131810.sz", subtype: "1300",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,date:"20240414",requestType:RequestType.RequestTypeOlder,count:10}},
    {title: "给定日期之前300根-SZ3002",request: "OHLCReq",param:{code: "90002507.sz", subtype: "3002",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,date:"20240414",requestType:RequestType.RequestTypeOlder,count:10}},
    {title: "给定日期之前300根-BZ1001",request: "OHLCReq",param:{code: "836208.bz", subtype: "1001",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,date:"20240414",requestType:RequestType.RequestTypeOlder,count:10}},
    {title: "给定日期之前300根-BZ1300",request: "OHLCReq",param:{code: "821003.bz", subtype: "1300",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,date:"20240414",requestType:RequestType.RequestTypeOlder,count:10}},
    {title: "给定日期之前300根-BZ1400",request: "OHLCReq",param:{code: "899050.bz", subtype: "1400",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,date:"20240414",requestType:RequestType.RequestTypeOlder,count:10}},
    {title: "给定日期之前300根-HK1010",request: "OHLCReq",param:{code: "00939.hk", subtype: "1010",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,date:"20240415130000",requestType:RequestType.RequestTypeOlder}},
    {title: "给定日期之前300根-HK1100",request: "OHLCReq",param:{code: "02800.hk", subtype: "1100",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,date:"20240415150000",requestType:RequestType.RequestTypeOlder,count:10}},
    {title: "给定日期之前300根-HK1300",request: "OHLCReq",param:{code: "04246.hk", subtype: "1300",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,date:"20240415150000",requestType:RequestType.RequestTypeOlder,count:10}},
    {title: "给定日期之前300根-HK1400",request: "OHLCReq",param:{code: "HSI.hk", subtype: "1400",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,date:"20240415150000",requestType:RequestType.RequestTypeOlder,count:10}},
    {title: "给定日期之前300根-HK1500",request: "OHLCReq",param:{code: "52148.hk", subtype: "1500",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,date:"20240415150000",requestType:RequestType.RequestTypeOlder,count:10}},
    {title: "给定日期之前300根-HK1600",request: "OHLCReq",param:{code: "21683.hk", subtype: "1600",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,date:"20240415150000",requestType:RequestType.RequestTypeOlder,count:10}},
    {title: "给定日期之前300根-CSI1400",request: "OHLCReq",param:{code: "000902.csi", subtype: "1400",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,date:"20240415150000",requestType:RequestType.RequestTypeOlder,count:10}},
    {title: "给定日期之前300根-Area",request: "OHLCReq",param:{code: "F10031.bk", subtype: "1400",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,date:"20240415150000",requestType:RequestType.RequestTypeOlder,count:10}},
    {title: "给定日期之前300根-Trade",request: "OHLCReq",param:{code: "A20090.bk", subtype: "1400",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,date:"20240415150000",requestType:RequestType.RequestTypeOlder,count:10}},
    {title: "给定日期之前300根-Trade_sw1",request: "OHLCReq",param:{code: "D10032.bk", subtype: "1400",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,date:"20240414",requestType:RequestType.RequestTypeOlder,count:10}},
    {title: "给定日期之前300根-Trade_sw",request: "OHLCReq",param:{code: "D20167.bk", subtype: "1400",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,date:"20240414",requestType:RequestType.RequestTypeOlder,count:10}},
    {title: "给定日期之前300根-Notion_szyp",request: "OHLCReq",param:{code: "J10570.bk", subtype: "1400",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,date:"20240414",requestType:RequestType.RequestTypeOlder,count:10}},
    {title: "给定日期之前300根-Area_szyp",request: "OHLCReq",param:{code: "I10034.bk", subtype: "1400",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,date:"20240414",requestType:RequestType.RequestTypeOlder,count:10}},
    {title: "给定日期之前300根-Trade_szyp",request: "OHLCReq",param:{code: "H10052.bk", subtype: "1400",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,date:"20240414",requestType:RequestType.RequestTypeOlder,count:10}},
    {title: "给定日期之前300根-Trade_fz",request: "OHLCReq",param:{code: "G10076.bk", subtype: "1400",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,date:"20240414",requestType:RequestType.RequestTypeOlder,count:10}},
    {title: "给定日期之前300根-BJ1000",request: "OHLCReq",param:{code: "830899.bj", subtype: "1000",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,date:"20240414",requestType:RequestType.RequestTypeOlder,count:10}},
    {title: "给定日期之前300根-BJ1400",request: "OHLCReq",param:{code: "899001.bj", subtype: "1400",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,date:"20240414",requestType:RequestType.RequestTypeOlder,count:10}},
    {title: "给定日期之前300根-CFF",request: "OHLCReq",param:{code: "IO2403-P-3200.cff", subtype: "optionHO",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,date:"20240414",requestType:RequestType.RequestTypeOlder,count:10}},
    {title: "给定日期之前300根-DCE",request: "OHLCReq",param:{code: "a2405-C-4100.dce", subtype: "futurea",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,date:"20240414",requestType:RequestType.RequestTypeOlder,count:10}},
    {title: "给定日期之前300根-CZCE",request: "OHLCReq",param:{code: "AP0001.czce", subtype: "futureAP",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,date:"20240414",requestType:RequestType.RequestTypeOlder,count:10}},
    {title: "给定日期之前300根-SHFE",request: "OHLCReq",param:{code: "al2405C21200.shfe", subtype: "futureag",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,date:"20240414",requestType:RequestType.RequestTypeOlder,count:10}},
    {title: "给定日期之前300根-INE",request: "OHLCReq",param:{code: "bc0001.ine", subtype: "futurebc",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,date:"20240414",requestType:RequestType.RequestTypeOlder,count:10}},
    {title: "给定日期之前300根-GB1400",request: "OHLCReq",param:{code: "M00003.gb", subtype: "1400",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,date:"20240414",requestType:RequestType.RequestTypeOlder,count:10}},
    {title: "给定日期之前300根-GB1001",request: "OHLCReq",param:{code: "AUDUSD.gb", subtype: "1001",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,date:"20240414",requestType:RequestType.RequestTypeOlder,count:10}},
    {title: "给定日期之前300根-UK1540",request: "OHLCReq",param:{code: "CYPC.uk", subtype: "1540",period:OHLCPeriod.OHLCPeriodMin1,priceAdjustedMode:OHLCPriceAdjustedMode.OHLCPriceAdjustedModeForward,date:"20240414",requestType:RequestType.RequestTypeOlder,count:10}},
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
  date?: string;
  period?:OHLCPeriod;
  priceAdjustedMode?:OHLCPriceAdjustedMode;
  requestType?:RequestType;
  count?: number

}