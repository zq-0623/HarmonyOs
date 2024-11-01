import router from '@ohos.router'

@Entry
@Component
struct PushType {
  @State message: string = 'Hello World'
  @State  myParams: Object = router.getParams();
  requestList:Array<ListRequestType> = [
    {title: "快照推送-sh",request: "QuotePush",param:{code:"000001.sh"}},
    {title: "快照推送-sh",request: "QuotePush",param:{code:"600839.sh"}},
    {title: "快照推送-sz",request: "QuotePush",param:{code:"300184.sz"}},
    {title: "快照推送-bz",request: "QuotePush",param:{code:"832149.bz"}},
    {title: "快照推送-hk",request: "QuotePush",param:{code:"01468.hk"}},
    {title: "分时走势推送",request: "ChartPush",param:{code:"300059.sz"}},
    {title: "五日走势推送",request: "Chart5Push",param:{code:"000002.sz"}},
    {title: "分时明细推送",request: "TickPush",param:{code:"000002.sz,600000.sh"}},
    {title: "逐笔明细推送",request: "TickDetailPush",param:{code:"000002.sz"}},
    {title: "逐笔委托推送",request: "TickEntrustPush",param:{code:"002607.sz"}},
    {title: "逐笔还原推送",request: "TickRestorePush",param:{code:"002607.sz"}},
    {title: "千档推送",request: "ThousandsPush",param:{code:"301377.sz"}},
    {title: "全息推送",request: "QxPush",param:{code:"000002.sz$8050$8040"}},
    {title: "推送全部类型",request: "AllPush",param:{code:"600000.sh"}},
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                if (value.request === 'QuotePush') {
                  router.pushUrl({ url: 'pages/ResponsePages/TcpResponsePages/TCPQuoteResp', params: value });
                }
                if (value.request === 'ChartPush') {
                  router.pushUrl({ url: 'pages/ResponsePages/TcpResponsePages/TCPchartResp', params: value });
                }
                if (value.request === 'Chart5Push') {
                  router.pushUrl({ url: 'pages/ResponsePages/TcpResponsePages/TCPchart5Resp', params: value });
                }
                if (value.request === 'TickPush') {
                  router.pushUrl({ url: 'pages/ResponsePages/TcpResponsePages/TCPtickResp', params: value });
                }
                if (value.request === 'TickDetailPush') {
                  router.pushUrl({ url: 'pages/ResponsePages/TcpResponsePages/TCPTickDetailResp', params: value });
                }
                if (value.request === 'TickEntrustPush') {
                  router.pushUrl({ url: 'pages/ResponsePages/TcpResponsePages/TCPTickEntrustResp', params: value });
                }
                if (value.request === 'TickRestorePush') {
                  router.pushUrl({ url: 'pages/ResponsePages/TcpResponsePages/TCPTickRestoreResp', params: value });
                }
                if (value.request === 'ThousandsPush') {
                  router.pushUrl({ url: 'pages/ResponsePages/TcpResponsePages/TCPThousandsResp', params: value });
                }
                if (value.request === 'QxPush') {
                  router.pushUrl({ url: 'pages/ResponsePages/TcpResponsePages/TCPQxResp', params: value });
                }
                if (value.request === 'AllPush') {
                  router.pushUrl({ url: 'pages/ResponsePages/TcpResponsePages/TCPAllResp', params: value });
                }
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