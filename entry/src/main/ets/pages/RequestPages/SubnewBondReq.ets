import router from '@ohos.router'
import { SubnewBondField } from 'SseCore'
@Entry
@Component
struct SubnewBondReq {
  @State message: string = 'Hello World'
  requestList:Array<ListRequestType> = [
    {title: "参数校验-小数",request: "SubnewBondReq",param:{pageIndex:0.3,pageSize:20.4,field:SubnewBondField.SubnewBondFieldCode,ascending:true}},
    {title: "参数校验-负数",request: "SubnewBondReq",param:{pageIndex:0,pageSize:-20,field:SubnewBondField.SubnewBondFieldCode,ascending:true}},
    {title: "参数校验-filed不传",request: "SubnewBondReq",param:{pageIndex:0,pageSize:20,ascending:true}},
    {title: "参数校验-filed传undefined",request: "SubnewBondReq",param:{pageIndex:0,pageSize:20,field:undefined,ascending:true}},
    {title: "参数校验-排序传undefined",request: "SubnewBondReq",param:{pageIndex:0,pageSize:20,field:SubnewBondField.SubnewBondFieldCode,ascending:undefined}},
    {title: "次新债列表-0-0",request: "SubnewBondReq",param:{pageIndex:0,pageSize:20,field:SubnewBondField.SubnewBondFieldCode,ascending:true}},
    {title: "次新债列表-0-1",request: "SubnewBondReq",param:{pageIndex:0,pageSize:20,field:SubnewBondField.SubnewBondFieldCode,ascending:false}},
    {title: "次新债列表-2-0",request: "SubnewBondReq",param:{pageIndex:0,pageSize:20,field:SubnewBondField.SubnewBondFieldIPOPrice,ascending:true}},
    {title: "次新债列表-2-1",request: "SubnewBondReq",param:{pageIndex:0,pageSize:20,field:SubnewBondField.SubnewBondFieldIPOPrice,ascending:false}},
    {title: "次新债列表-3-0",request: "SubnewBondReq",param:{pageIndex:0,pageSize:20,field:SubnewBondField.SubnewBondFieldLastPrice,ascending:true}},
    {title: "次新债列表-3-1",request: "SubnewBondReq",param:{pageIndex:0,pageSize:20,field:SubnewBondField.SubnewBondFieldLastPrice,ascending:false}},
    {title: "次新债列表-4-0",request: "SubnewBondReq",param:{pageIndex:0,pageSize:20,field:SubnewBondField.SubnewBondFieldIPODate,ascending:true}},
    {title: "次新债列表-4-1",request: "SubnewBondReq",param:{pageIndex:0,pageSize:20,field:SubnewBondField.SubnewBondFieldIPODate,ascending:false}},
    {title: "次新债列表-6-0",request: "SubnewBondReq",param:{pageIndex:0,pageSize:20,field:SubnewBondField.SubnewBondFieldPreClosePrice,ascending:true}},
    {title: "次新债列表-6-1",request: "SubnewBondReq",param:{pageIndex:0,pageSize:20,field:SubnewBondField.SubnewBondFieldPreClosePrice,ascending:false}},
    {title: "次新债列表-7-0",request: "SubnewBondReq",param:{pageIndex:0,pageSize:20,field:SubnewBondField.SubnewBondFieldTotalRate,ascending:true}},
    {title: "次新债列表-7-1",request: "SubnewBondReq",param:{pageIndex:0,pageSize:20,field:SubnewBondField.SubnewBondFieldTotalRate,ascending:false}},
    {title: "次新债列表-8-0",request: "SubnewBondReq",param:{pageIndex:0,pageSize:20,field:SubnewBondField.SubnewBondFieldChange,ascending:true}},
    {title: "次新债列表-8-1",request: "SubnewBondReq",param:{pageIndex:0,pageSize:20,field:SubnewBondField.SubnewBondFieldChange,ascending:false}},
    {title: "次新债列表-9-0",request: "SubnewBondReq",param:{pageIndex:0,pageSize:20,field:SubnewBondField.SubnewBondFieldTurnoverRate,ascending:true}},
    {title: "次新债列表-9-1",request: "SubnewBondReq",param:{pageIndex:0,pageSize:20,field:SubnewBondField.SubnewBondFieldTurnoverRate,ascending:false}},
    {title: "次新债列表-10-0",request: "SubnewBondReq",param:{pageIndex:0,pageSize:20,field:SubnewBondField.SubnewBondFieldAmount,ascending:true}},
    {title: "次新债列表-10-1",request: "SubnewBondReq",param:{pageIndex:0,pageSize:20,field:SubnewBondField.SubnewBondFieldAmount,ascending:false}},
    {title: "次新债列表-11-0",request: "SubnewBondReq",param:{pageIndex:0,pageSize:20,field:SubnewBondField.SubnewBondFieldCapitalInflow,ascending:true}},
    {title: "次新债列表-11-1",request: "SubnewBondReq",param:{pageIndex:0,pageSize:20,field:SubnewBondField.SubnewBondFieldCapitalInflow,ascending:false}},
    {title: "次新债列表-12-0",request: "SubnewBondReq",param:{pageIndex:0,pageSize:20,field:SubnewBondField.SubnewBondFieldPE,ascending:true}},
    {title: "次新债列表-12-1",request: "SubnewBondReq",param:{pageIndex:0,pageSize:20,field:SubnewBondField.SubnewBondFieldPE,ascending:false}},
    {title: "次新债列表-13-0",request: "SubnewBondReq",param:{pageIndex:0,pageSize:20,field:SubnewBondField.SubnewBondFieldTotalValue,ascending:true}},
    {title: "次新债列表-13-1",request: "SubnewBondReq",param:{pageIndex:0,pageSize:20,field:SubnewBondField.SubnewBondFieldTotalValue,ascending:false}},
    {title: "次新债列表-14-0",request: "SubnewBondReq",param:{pageIndex:0,pageSize:20,field:SubnewBondField.SubnewBondFieldFlowValue,ascending:true}},
    {title: "次新债列表-14-1",request: "SubnewBondReq",param:{pageIndex:0,pageSize:20,field:SubnewBondField.SubnewBondFieldFlowValue,ascending:false}},


  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                  router.pushUrl({ url: 'pages/ResponsePages/SubnewDondResp', params: value });
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
  field?: SubnewBondField;
  ascending?: boolean;
}