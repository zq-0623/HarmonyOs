import router from '@ohos.router'
import { OHLCPeriod, RequestType,CompoundUpdownsType,ChartIndexType } from 'SseCore'
@Entry
@Component
struct OHLCIndexReq {
  @State message: string = 'Hello World'

  // period: K线周期  参考OHLCPeriod
        // OHLCPeriodMin1	日K   0
        // OHLCPeriodMin1	周K   1
        // OHLCPeriodMin1	月K  2
        // OHLCPeriodMin1	季K   9
        // OHLCPeriodMin1	年K   10
        // OHLCPeriodMin1	1分钟K  3
        // OHLCPeriodMin1	5分钟K   4
        // OHLCPeriodMin15	15分钟K  5
        // OHLCPeriodMin1	30分钟K   6
        // OHLCPeriodMin1	60分钟K   7
        // OHLCPeriodMin120	120分钟K   8
  // requestType : 请求类型
        // 1、默认类型为RequestTypeNewer,count:10,取最新的300根K线数据
        // 2、当类型为RequestTypeNewer时,取date日期之后的300根K线数据
        // 3、当类型为RequestTypeNewer时,取date日期之前的300根K线数据
  // date : 日期/时间
        // 获取指定日期对应的数据,与requestType配合使用
        // 1：日周月K的时间格式为 yyyyMMdd
        // 2：分钟K的时间格式为 yyyyMMddHHmmss
  // 1、沪深股票字段如下，多个以逗号隔开：
  // bbd : 大单净差
  // ddx : 主力动向
  // ddy : 涨跌动因
  // ddz : 大单差分
  // ratioBS : 单数比
  // largeMoneyInflow : 超大单净流入
  // bigMoneyInflow : 大单净流入
  // midMoneyInflow : 中单净流入
  // smallMoneyInflow : 小单净流入
  // largeTradeNum : 超大单成交单数
  // bigTradeNum : 大单成交单数
  // midTradeNum : 中单成交单数
  // smallTradeNum : 小单成交单数
  // 2、板块字段如下，多个以逗号隔开：
  // largeMoneyNetInflow : 超大单净流入
  // bigMoneyNetInflow : 大单净流入
  // midMoneyNetInflow : 中单净流入
  // smallMoneyNetInflow : 小单净流入
  // mainforceMoneyInflow : 主力资金流入
  // mainforceMoneyOutflow : 主力资金流出OHLCPeriodMin1
  requestList:Array<ListRequestType> = [
    {title: "增值K线-SH1001",request: "OHLCIndexReq",param:{code:"600000.sh",period:OHLCPeriod.OHLCPeriodMin1,date:"202404230999999999",requestType:RequestType.RequestTypeNewer,count:10,type:[ChartIndexType.ChartIndexTypeDDX,ChartIndexType.ChartIndexTypeDDY,ChartIndexType.ChartIndexTypeDDZ,ChartIndexType.ChartIndexTypeBBD,ChartIndexType.ChartIndexTypeRatioBS,ChartIndexType.ChartIndexTypeLargeMoneyInflow,ChartIndexType.ChartIndexTypeBigMoneyInflow,ChartIndexType.ChartIndexTypeMidMoneyInflow,ChartIndexType.ChartIndexTypeSmallMoneyInflow,ChartIndexType.ChartIndexTypeLargeTradeNum,ChartIndexType.ChartIndexTypeBigTradeNum,ChartIndexType.ChartIndexTypeMidTradeNum,ChartIndexType.ChartIndexTypeSmallTradeNum]}},
    {title: "增值K线-SH1002",request: "OHLCIndexReq",param:{code:"900906.sh",period:OHLCPeriod.OHLCPeriodMin1,date:"2024042309999999",requestType:RequestType.RequestTypeNewer,count:10,type:[ChartIndexType.ChartIndexTypeDDX,ChartIndexType.ChartIndexTypeDDY,ChartIndexType.ChartIndexTypeDDZ,ChartIndexType.ChartIndexTypeBBD,ChartIndexType.ChartIndexTypeRatioBS,ChartIndexType.ChartIndexTypeLargeMoneyInflow,ChartIndexType.ChartIndexTypeBigMoneyInflow,ChartIndexType.ChartIndexTypeMidMoneyInflow,ChartIndexType.ChartIndexTypeSmallMoneyInflow,ChartIndexType.ChartIndexTypeLargeTradeNum,ChartIndexType.ChartIndexTypeBigTradeNum,ChartIndexType.ChartIndexTypeMidTradeNum,ChartIndexType.ChartIndexTypeSmallTradeNum]}},
    {title: "增值K线-SH1006",request: "OHLCIndexReq",param:{code:"688009.sh",period:OHLCPeriod.OHLCPeriodMin1,date:"",requestType:RequestType.RequestTypeNewer,count:10,type:[ChartIndexType.ChartIndexTypeDDX,ChartIndexType.ChartIndexTypeDDY,ChartIndexType.ChartIndexTypeDDZ,ChartIndexType.ChartIndexTypeBBD,ChartIndexType.ChartIndexTypeRatioBS,ChartIndexType.ChartIndexTypeLargeMoneyInflow,ChartIndexType.ChartIndexTypeBigMoneyInflow,ChartIndexType.ChartIndexTypeMidMoneyInflow,ChartIndexType.ChartIndexTypeSmallMoneyInflow,ChartIndexType.ChartIndexTypeLargeTradeNum,ChartIndexType.ChartIndexTypeBigTradeNum,ChartIndexType.ChartIndexTypeMidTradeNum,ChartIndexType.ChartIndexTypeSmallTradeNum]}},
    {title: "增值K线-SH1100",request: "OHLCIndexReq",param:{code:"513330.sh",period:OHLCPeriod.OHLCPeriodMin1,date:"202404230932",requestType:RequestType.RequestTypeNewer,count:10,type:[ChartIndexType.ChartIndexTypeDDX,ChartIndexType.ChartIndexTypeDDY,ChartIndexType.ChartIndexTypeDDZ,ChartIndexType.ChartIndexTypeBBD,ChartIndexType.ChartIndexTypeRatioBS,ChartIndexType.ChartIndexTypeLargeMoneyInflow,ChartIndexType.ChartIndexTypeBigMoneyInflow,ChartIndexType.ChartIndexTypeMidMoneyInflow,ChartIndexType.ChartIndexTypeSmallMoneyInflow,ChartIndexType.ChartIndexTypeLargeTradeNum,ChartIndexType.ChartIndexTypeBigTradeNum,ChartIndexType.ChartIndexTypeMidTradeNum,ChartIndexType.ChartIndexTypeSmallTradeNum]}},
    {title: "增值K线-SH1300",request: "OHLCIndexReq",param:{code:"204001.sh",period:OHLCPeriod.OHLCPeriodMin1,date:"202404230932",requestType:RequestType.RequestTypeNewer,count:10,type:[ChartIndexType.ChartIndexTypeDDX,ChartIndexType.ChartIndexTypeDDY,ChartIndexType.ChartIndexTypeDDZ,ChartIndexType.ChartIndexTypeBBD,ChartIndexType.ChartIndexTypeRatioBS,ChartIndexType.ChartIndexTypeLargeMoneyInflow,ChartIndexType.ChartIndexTypeBigMoneyInflow,ChartIndexType.ChartIndexTypeMidMoneyInflow,ChartIndexType.ChartIndexTypeSmallMoneyInflow,ChartIndexType.ChartIndexTypeLargeTradeNum,ChartIndexType.ChartIndexTypeBigTradeNum,ChartIndexType.ChartIndexTypeMidTradeNum,ChartIndexType.ChartIndexTypeSmallTradeNum]}},
    {title: "增值K线-SH1400",request: "OHLCIndexReq",param:{code:"000001.sh",period:OHLCPeriod.OHLCPeriodMin1,date:"202404230932",requestType:RequestType.RequestTypeNewer,count:10,type:[ChartIndexType.ChartIndexTypeDDX,ChartIndexType.ChartIndexTypeDDY,ChartIndexType.ChartIndexTypeDDZ,ChartIndexType.ChartIndexTypeBBD,ChartIndexType.ChartIndexTypeRatioBS,ChartIndexType.ChartIndexTypeLargeMoneyInflow,ChartIndexType.ChartIndexTypeBigMoneyInflow,ChartIndexType.ChartIndexTypeMidMoneyInflow,ChartIndexType.ChartIndexTypeSmallMoneyInflow,ChartIndexType.ChartIndexTypeLargeTradeNum,ChartIndexType.ChartIndexTypeBigTradeNum,ChartIndexType.ChartIndexTypeMidTradeNum,ChartIndexType.ChartIndexTypeSmallTradeNum]}},
    {title: "增值K线-SZ1001",request: "OHLCIndexReq",param:{code:"000001.sz",period:OHLCPeriod.OHLCPeriodMin1,date:"202404230932",requestType:RequestType.RequestTypeNewer,count:10,type:[ChartIndexType.ChartIndexTypeDDX,ChartIndexType.ChartIndexTypeDDY,ChartIndexType.ChartIndexTypeDDZ,ChartIndexType.ChartIndexTypeBBD,ChartIndexType.ChartIndexTypeRatioBS,ChartIndexType.ChartIndexTypeLargeMoneyInflow,ChartIndexType.ChartIndexTypeBigMoneyInflow,ChartIndexType.ChartIndexTypeMidMoneyInflow,ChartIndexType.ChartIndexTypeSmallMoneyInflow,ChartIndexType.ChartIndexTypeLargeTradeNum,ChartIndexType.ChartIndexTypeBigTradeNum,ChartIndexType.ChartIndexTypeMidTradeNum,ChartIndexType.ChartIndexTypeSmallTradeNum]}},
    {title: "增值K线-SZ1002",request: "OHLCIndexReq",param:{code:"200625.sz",period:OHLCPeriod.OHLCPeriodMin1,date:"202404230932",requestType:RequestType.RequestTypeNewer,count:10,type:[ChartIndexType.ChartIndexTypeDDX,ChartIndexType.ChartIndexTypeDDY,ChartIndexType.ChartIndexTypeDDZ,ChartIndexType.ChartIndexTypeBBD,ChartIndexType.ChartIndexTypeRatioBS,ChartIndexType.ChartIndexTypeLargeMoneyInflow,ChartIndexType.ChartIndexTypeBigMoneyInflow,ChartIndexType.ChartIndexTypeMidMoneyInflow,ChartIndexType.ChartIndexTypeSmallMoneyInflow,ChartIndexType.ChartIndexTypeLargeTradeNum,ChartIndexType.ChartIndexTypeBigTradeNum,ChartIndexType.ChartIndexTypeMidTradeNum,ChartIndexType.ChartIndexTypeSmallTradeNum]}},
    {title: "增值K线-SZ1004",request: "OHLCIndexReq",param:{code:"300459.sz",period:OHLCPeriod.OHLCPeriodMin1,date:"202404230932",requestType:RequestType.RequestTypeNewer,count:10,type:[ChartIndexType.ChartIndexTypeDDX,ChartIndexType.ChartIndexTypeDDY,ChartIndexType.ChartIndexTypeDDZ,ChartIndexType.ChartIndexTypeBBD,ChartIndexType.ChartIndexTypeRatioBS,ChartIndexType.ChartIndexTypeLargeMoneyInflow,ChartIndexType.ChartIndexTypeBigMoneyInflow,ChartIndexType.ChartIndexTypeMidMoneyInflow,ChartIndexType.ChartIndexTypeSmallMoneyInflow,ChartIndexType.ChartIndexTypeLargeTradeNum,ChartIndexType.ChartIndexTypeBigTradeNum,ChartIndexType.ChartIndexTypeMidTradeNum,ChartIndexType.ChartIndexTypeSmallTradeNum]}},
    {title: "增值K线-SZ1100",request: "OHLCIndexReq",param:{code:"159792.sz",period:OHLCPeriod.OHLCPeriodMin1,date:"202404230932",requestType:RequestType.RequestTypeNewer,count:10,type:[ChartIndexType.ChartIndexTypeDDX,ChartIndexType.ChartIndexTypeDDY,ChartIndexType.ChartIndexTypeDDZ,ChartIndexType.ChartIndexTypeBBD,ChartIndexType.ChartIndexTypeRatioBS,ChartIndexType.ChartIndexTypeLargeMoneyInflow,ChartIndexType.ChartIndexTypeBigMoneyInflow,ChartIndexType.ChartIndexTypeMidMoneyInflow,ChartIndexType.ChartIndexTypeSmallMoneyInflow,ChartIndexType.ChartIndexTypeLargeTradeNum,ChartIndexType.ChartIndexTypeBigTradeNum,ChartIndexType.ChartIndexTypeMidTradeNum,ChartIndexType.ChartIndexTypeSmallTradeNum]}},
    {title: "增值K线-SZ1300",request: "OHLCIndexReq",param:{code:"131810.sz",period:OHLCPeriod.OHLCPeriodMin1,date:"202404230932",requestType:RequestType.RequestTypeNewer,count:10,type:[ChartIndexType.ChartIndexTypeDDX,ChartIndexType.ChartIndexTypeDDY,ChartIndexType.ChartIndexTypeDDZ,ChartIndexType.ChartIndexTypeBBD,ChartIndexType.ChartIndexTypeRatioBS,ChartIndexType.ChartIndexTypeLargeMoneyInflow,ChartIndexType.ChartIndexTypeBigMoneyInflow,ChartIndexType.ChartIndexTypeMidMoneyInflow,ChartIndexType.ChartIndexTypeSmallMoneyInflow,ChartIndexType.ChartIndexTypeLargeTradeNum,ChartIndexType.ChartIndexTypeBigTradeNum,ChartIndexType.ChartIndexTypeMidTradeNum,ChartIndexType.ChartIndexTypeSmallTradeNum]}},
    {title: "增值K线-SZ1400",request: "OHLCIndexReq",param:{code:"399001.sz",period:OHLCPeriod.OHLCPeriodMin1,date:"202404230932",requestType:RequestType.RequestTypeNewer,count:10,type:[ChartIndexType.ChartIndexTypeDDX,ChartIndexType.ChartIndexTypeDDY,ChartIndexType.ChartIndexTypeDDZ,ChartIndexType.ChartIndexTypeBBD,ChartIndexType.ChartIndexTypeRatioBS,ChartIndexType.ChartIndexTypeLargeMoneyInflow,ChartIndexType.ChartIndexTypeBigMoneyInflow,ChartIndexType.ChartIndexTypeMidMoneyInflow,ChartIndexType.ChartIndexTypeSmallMoneyInflow,ChartIndexType.ChartIndexTypeLargeTradeNum,ChartIndexType.ChartIndexTypeBigTradeNum,ChartIndexType.ChartIndexTypeMidTradeNum,ChartIndexType.ChartIndexTypeSmallTradeNum]}},
    {title: "增值K线-SZ3002",request: "OHLCIndexReq",param:{code:"90003351.sz",period:OHLCPeriod.OHLCPeriodMin1,date:"202404230932",requestType:RequestType.RequestTypeNewer,count:10,type:[ChartIndexType.ChartIndexTypeDDX,ChartIndexType.ChartIndexTypeDDY,ChartIndexType.ChartIndexTypeDDZ,ChartIndexType.ChartIndexTypeBBD,ChartIndexType.ChartIndexTypeRatioBS,ChartIndexType.ChartIndexTypeLargeMoneyInflow,ChartIndexType.ChartIndexTypeBigMoneyInflow,ChartIndexType.ChartIndexTypeMidMoneyInflow,ChartIndexType.ChartIndexTypeSmallMoneyInflow,ChartIndexType.ChartIndexTypeLargeTradeNum,ChartIndexType.ChartIndexTypeBigTradeNum,ChartIndexType.ChartIndexTypeMidTradeNum,ChartIndexType.ChartIndexTypeSmallTradeNum]}},
    {title: "增值K线-Area",request: "OHLCIndexReq",param:{code: "F10031.bk", period:OHLCPeriod.OHLCPeriodMin1,date:"202404230932",requestType:RequestType.RequestTypeNewer,count:10,type:[ChartIndexType.ChartIndexTypeRatioBS,ChartIndexType.ChartIndexTypeLargeMoneyInflow,ChartIndexType.ChartIndexTypeBigMoneyInflow,ChartIndexType.ChartIndexTypeMidMoneyInflow,ChartIndexType.ChartIndexTypeSmallMoneyInflow,ChartIndexType.ChartIndexTypeMainforceMoneyInflow,ChartIndexType.ChartIndexTypeMainforceMoneyOutflow]}},
    {title: "增值K线-Trade",request: "OHLCIndexReq",param:{code: "A20090.bk", period:OHLCPeriod.OHLCPeriodMin1,date:"202404230932",requestType:RequestType.RequestTypeNewer,count:10,type:[ChartIndexType.ChartIndexTypeLargeMoneyInflow,ChartIndexType.ChartIndexTypeBigMoneyInflow,ChartIndexType.ChartIndexTypeMidMoneyInflow,ChartIndexType.ChartIndexTypeSmallMoneyInflow,ChartIndexType.ChartIndexTypeMainforceMoneyInflow,ChartIndexType.ChartIndexTypeMainforceMoneyOutflow]}},
    {title: "增值K线-Trade_sw1",request: "OHLCIndexReq",param:{code: "D10032.bk", period:OHLCPeriod.OHLCPeriodMin1,date:"202404230932",requestType:RequestType.RequestTypeNewer,count:10,type:[ChartIndexType.ChartIndexTypeLargeMoneyInflow,ChartIndexType.ChartIndexTypeBigMoneyInflow,ChartIndexType.ChartIndexTypeMidMoneyInflow,ChartIndexType.ChartIndexTypeSmallMoneyInflow,ChartIndexType.ChartIndexTypeMainforceMoneyInflow,ChartIndexType.ChartIndexTypeMainforceMoneyOutflow]}},
    {title: "增值K线-Trade_sw",request: "OHLCIndexReq",param:{code: "D20167.bk", period:OHLCPeriod.OHLCPeriodMin1,date:"202404230932",requestType:RequestType.RequestTypeNewer,count:10,type:[ChartIndexType.ChartIndexTypeLargeMoneyInflow,ChartIndexType.ChartIndexTypeBigMoneyInflow,ChartIndexType.ChartIndexTypeMidMoneyInflow,ChartIndexType.ChartIndexTypeSmallMoneyInflow,ChartIndexType.ChartIndexTypeMainforceMoneyInflow,ChartIndexType.ChartIndexTypeMainforceMoneyOutflow]}},
    {title: "增值K线-Notion_szyp",request: "OHLCIndexReq",param:{code: "J10570.bk", period:OHLCPeriod.OHLCPeriodMin1,date:"202404230932",requestType:RequestType.RequestTypeNewer,count:10,type:[ChartIndexType.ChartIndexTypeLargeMoneyInflow,ChartIndexType.ChartIndexTypeBigMoneyInflow,ChartIndexType.ChartIndexTypeMidMoneyInflow,ChartIndexType.ChartIndexTypeSmallMoneyInflow,ChartIndexType.ChartIndexTypeMainforceMoneyInflow,ChartIndexType.ChartIndexTypeMainforceMoneyOutflow]}},
    {title: "增值K线-Area_szyp",request: "OHLCIndexReq",param:{code: "I10034.bk", period:OHLCPeriod.OHLCPeriodMin1,date:"202404230932",requestType:RequestType.RequestTypeNewer,count:10,type:[ChartIndexType.ChartIndexTypeLargeMoneyInflow,ChartIndexType.ChartIndexTypeBigMoneyInflow,ChartIndexType.ChartIndexTypeMidMoneyInflow,ChartIndexType.ChartIndexTypeSmallMoneyInflow,ChartIndexType.ChartIndexTypeMainforceMoneyInflow,ChartIndexType.ChartIndexTypeMainforceMoneyOutflow]}},
    {title: "增值K线-Trade_szyp",request: "OHLCIndexReq",param:{code: "H10052.bk", period:OHLCPeriod.OHLCPeriodMin1,date:"202404230932",requestType:RequestType.RequestTypeNewer,count:10,type:[ChartIndexType.ChartIndexTypeLargeMoneyInflow,ChartIndexType.ChartIndexTypeBigMoneyInflow,ChartIndexType.ChartIndexTypeMidMoneyInflow,ChartIndexType.ChartIndexTypeSmallMoneyInflow,ChartIndexType.ChartIndexTypeMainforceMoneyInflow,ChartIndexType.ChartIndexTypeMainforceMoneyOutflow]}},
    {title: "增值K线-Trade_fz",request: "OHLCIndexReq",param:{code: "G10076.bk", period:OHLCPeriod.OHLCPeriodMin1,date:"202404230932",requestType:RequestType.RequestTypeNewer,count:10,type:[ChartIndexType.ChartIndexTypeLargeMoneyInflow,ChartIndexType.ChartIndexTypeBigMoneyInflow,ChartIndexType.ChartIndexTypeMidMoneyInflow,ChartIndexType.ChartIndexTypeSmallMoneyInflow,ChartIndexType.ChartIndexTypeMainforceMoneyInflow,ChartIndexType.ChartIndexTypeMainforceMoneyOutflow]}},
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                  router.pushUrl({ url: 'pages/ResponsePages/OHLCIndexResp', params: value });
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
  date?: string;
  period?:OHLCPeriod;
  type?:string|CompoundUpdownsType|ChartIndexType[];
  requestType?:RequestType;
  count?:number
}