import router from '@ohos.router'
import { KZZLinkReq,ErrorInfo,KZZLinkResp,Request } from 'SseCore'
let RequestMap = {
  "KZZLinkReq": new KZZLinkReq(),
} as Record<string, Request>
@Entry
@Component
struct KZZLinkResponse {
  @State message: string = 'Hello World'
  @State myParams: Object = router.getParams();
  @State autoRefresh: boolean = true; // 开关控制是否进行定时请求
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
      onSuccess: (resp: KZZLinkResp) => {   // 快照响应
        let date = new Date()
        let endTime = date.getTime()
        console.info('cost ' + (endTime - beginTime))
        this.message = resp.toString();   // 输出response到手机屏幕  string类型
        if (resp.items) {
          console.info("代码：" + resp.items.convertToArray()[0].code)
          console.info("名称：" + resp.items.convertToArray()[0].name)
          console.info("市场：" + resp.items.convertToArray()[0].market)
          console.info("类别：" + resp.items.convertToArray()[0].subtype)
          console.info("最新价：" + resp.items.convertToArray()[0].lastPrice)
          console.info("昨收价：" + resp.items.convertToArray()[0].preClosePrice)
          console.info("涨幅：" + resp.items.convertToArray()[0].changeRate)
          console.info("涨跌：" + resp.items.convertToArray()[0].change)
          console.info("涨跌状态：" + resp.items.convertToArray()[0].changeState)
          console.info("联动代码溢价率：" + resp.items.convertToArray()[0].premiumRate)
          console.info("转股价：" + resp.items.convertToArray()[0].transferPrice)
        }
      },
      onFail: (err: ErrorInfo) => {
        console.info("KZZLinkResponse error:" + err.getMsg());
      } });
  }
  private startAutoRefresh() {
    this.stopAutoRefresh(); // 先清除可能存在的定时器
    this.intervalId = setInterval(() => {
      if (this.autoRefresh) {
        this.sendReq();
      }
    }, 3000);
  }

  private stopAutoRefresh() {
    if (this.intervalId) {
      clearInterval(this.intervalId);
      this.intervalId = undefined;
    }
  }

  async aboutToAppear() {
    let recordParam = this.myParams as Record<string, Object>;
    this.title = recordParam['title'] as string;
    this.param = recordParam['param'] as Record<string, Object>;
    this.request = RequestMap[recordParam['request'] as string];

    this.sendReq(); // 立即请求一次
    if (this.autoRefresh) {
      this.startAutoRefresh();
    }
  }

  aboutToDisappear() {
    this.stopAutoRefresh();
  }
}