import router from '@ohos.router'
@Entry
@Component
struct KZZInfoReq {
  @State message: string = 'Hello World'
  requestList:Array<ListRequestType> = [
    {title: "可转债静态信息-SZ1300",request: "KZZInfoReq",param:{code:"127072.sz"}},
    {title: "可转债静态信息-SH1300",request: "KZZInfoReq",param:{code:"113680.sh"}},
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                  router.pushUrl({ url: 'pages/ResponsePages/KZZInfoResp', params: value });
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