import router from '@ohos.router'
import { 	ABListField } from 'SseCore'
@Entry
@Component
struct ABListReq {
  @State message: string = 'Hello World'
  requestList:Array<ListRequestType> = [
    {title: "AB股列表-0",request: "ABListReq",param:{pageIndex:"0",pageSize:"20",field:ABListField.ABListFieldCodeA,ascending:true}},
    {title: "AB股列表-1",request: "ABListReq",param:{pageIndex:"0",pageSize:"20",field:ABListField.ABListFieldNameA,ascending:true}},
    {title: "AB股列表-3",request: "ABListReq",param:{pageIndex:"0",pageSize:"20",field:ABListField.ABListFieldLastPriceA,ascending:true}},
    {title: "AB股列表-4",request: "ABListReq",param:{pageIndex:"0",pageSize:"20",field:ABListField.ABListFieldChangeRateA,ascending:true}},
    {title: "AB股列表-6",request: "ABListReq",param:{pageIndex:"0",pageSize:"20",field:ABListField.ABListFieldCodeB,ascending:true}},
    {title: "AB股列表-7",request: "ABListReq",param:{pageIndex:"0",pageSize:"20",field:ABListField.ABListFieldNameB,ascending:true}},
    {title: "AB股列表-9",request: "ABListReq",param:{pageIndex:"0",pageSize:"20",field:ABListField.ABListFieldLastPriceB,ascending:true}},
    {title: "AB股列表-10",request: "ABListReq",param:{pageIndex:"0",pageSize:"20",field:ABListField.ABListFieldChangeRateB,ascending:true}},
    {title: "AB股列表-12",request: "ABListReq",param:{pageIndex:"0",pageSize:"20",field:ABListField.ABListFieldPremiumRateAB,ascending:true}},
    {title: "AB股列表-13",request: "ABListReq",param:{pageIndex:"0",pageSize:"20",field:ABListField.ABListFieldPremiumRateBA,ascending:true}},
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                  router.pushUrl({ url: 'pages/ResponsePages/ABListResp', params: value });
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
  pageIndex?: string;
  pageSize?: string;
  field?: ABListField;
  ascending?: boolean;
}