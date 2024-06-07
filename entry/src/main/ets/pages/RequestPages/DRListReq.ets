import router from '@ohos.router'
import { 	DRListField } from 'SseCore'
@Entry
@Component
struct DRListReq {
  @State message: string = 'Hello World'
  requestList:Array<ListRequestType> = [
    {title: "CDR联动列表-0",request: "DRListReq",param:{code:"cdr",pageIndex:0,pageSize:20,field:DRListField.DRListFieldCode,ascending:true}},
    {title: "CDR联动列表-1",request: "DRListReq",param:{code:"cdr",pageIndex:0,pageSize:20,field:DRListField.DRListFieldName,ascending:true}},
    {title: "CDR联动列表-3",request: "DRListReq",param:{code:"cdr",pageIndex:0,pageSize:20,field:DRListField.DRListFieldLastPrice,ascending:true}},
    {title: "CDR联动列表-4",request: "DRListReq",param:{code:"cdr",pageIndex:0,pageSize:20,field:DRListField.DRListFieldPreClosePrice,ascending:true}},
    {title: "CDR联动列表-5",request: "DRListReq",param:{code:"cdr",pageIndex:0,pageSize:20,field:DRListField.DRListFieldChangeRate,ascending:true}},
    {title: "CDR联动列表-6",request: "DRListReq",param:{code:"cdr",pageIndex:0,pageSize:20,field:DRListField.DRListFieldDatetime,ascending:true}},
    {title: "CDR联动列表-7",request: "DRListReq",param:{code:"cdr",pageIndex:0,pageSize:20,field:DRListField.DRListFieldBaseStockCode,ascending:true}},
    {title: "CDR联动列表-8",request: "DRListReq",param:{code:"cdr",pageIndex:0,pageSize:20,field:DRListField.DRListFieldBaseStockName,ascending:true}},
    {title: "CDR联动列表-10",request: "DRListReq",param:{code:"cdr",pageIndex:0,pageSize:20,field:DRListField.DRListFieldBaseLastPrice,ascending:true}},
    {title: "CDR联动列表-11",request: "DRListReq",param:{code:"cdr",pageIndex:0,pageSize:20,field:DRListField.DRListFieldBasePreClosePrice,ascending:true}},
    {title: "CDR联动列表-12",request: "DRListReq",param:{code:"cdr",pageIndex:0,pageSize:20,field:DRListField.DRListFieldBaseChangeRate,ascending:true}},
    {title: "CDR联动列表-13",request: "DRListReq",param:{code:"cdr",pageIndex:0,pageSize:20,field:DRListField.DRListFieldBaseDatetime,ascending:true}},
    {title: "CDR联动列表-14",request: "DRListReq",param:{code:"cdr",pageIndex:0,pageSize:20,field:DRListField.DRListFieldPremiumRate,ascending:true}},
    {title:"=================================="},
    {title: "GDR联动列表-0",request: "DRListReq",param:{code:"gdr",pageIndex:0,pageSize:20,field:DRListField.DRListFieldCode,ascending:true}},
    {title: "GDR联动列表-1",request: "DRListReq",param:{code:"gdr",pageIndex:0,pageSize:20,field:DRListField.DRListFieldName,ascending:true}},
    {title: "GDR联动列表-3",request: "DRListReq",param:{code:"gdr",pageIndex:0,pageSize:20,field:DRListField.DRListFieldLastPrice,ascending:true}},
    {title: "GDR联动列表-4",request: "DRListReq",param:{code:"gdr",pageIndex:0,pageSize:20,field:DRListField.DRListFieldPreClosePrice,ascending:true}},
    {title: "GDR联动列表-5",request: "DRListReq",param:{code:"gdr",pageIndex:0,pageSize:20,field:DRListField.DRListFieldChangeRate,ascending:true}},
    {title: "GDR联动列表-6",request: "DRListReq",param:{code:"gdr",pageIndex:0,pageSize:20,field:DRListField.DRListFieldDatetime,ascending:true}},
    {title: "GDR联动列表-7",request: "DRListReq",param:{code:"gdr",pageIndex:0,pageSize:20,field:DRListField.DRListFieldBaseStockCode,ascending:true}},
    {title: "GDR联动列表-8",request: "DRListReq",param:{code:"gdr",pageIndex:0,pageSize:20,field:DRListField.DRListFieldBaseStockName,ascending:true}},
    {title: "GDR联动列表-10",request: "DRListReq",param:{code:"gdr",pageIndex:0,pageSize:20,field:DRListField.DRListFieldBaseLastPrice,ascending:true}},
    {title: "GDR联动列表-11",request: "DRListReq",param:{code:"gdr",pageIndex:0,pageSize:20,field:DRListField.DRListFieldBasePreClosePrice,ascending:true}},
    {title: "GDR联动列表-12",request: "DRListReq",param:{code:"gdr",pageIndex:0,pageSize:20,field:DRListField.DRListFieldBaseChangeRate,ascending:true}},
    {title: "GDR联动列表-13",request: "DRListReq",param:{code:"gdr",pageIndex:0,pageSize:20,field:DRListField.DRListFieldBaseDatetime,ascending:true}},
    {title: "GDR联动列表-14",request: "DRListReq",param:{code:"gdr",pageIndex:0,pageSize:20,field:DRListField.DRListFieldPremiumRate,ascending:true}},
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                  router.pushUrl({ url: 'pages/ResponsePages/DRListResp', params: value });
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
  code?: string
  pageIndex?: number;
  pageSize?: number;
  field?:  DRListField;
  ascending?: boolean;
}