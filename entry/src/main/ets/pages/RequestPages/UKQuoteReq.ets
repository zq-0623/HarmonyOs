import router from '@ohos.router'
@Entry
@Component
struct UKQuoteReq {
  @State message: string = 'Hello World'
  requestList:Array<ListRequestType> = [
    {title: "UK市场行情快照-UK1540",request: "UKQuoteReq",param:{code:"MYSE.uk"}},
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                  router.pushUrl({ url: 'pages/ResponsePages/UKQuoteResp', params: value });
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
}