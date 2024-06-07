import router from '@ohos.router'
import { SectionSortingReq,ErrorInfo,SectionSortingResp,Request } from 'SseCore'
let RequestMap = {
  "SectionSortingReq": new SectionSortingReq(),
} as Record<string, Request>
@Entry
@Component
struct SectionSortingResponse {
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
      onSuccess: (resp: SectionSortingResp) => {
        let date = new Date()
        let endTime = date.getTime()
        console.info('cost ' + (endTime - beginTime))
        this.message = resp.toString();   // 输出response到手机屏幕  string类型
        console.log("总条数===>"  + resp.totalCount)
        if (resp.items && resp.items.length > 0) {
          for (let i = 0; i < resp.items.length; i++) {
            let str = resp.items.convertToArray()[i]
            console.info(`板块代码:${str.code}==板块名称:${str.name}==板块类型:${str.type}`)
          }
        }
      },
      onFail: (err: ErrorInfo) => {
        console.info("SectionSortingRequest error:" + err.getMsg());
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