import router from '@ohos.router'
@Entry
@Component
struct DRLinkReq {
  @State message: string = 'Hello World'
  requestList:Array<ListRequestType> = [
    {title: "沪伦通联动",request: "DRLinkReq",param:{code:"600900.sh"}},
    {title: "沪伦通联动",request: "DRLinkReq",param:{code:"601615.sh"}},
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                  router.pushUrl({ url: 'pages/ResponsePages/DRLinkResp', params: value });
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