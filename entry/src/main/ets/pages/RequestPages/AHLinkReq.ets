import router from '@ohos.router'
@Entry
@Component
struct AHLinkReq {
  @State message: string = 'Hello World'
  requestList:Array<ListRequestType> = [
    {title: "AH股联动-SH",request: "AHLinkReq",param:{code:"601005.sh"}},
    {title: "AH股联动-SZ",request: "AHLinkReq",param:{code:"003816.sz"}},
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                  router.pushUrl({ url: 'pages/ResponsePages/AHLinkResp', params: value });
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