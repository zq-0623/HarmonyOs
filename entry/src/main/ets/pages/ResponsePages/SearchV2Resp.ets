import router from '@ohos.router'
import { StockTableManager2 } from 'SseCore'
import { SearchReqV2,SearchResp,ErrorInfo,Request } from 'SseCore'
let RequestMap = {
  "SearchReqV2": new SearchReqV2(),
} as Record<string, Request>
@Entry
@Component
struct SearchReqV2Response {
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
      onSuccess: (resp: SearchResp) => {
        let date = new Date()
        let endTime = date.getTime()
        console.info('cost ' + (endTime - beginTime))
        this.message = resp.toString();
        if (resp.items) {
          console.log("股票代码：" + resp.items.convertToArray()[0].code)
          console.log("股票名称：" + resp.items.convertToArray()[0].name)
          console.log("次类别：" + resp.items.convertToArray()[0].subtype)
          console.log("拼音：" + resp.items.convertToArray()[0].pinYin)
          console.log("市场别：" + resp.items.convertToArray()[0].market)
          console.log("沪港通标签：" + resp.items.convertToArray()[0].hh)
          console.log("深港通标签：" + resp.items.convertToArray()[0].hz)
          console.log("st：" + resp.items.convertToArray()[0].st)
          console.log("长名称：" + resp.items.convertToArray()[0].longName)
          console.log("长名称首字母：" + resp.items.convertToArray()[0].longPinYin)
          console.log("股票代码（不含市场后缀）：" + resp.items.convertToArray()[0].ID)
          console.log("股票名称（去除文字间空格的股票名称）：" + resp.items.convertToArray()[0].name2)
        }
        else {
          console.error("接口返回数据为空！！！")
        }
      },
      onFail: (err: ErrorInfo) => {
        console.info("SearchReqV2 error:" + err.getMsg());
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