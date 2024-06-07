import router from '@ohos.router'
@Entry
@Component
struct ABLinkReq {
  @State message: string = 'Hello World'
  requestList:Array<ListRequestType> = [
    {title: "AB股联动-SH1001",request: "ABLinkReq",param:{code:"600272.sh"}},
    {title: "AB股联动-SH1002",request: "ABLinkReq",param:{code:"900940.sh"}},
    {title: "AB股联动-SZ1001",request: "ABLinkReq",param:{code:"000011.sz"}},
    {title: "AB股联动-SZ1002",request: "ABLinkReq",param:{code:"200012.sz"}},
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                  router.pushUrl({ url: 'pages/ResponsePages/ABLinkResp', params: value });
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