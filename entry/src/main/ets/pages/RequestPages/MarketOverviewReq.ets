import router from '@ohos.router'
@Entry
@Component
struct MarketOverviewReq {
  @State message: string = 'Hello World'
  requestList:Array<ListRequestType> = [
    {title: "市场总览",request: "MarketOverviewReq",param:{}},

    ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                  router.pushUrl({ url: 'pages/ResponsePages/MarketOverviewResp', params: value });
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
  ascending?: boolean;
}