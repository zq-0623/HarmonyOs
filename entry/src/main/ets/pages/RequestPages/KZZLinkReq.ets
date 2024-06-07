import router from '@ohos.router'
@Entry
@Component
struct KZZLinkReq {
  @State message: string = 'Hello World'
  requestList:Array<ListRequestType> = [
    {title: "可转债联动-SH1300",request: "KZZLinkReq",param:{code:"600996.sh"}},
    {title: "可转债联动-SZ1300",request: "KZZLinkReq",param:{code:"127096.sz"}},
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                  router.pushUrl({ url: 'pages/ResponsePages/KZZLinkResp', params: value });
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