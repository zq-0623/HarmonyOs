import router from '@ohos.router'
@Entry
@Component
struct UnderlyingStockReq {
  @State message: string = 'Hello World'
  // market
      // 传入"sz"则获取深圳市场标的列表，传入"sh,sz"获取上海和深圳市场标的列表，不传或者传入"sh"则获取上海市场标的列表
  requestList:Array<ListRequestType> = [
    {title: "标的证券列表-SH",request: "UnderlyingStockReq",param:{market:"sh"}},
    {title: "标的证券列表-SZ",request: "UnderlyingStockReq",param:{market:"sz"}},
    {title: "标的证券列表-SHSZ",request: "UnderlyingStockReq",param:{market:"sh,sz"}},
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                  router.pushUrl({ url: 'pages/ResponsePages/UnderlyingStockResp', params: value });
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
  market?: string;
}