import router from '@ohos.router'
import { DRListReq,ErrorInfo,DRListResp,Request } from 'SseCore'
let RequestMap = {
  "DRListReq": new DRListReq(),
} as Record<string, Request>
@Entry
@Component
struct DRListResponse {
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
      onSuccess: (resp: DRListResp) => {
        let date = new Date()
        let endTime = date.getTime()
        console.info('cost ' + (endTime - beginTime))
        this.message = resp.toString();   // 输出response到手机屏幕  string类型
       if(resp.items){
         console.info("代码：" + resp.items[0].code)
         console.info("名称：" + resp.items[0].name)
         console.info("次类别：" + resp.items[0].subtype)
         console.info("最新价：" + resp.items[0].lastPrice)
         console.info("前收盘价：" + resp.items[0].preClosePrice)
         console.info("涨跌幅：" + resp.items[0].changeRate)
         console.info("涨跌：" + resp.items[0].change)
         console.info("行情时间：" + resp.items[0].datetime)
         console.info("基础证券代码：" + resp.items[0].baseStockCode)
         console.info("基础证券名称：" + resp.items[0].baseStockName)
         console.info("基础证券最新价：" + resp.items[0].baseLastPrice)
         console.info("基础证券前收盘价：" + resp.items[0].basePreClosePrice)
         console.info("基础证券涨幅：" + resp.items[0].baseChangeRate)
         console.info("基础证券涨跌：" + resp.items[0].baseChange)
         console.info("基础证券次类别：" + resp.items[0].baseSubtype)
         console.info("基础证券行情时间：" + resp.items[0].baseDatetime)
         console.info("溢价率：" + resp.items[0].premiumRate)
       }
      },
      onFail: (err: ErrorInfo) => {
        console.info("AHListRequest error:" + err.getMsg());
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