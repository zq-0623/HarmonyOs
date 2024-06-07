import router from '@ohos.router'
@Entry
@Component
struct ExpireMonthReq {
  @State message: string = 'Hello World'
  requestList:Array<ListRequestType> = [
    {title: "交割月列表-SH1001",request: "ExpireMonthReq",param:{code:"600000.sh"}},
    {title: "交割月列表-SH1002",request: "ExpireMonthReq",param:{code:"900948.sh"}},
    {title: "交割月列表-SH1006",request: "ExpireMonthReq",param:{code:"688009.sh"}},
    {title: "交割月列表-SH1100",request: "ExpireMonthReq",param:{code:"510050.sh"}},
    {title: "交割月列表-SH1300",request: "ExpireMonthReq",param:{code:"204001.sh"}},
    {title: "交割月列表-SH1400",request: "ExpireMonthReq",param:{code:"000001.sh"}},
    {title: "交割月列表-SH3002",request: "ExpireMonthReq",param:{code:"10005812.sh"}},
    {title: "交割月列表-SH8100",request: "ExpireMonthReq",param:{code:"901033.sh"}},
    {title: "交割月列表-SZ1001",request: "ExpireMonthReq",param:{code:"000001.sz"}},
    {title: "交割月列表-SZ1002",request: "ExpireMonthReq",param:{code:"200625.sz"}},
    {title: "交割月列表-SZ1004",request: "ExpireMonthReq",param:{code:"300459.sz"}},
    {title: "交割月列表-SZ1100",request: "ExpireMonthReq",param:{code:"159792.sz"}},
    {title: "交割月列表-SZ1300",request: "ExpireMonthReq",param:{code:"131810.sz"}},
    {title: "交割月列表-SZ1400",request: "ExpireMonthReq",param:{code:"399001.sz"}},
    {title: "交割月列表-SZ3002",request: "ExpireMonthReq",param:{code:"90002507.sz"}},
    {title: "交割月列表-SZ8100",request: "ExpireMonthReq",param:{code:"299920.sz"}},
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                  router.pushUrl({ url: 'pages/ResponsePages/ExpireMonthResp', params: value });
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