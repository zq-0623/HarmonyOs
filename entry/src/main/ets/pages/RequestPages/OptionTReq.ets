import router from '@ohos.router'
@Entry
@Component
struct OptionTReq {
  @State message: string = 'Hello World'
  // expireMonth: 交割年月
      // 格式如下：
      // 不带字母(2001),返回2001所有期权
      // 带字母M(2001M),返回2001未调整的期权
      // 带字母A(2001A),返回2001调整的期权
  requestList:Array<ListRequestType> = [
    {title: "期权T型报价-SH1001",request: "OptionTReq",param:{code:"159915.sz",expireMonth:"2409M"}},
    {title: "期权T型报价-SH1002",request: "OptionTReq",param:{code:"900948.sh",expireMonth:"2312"}},
    {title: "期权T型报价-SH1006",request: "OptionTReq",param:{code:"688009.sh",expireMonth:"2312"}},
    {title: "期权T型报价-SH1100",request: "OptionTReq",param:{code:"513330.sh",expireMonth:"2312"}},
    {title: "期权T型报价-SH1300",request: "OptionTReq",param:{code:"204001.sh",expireMonth:""}},
    {title: "期权T型报价-SH1400",request: "OptionTReq",param:{code:"000001.sh",expireMonth:"2312"}},
    {title: "期权T型报价-SH3002",request: "OptionTReq",param:{code:"10005812.sh",expireMonth:"2312"}},
    {title: "期权T型报价-SH8100",request: "OptionTReq",param:{code:"901033.sh",expireMonth:"2312"}},
    {title: "期权T型报价-SZ1001",request: "OptionTReq",param:{code:"000001.sz",expireMonth:"2312"}},
    {title: "期权T型报价-SZ1002",request: "OptionTReq",param:{code:"200625.sz",expireMonth:"2312"}},
    {title: "期权T型报价-SZ1004",request: "OptionTReq",param:{code:"300459.sz",expireMonth:"2312"}},
    {title: "期权T型报价-SZ1100",request: "OptionTReq",param:{code:"159792.sz",expireMonth:"2312"}},
    {title: "期权T型报价-SZ1300",request: "OptionTReq",param:{code:"131810.sz",expireMonth:"2312"}},
    {title: "期权T型报价-SZ1400",request: "OptionTReq",param:{code:"399001.sz",expireMonth:"2312"}},
    {title: "期权T型报价-SZ3002",request: "OptionTReq",param:{code:"90002507.sz",expireMonth:"2312"}},
    {title: "期权T型报价-SZ8100",request: "OptionTReq",param:{code:"299920.sz",expireMonth:"2312"}},
    {title: "期权T型报价-CFF",request: "OptionTReq",param:{code:"HO2403-C-1975.cff",expireMonth:"2312"}},
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                  router.pushUrl({ url: 'pages/ResponsePages/OptionTResp', params: value });
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
  expireMonth?:string
}