import router from '@ohos.router'
@Entry
@Component
struct HKStockInfoReq {
  @State message: string = 'Hello World'
  requestList:Array<ListRequestType> = [
    {title: "code不传",request: "HKStockInfoReq",param:{subtype:"1010"}},
    {title: "code传空",request: "HKStockInfoReq",param:{code:"",subtype:"1010"}},
    {title: "code传错",request: "HKStockInfoReq",param:{code:"60000000000.hk",subtype:"1010"}},
    {title: "code不存在",request: "HKStockInfoReq",param:{code:"12345.hk",subtype:"1010"}},
    {title: "code传多个",request: "HKStockInfoReq",param:{code:"00968.hk,03032.hk",subtype:"1010"}},
    {title: "subtype不传",request: "HKStockInfoReq",param:{code:"00968.hk"}},
    {title: "subtype传错",request: "HKStockInfoReq",param:{code:"00968.hk",subtype:"1400"}},
    {title: "subtype传对",request: "HKStockInfoReq",param:{code:"01024.hk",subtype:"1010"}},
    {title: "港股波动调节等信息-HK1004",request: "HKStockInfoReq",param:{code:"00388.hk",subtype:"1004"}},
    {title: "港股波动调节等信息-HK1100",request: "HKStockInfoReq",param:{code:"03032.hk",subtype:"1100"}},
    {title: "港股波动调节等信息-HK1300",request: "HKStockInfoReq",param:{code:"00992.hk",subtype:"1300"}},
    {title: "港股波动调节等信息-HK1500",request: "HKStockInfoReq",param:{code:"52383.hk",subtype:"1500"}},
    {title: "港股波动调节等信息-HK1600",request: "HKStockInfoReq",param:{code:"20317.hk",subtype:"1600"}},
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                  router.pushUrl({ url: 'pages/ResponsePages/HKStockInfoResp', params: value });
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
}