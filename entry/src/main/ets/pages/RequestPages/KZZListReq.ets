import router from '@ohos.router'
import { KZZListField } from 'SseCore'
@Entry
@Component
struct KZZListReq {
  @State message: string = 'Hello World'
  requestList:Array<ListRequestType> = [
    {title: "可转债联动股列表-4",request: "KZZListReq",param:{pageIndex:"0",pageSize:"20",field:KZZListField.KZZListFieldChangeRateKZZ,ascending:true}},
    {title: "可转债联动股列表-11",request: "KZZListReq",param:{pageIndex:"0",pageSize:"20",field:KZZListField.KZZListFieldChangeRateZG,ascending:true}},
    {title: "可转债联动股列表-14",request: "KZZListReq",param:{pageIndex:"0",pageSize:"20",field:KZZListField.KZZListFieldPremiumRate,ascending:true}},
    {title: "可转债联动股列表-15",request: "KZZListReq",param:{pageIndex:"0",pageSize:"20",field:KZZListField.KZZListFieldConversionPrice,ascending:true}},
    {title: "可转债联动股列表-16",request: "KZZListReq",param:{pageIndex:"0",pageSize:"20",field:KZZListField.KZZListFieldConversionValue,ascending:true}},
    {title: "可转债联动股列表-17",request: "KZZListReq",param:{pageIndex:"0",pageSize:"20",field:KZZListField.KZZListFieldBackPrice,ascending:true}},
    {title: "可转债联动股列表-18",request: "KZZListReq",param:{pageIndex:"0",pageSize:"20",field:KZZListField.KZZListFieldEansomPrice,ascending:true}},
    {title: "可转债联动股列表-19",request: "KZZListReq",param:{pageIndex:"0",pageSize:"20",field:KZZListField.KZZListFieldExpirePrice,ascending:true}},
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                  router.pushUrl({ url: 'pages/ResponsePages/KZZListResp', params: value });
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
  field?: KZZListField;
  ascending?: boolean;
}