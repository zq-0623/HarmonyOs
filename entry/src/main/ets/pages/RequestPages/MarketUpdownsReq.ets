import router from '@ohos.router'
@Entry
@Component
struct MarketUpdownsReq {
  @State message: string = 'Hello World'
  requestList:Array<ListRequestType> = [
    {title: "沪深京当日涨跌统计数据请求类",request: "MarketUpdownsReq",param:{}},
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                router.pushUrl({ url: 'pages/ResponsePages/MarketUpdownsResp', params: value });
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

}