import router from '@ohos.router'
import { KZZInfoReq,ErrorInfo,KZZInfoResp,Request } from 'SseCore'

let RequestMap = {
  "KZZInfoReq": new KZZInfoReq(),
} as Record<string, Request>
@Entry
@Component
struct KZZInfoResponse {
  @State message: string = 'Hello World'
  @State myParams: Object = router.getParams();
  private title: string = '';
  private request: Request = new Request();
  private param: Record<string, Object> = {};
  build() {
    Column() {
      Text(this.title)
        .padding(5)
        .margin({ bottom: 5 })
        .fontSize(20)
        .border({ width: 2 })
        .width('90%')
      Scroll() {
        Text(this.message)
          .width('90%')
          .margin({ left: 15, right: 15, bottom: 5 })
          .backgroundColor(0xFF56CA6A)
          .padding({ left: 10, right: 10, top: 5, bottom: 25 })
      }
    }.padding({ top: 20 })
  }
  private intervalId?: number
  private sendReq(){
    for (let keyValue of Object.entries(this.param)) {
      Reflect.set(this.request, keyValue[0], keyValue[1]);
    }
    let date = new Date()
    let beginTime = date.getTime()
    this.request.send({
      onSuccess: (resp: KZZInfoResp) => {
        let date = new Date()
        let endTime = date.getTime()
        console.info('cost ' + (endTime - beginTime))
        this.message = resp.toString();
        if (resp.item) {
          let str = resp.item
          console.info(`可转债代码:${str.code}==正股代码:${str.codeZG}==转股价格(小数位4):${str.priceZG}==转债价格(小数位4):${str.priceZZ}==转股代码市场:${str.marketZG}==回售触发价(小数位4):${str.backPrice}==强赎触发价(小数位4):${str.ransomPrice}==到期赎回价(小数位4):${str.expirePrice}==到期日:${str.expireDate}==转股日期:${str.dateZG}==发行规模单位：亿元(小数位8):${str.scaleSize}==剩余规模单位：亿元(小数位8):${str.remainSize}==网上中签率 %(小数位10):${str.ZQRate}==股东配售率 %(小数位2):${str.PSRate}==是否可转股(0：否1：是):${str.isKZ}==是否可回售(0：否1：是):${str.isHS}`)
        }
      },
      onFail: (err: ErrorInfo) => {
        console.info("KZZInfoResponse error:" + err.getMsg());
      } });
  }
  async aboutToAppear() {
    let recordParam = this.myParams as Record<string, Object>;
    this.title = recordParam['title'] as string;
    this.param = recordParam['param'] as Record<string, Object>;
    this.request = RequestMap[recordParam['request'] as string];
    this.sendReq()
  }
  aboutToDisappear(){
    clearInterval(this.intervalId)
  }
}