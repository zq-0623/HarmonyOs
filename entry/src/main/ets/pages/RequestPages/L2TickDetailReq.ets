import router from '@ohos.router'
@Entry
@Component
struct L2TickDetailReq {
  @State message: string = 'Hello World'
  requestList:Array<ListRequestType> = [
    {title: "请求L2单独逐笔明细-SH1001",request: "L2TickDetailReq",param:{code:"600000.sh", param:"74200,100,0", subtype:"1001"}},
    {title: "请求L2单独逐笔明细-SH1002",request: "L2TickDetailReq",param:{code:"900948.sh", param:"0,100,-1", subtype:"1002"}},
    {title: "请求L2单独逐笔明细-SH1006",request: "L2TickDetailReq",param:{code:"688009.sh", param:"0,100,-1", subtype:"1006"}},
    {title: "请求L2单独逐笔明细-SH1100",request: "L2TickDetailReq",param:{code:"513330.sh", param:"0,100,-1", subtype:"1100"}},
    {title: "请求L2单独逐笔明细-SH1300",request: "L2TickDetailReq",param:{code:"204001.sh", param:"0,100,-1", subtype:"1300"}},
    {title: "请求L2单独逐笔明细-SH1400",request: "L2TickDetailReq",param:{code:"000001.sh", param:"0,100,-1", subtype:"1400"}},
    {title: "请求L2单独逐笔明细-SH3002",request: "L2TickDetailReq",param:{code:"10006414.sh", param:"0,100,-1", subtype:"3002"}},
    {title: "请求L2单独逐笔明细-SZ1001",request: "L2TickDetailReq",param:{code:"000001.sz", param:"925,100,2", subtype:"1001"}},
    {title: "请求L2单独逐笔明细-SZ1002",request: "L2TickDetailReq",param:{code:"200625.sz", param:"0,100,-1", subtype:"1002"}},
    {title: "请求L2单独逐笔明细-SZ1004",request: "L2TickDetailReq",param:{code:"300459.sz", param:"0,100,-1", subtype:"1004"}},
    {title: "请求L2单独逐笔明细-SZ1100",request: "L2TickDetailReq",param:{code:"159792.sz", param:"0,100,-1", subtype:"1100"}},
    {title: "请求L2单独逐笔明细-SZ1300",request: "L2TickDetailReq",param:{code:"131810.sz", param:"0,100,-1", subtype:"1300"}},
    {title: "请求L2单独逐笔明细-SZ1400",request: "L2TickDetailReq",param:{code:"399001.sz", param:"0,100,-1", subtype:"1300"}},
    {title: "请求L2单独逐笔明细-SZ3002",request: "L2TickDetailReq",param:{code:"90002507.sz", param:"0,100,-1", subtype:"3002"}},
    {title: "请求L2单独逐笔明细-HK1000",request: "L2TickDetailReq",param:{code:"01468.hk", param:"0,100,-1", subtype:"1000"}},
    {title: "请求L2单独逐笔明细-HK1100",request: "L2TickDetailReq",param:{code:"03033.hk", param:"0,100,-1", subtype:"1100"}},
    {title: "请求L2单独逐笔明细-HK1300",request: "L2TickDetailReq",param:{code:"04246.hk", param:"0,100,-1", subtype:"1300"}},
    {title: "请求L2单独逐笔明细-HK1400",request: "L2TickDetailReq",param:{code:"HSI.hk", param:"0,100,-1", subtype:"1400"}},
    {title: "请求L2单独逐笔明细-HK1500",request: "L2TickDetailReq",param:{code:"61759.hk", param:"0,100,-1", subtype:"1500"}},
    {title: "请求L2单独逐笔明细-HK1600",request: "L2TickDetailReq",param:{code:"23140.hk", param:"0,100,-1", subtype:"1600"}},
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                  router.pushUrl({ url: 'pages/ResponsePages/L2TickDetailResp', params: value });
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
  param?: string;
  subtype?: string;
}