import router from '@ohos.router'
import { 	AHListField } from 'SseCore'
@Entry
@Component
struct AHListReq {
  @State message: string = 'Hello World'
  requestList:Array<ListRequestType> = [
    {title: "AH股列表-2",request: "AHListReq",param:{pageIndex:"0",pageSize:"20",field:AHListField.AHListFieldLastPriceA,ascending:true}},
    {title: "AH股列表-3",request: "AHListReq",param:{pageIndex:"0",pageSize:"20",field:AHListField.AHListFieldChangeRateA,ascending:true}},
    {title: "AH股列表-6",request: "AHListReq",param:{pageIndex:"0",pageSize:"20",field:AHListField.AHListFieldLastPriceH,ascending:true}},
    {title: "AH股列表-7",request: "AHListReq",param:{pageIndex:"0",pageSize:"20",field:AHListField.AHListFieldChangeRateH,ascending:true}},
    {title: "AH股列表-9",request: "AHListReq",param:{pageIndex:"0",pageSize:"20",field:AHListField.AHListFieldPremiumRate,ascending:true}},
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                  router.pushUrl({ url: 'pages/ResponsePages/AHListResp', params: value });
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
  field?: AHListField;
  ascending?: boolean;
}