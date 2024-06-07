import router from '@ohos.router'
import { ChartIndexType } from 'SseCore'
@Entry
@Component
struct ChartIndexReq {
  @State message: string = 'Hello World'
  // ChartIndexTypeDDX	大单净差
  // ChartIndexTypeDDY	主力动向
  // ChartIndexTypeDDZ	涨跌动因
  // ChartIndexTypeBBD	大单差分
  // ChartIndexTypeRatioBS	单数比
  // ChartIndexTypeLargeMoneyInflow	超大单净流入
  // ChartIndexTypeBigMoneyInflow	大单净流入
  // ChartIndexTypeMidMoneyInflow	中单净流入
  // ChartIndexTypeSmallMoneyInflow	小单净流入
  // ChartIndexTypeLargeTradeNum	超大单成交单数
  // ChartIndexTypeBigTradeNum	大单成交单数
  // ChartIndexTypeMidTradeNum	中单成交单数
  // ChartIndexTypeSmallTradeNum	小单成交单数
  // ChartIndexTypeBigNetVolume	大单净量	历史k线不支持
  // ChartIndexTypeMainforceMoneyInflow	主力资金流入
  // ChartIndexTypeMainforceMoneyOutflow	主力资金流出
  requestList:Array<ListRequestType> = [
    {title: "走势副图指标接口-SH1001",request: "ChartIndexReq",param:{code:"600000.sh", subtype:"1001",type:[ChartIndexType.ChartIndexTypeDDX,ChartIndexType.ChartIndexTypeLargeMoneyInflow,ChartIndexType.ChartIndexTypeRatioBS],beginIndex:1,endIndex:3}},
    {title: "走势副图指标接口-SH1002",request: "ChartIndexReq",param:{code:"900948.sh", subtype:"1002",type:[ChartIndexType.ChartIndexTypeDDX,ChartIndexType.ChartIndexTypeLargeMoneyInflow,ChartIndexType.ChartIndexTypeRatioBS]}},
    {title: "走势副图指标接口-SH1006",request: "ChartIndexReq",param:{code:"688009.sh", subtype:"1006",type:[ChartIndexType.ChartIndexTypeDDX,ChartIndexType.ChartIndexTypeLargeMoneyInflow,ChartIndexType.ChartIndexTypeRatioBS]}},
    {title: "走势副图指标接口-SH1100",request: "ChartIndexReq",param:{code:"513330.sh", subtype: "1100",type:[ChartIndexType.ChartIndexTypeDDX,ChartIndexType.ChartIndexTypeLargeMoneyInflow,ChartIndexType.ChartIndexTypeRatioBS]}},
    {title: "走势副图指标接口-SH1300",request: "ChartIndexReq",param:{code: "204001.sh", subtype: "1300",type:[ChartIndexType.ChartIndexTypeDDX,ChartIndexType.ChartIndexTypeLargeMoneyInflow,ChartIndexType.ChartIndexTypeRatioBS]}},
    {title: "走势副图指标接口-SH1400",request: "ChartIndexReq",param:{code: "000001.sh", subtype: "1400",type:[ChartIndexType.ChartIndexTypeDDX,ChartIndexType.ChartIndexTypeLargeMoneyInflow,ChartIndexType.ChartIndexTypeRatioBS]}},
    {title: "走势副图指标接口-SH3002",request: "ChartIndexReq",param:{code: "10006414.sh", subtype: "3002",type:[ChartIndexType.ChartIndexTypeDDX,ChartIndexType.ChartIndexTypeLargeMoneyInflow,ChartIndexType.ChartIndexTypeRatioBS]}},
    {title: "走势副图指标接口-SZ1001",request: "ChartIndexReq",param:{code: "000001.sz", subtype: "1001",type:[ChartIndexType.ChartIndexTypeDDX,ChartIndexType.ChartIndexTypeLargeMoneyInflow,ChartIndexType.ChartIndexTypeRatioBS]}},
    {title: "走势副图指标接口-SZ1002",request: "ChartIndexReq",param:{code: "200625.sz", subtype: "1002",type:[ChartIndexType.ChartIndexTypeDDX,ChartIndexType.ChartIndexTypeLargeMoneyInflow,ChartIndexType.ChartIndexTypeRatioBS]}},
    {title: "走势副图指标接口-SZ1004",request: "ChartIndexReq",param:{code: "300459.sz", subtype: "1004",type:[ChartIndexType.ChartIndexTypeDDX,ChartIndexType.ChartIndexTypeLargeMoneyInflow,ChartIndexType.ChartIndexTypeRatioBS]}},
    {title: "走势副图指标接口-SZ1100",request: "ChartIndexReq",param:{code: "159792.sz", subtype: "1100",type:[ChartIndexType.ChartIndexTypeDDX,ChartIndexType.ChartIndexTypeLargeMoneyInflow,ChartIndexType.ChartIndexTypeRatioBS]}},
    {title: "走势副图指标接口-SZ1300",request: "ChartIndexReq",param:{code: "131810.sz", subtype: "1300",type:[ChartIndexType.ChartIndexTypeDDX,ChartIndexType.ChartIndexTypeLargeMoneyInflow,ChartIndexType.ChartIndexTypeRatioBS]}},
    {title: "走势副图指标接口-SZ1400",request: "ChartIndexReq",param:{code: "399001.sz", subtype: "1400",type:[ChartIndexType.ChartIndexTypeDDX,ChartIndexType.ChartIndexTypeLargeMoneyInflow,ChartIndexType.ChartIndexTypeRatioBS]}},
    {title: "走势副图指标接口-SZ3002",request: "ChartIndexReq",param:{code: "90002507.sz", subtype: "3002",type:[ChartIndexType.ChartIndexTypeDDX,ChartIndexType.ChartIndexTypeLargeMoneyInflow,ChartIndexType.ChartIndexTypeRatioBS]}},
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                  router.pushUrl({ url: 'pages/ResponsePages/ChartIndexResp', params: value });
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
  type?:ChartIndexType[];
  beginIndex?:number;
  endIndex?:number;
}