import router from '@ohos.router'
@Entry
@Component
struct HSAmountAllReq {
  @State message: string = 'Hello World'
  requestList:Array<ListRequestType> = [
    {title: "获取港股通额度统计(南北向交易)",request: "HSAmountAllReq",param:{}},
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                router.pushUrl({ url: 'pages/ResponsePages/HSAmountAllResp', params: value });
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