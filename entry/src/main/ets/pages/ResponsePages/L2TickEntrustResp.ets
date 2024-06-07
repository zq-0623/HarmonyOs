import router from '@ohos.router'
import { L2TickEntrustReq,L2TickEntrustResp,ErrorInfo,Request } from 'SseCore'
let RequestMap = {
  "L2TickEntrustReq": new L2TickEntrustReq(),
} as Record<string, Request>
@Entry
@Component
struct L2TickEntrustResponse {
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
      onSuccess: (resp: L2TickEntrustResp) => {
        let date = new Date()
        let endTime = date.getTime()
        console.info('cost ' + (endTime - beginTime))
        this.message = resp.toString();
        console.log("起始引索:" + resp.startIndex)
        console.log("结束引索:" + resp.endIndex)
        if (resp.items){
          for(let i = 0; i < resp.items.length; i++){
            let str = resp.items[i]
            console.info(`委托序号:${str.sn}==委托价:${str.price}==委托量:${str.volume}==买卖方:${str.bs}==卖委时间:${str.time}`)
          }
        }
        else {
          console.error("接口返回数据为空！！！")
        }
      },
      onFail: (err: ErrorInfo) => {
        console.error("L2TickEntrustRequest error:" + err.getMsg());
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