import router from '@ohos.router'
import { 	SubnewStockField } from 'SseCore'
@Entry
@Component
struct SubnewStockReq {
  @State message: string = 'Hello World'
  requestList:Array<ListRequestType> = [
    {title: "参数校验-小数",request: "SubnewStockReq",param:{pageIndex:0.3,pageSize:20.4,field:SubnewStockField.SubnewStockFieldCode,ascending:true}},
    {title: "参数校验-负数",request: "SubnewStockReq",param:{pageIndex:-3,pageSize:-20,field:SubnewStockField.SubnewStockFieldCode,ascending:true}},
    {title: "参数校验-filed不传",request: "SubnewStockReq",param:{pageIndex:0,pageSize:20.,ascending:true}},
    {title: "参数校验-filed传undefined",request: "SubnewStockReq",param:{pageIndex:0,pageSize:20,field:undefined,ascending:true}},
    {title: "参数校验-排序传undefined",request: "SubnewStockReq",param:{pageIndex:0,pageSize:20,field:SubnewStockField.SubnewStockFieldCode,ascending:undefined}},
    {title: "次新股-0-0",request: "SubnewStockReq",param:{pageIndex:0,pageSize:20,field:SubnewStockField.SubnewStockFieldCode,ascending:true}},
    {title: "次新股-0-1",request: "SubnewStockReq",param:{pageIndex:0,pageSize:20,field:SubnewStockField.SubnewStockFieldCode,ascending:false}},
    {title: "次新股-2-0",request: "SubnewStockReq",param:{pageIndex:0,pageSize:20,field:SubnewStockField.SubnewStockFieldIPOPrice,ascending:true}},
    {title: "次新股-2-1",request: "SubnewStockReq",param:{pageIndex:0,pageSize:20,field:SubnewStockField.SubnewStockFieldIPOPrice,ascending:false}},
    {title: "次新股-3-0",request: "SubnewStockReq",param:{pageIndex:0,pageSize:20,field:SubnewStockField.SubnewStockFieldLastPrice,ascending:true}},
    {title: "次新股-3-1",request: "SubnewStockReq",param:{pageIndex:0,pageSize:20,field:SubnewStockField.SubnewStockFieldLastPrice,ascending:false}},
    {title: "次新股-4-0",request: "SubnewStockReq",param:{pageIndex:0,pageSize:20,field:SubnewStockField.SubnewStockFieldIPODate,ascending:true}},
    {title: "次新股-4-1",request: "SubnewStockReq",param:{pageIndex:0,pageSize:20,field:SubnewStockField.SubnewStockFieldIPODate,ascending:false}},
    {title: "次新股-5-0",request: "SubnewStockReq",param:{pageIndex:0,pageSize:20,field:SubnewStockField.SubnewStockFieldContinuousLimitUpDays,ascending:true}},
    {title: "次新股-5-1",request: "SubnewStockReq",param:{pageIndex:0,pageSize:20,field:SubnewStockField.SubnewStockFieldContinuousLimitUpDays,ascending:false}},
    {title: "次新股-7-0",request: "SubnewStockReq",param:{pageIndex:0,pageSize:20,field:SubnewStockField.SubnewStockFieldPreClosePrice,ascending:true}},
    {title: "次新股-7-1",request: "SubnewStockReq",param:{pageIndex:0,pageSize:20,field:SubnewStockField.SubnewStockFieldPreClosePrice,ascending:false}},
    {title: "次新股-8-0",request: "SubnewStockReq",param:{pageIndex:0,pageSize:20,field:SubnewStockField.SubnewStockFieldTotalRate,ascending:true}},
    {title: "次新股-8-1",request: "SubnewStockReq",param:{pageIndex:0,pageSize:20,field:SubnewStockField.SubnewStockFieldTotalRate,ascending:false}},
    {title: "次新股-9-0",request: "SubnewStockReq",param:{pageIndex:0,pageSize:20,field:SubnewStockField.SubnewStockFieldChange,ascending:true}},
    {title: "次新股-9-1",request: "SubnewStockReq",param:{pageIndex:0,pageSize:20,field:SubnewStockField.SubnewStockFieldChange,ascending:false}},
    {title: "次新股-10-0",request: "SubnewStockReq",param:{pageIndex:0,pageSize:20,field:SubnewStockField.SubnewStockFieldTurnoverRate,ascending:true}},
    {title: "次新股-10-1",request: "SubnewStockReq",param:{pageIndex:0,pageSize:20,field:SubnewStockField.SubnewStockFieldTurnoverRate,ascending:false}},
    {title: "次新股-11-0",request: "SubnewStockReq",param:{pageIndex:0,pageSize:20,field:SubnewStockField.SubnewStockFieldAmount,ascending:true}},
    {title: "次新股-11-1",request: "SubnewStockReq",param:{pageIndex:0,pageSize:20,field:SubnewStockField.SubnewStockFieldAmount,ascending:false}},
    {title: "次新股-12-0",request: "SubnewStockReq",param:{pageIndex:0,pageSize:20,field:SubnewStockField.SubnewStockFieldCapitalInflow,ascending:true}},
    {title: "次新股-12-1",request: "SubnewStockReq",param:{pageIndex:0,pageSize:20,field:SubnewStockField.SubnewStockFieldCapitalInflow,ascending:false}},
    {title: "次新股-13-0",request: "SubnewStockReq",param:{pageIndex:0,pageSize:20,field:SubnewStockField.SubnewStockFieldPE,ascending:true}},
    {title: "次新股-13-1",request: "SubnewStockReq",param:{pageIndex:0,pageSize:20,field:SubnewStockField.SubnewStockFieldPE,ascending:false}},
    {title: "次新股-14-0",request: "SubnewStockReq",param:{pageIndex:0,pageSize:20,field:SubnewStockField.SubnewStockFieldTotalValue,ascending:true}},
    {title: "次新股-14-1",request: "SubnewStockReq",param:{pageIndex:0,pageSize:20,field:SubnewStockField.SubnewStockFieldTotalValue,ascending:false}},
    {title: "次新股-15-0",request: "SubnewStockReq",param:{pageIndex:0,pageSize:20,field:SubnewStockField.SubnewStockFieldFlowValue,ascending:true}},
    {title: "次新股-15-1",request: "SubnewStockReq",param:{pageIndex:0,pageSize:20,field:SubnewStockField.SubnewStockFieldFlowValue,ascending:false}},
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                  router.pushUrl({ url: 'pages/ResponsePages/SubnewStockResp', params: value });
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
  pageIndex?: number;
  pageSize?: number;
  field?: SubnewStockField;
  ascending?: boolean;
}