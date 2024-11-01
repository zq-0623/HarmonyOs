import router from '@ohos.router'
import { ErrorInfo,F10V2Req,Request,F10V2Response} from 'SseCore'

let RequestMap = {
  "F10V2Req": new F10V2Req(),
} as Record<string, Request>
@Entry
@Component
struct F10V2Resp {
  @State message: string = 'Hello World'
  @State myParams: Object = router.getParams();
  private title: string = '';
  private request: Request = new Request();
  private param: Record<string, Object> = {};
  build() {
    Column() {
      Text(this.title).padding(5).margin({ bottom: 5 }).fontSize(20).border({ width: 2 }).width('90%')
      Scroll() {
        Text(this.message).width('90%').margin({ left: 15, right: 15, bottom: 5 }).backgroundColor(0xFF56CA6A)
          .padding({ left: 10, right: 10, top: 5, bottom: 25 })
      }
    }.padding({ top: 20 })
  }
  private intervalId?: number
  private sendReq(){
    for (let keyValue of Object.entries(this.param)) {
      Reflect.set(this.request, keyValue[0], keyValue[1]);
    }
    this.request.send({
      onSuccess: (resp:F10V2Response) => {
        if (resp.info) {
          let str: Record<string,string>[] = resp.info['List'] as Record<string,string>[]
          for (let i = 0; i < str.length; i++) {
            let infos: Record<string,string> = str[i]
            console.info(`证券代码:${infos['TRADING']}==证券简称:${infos['SESNAME']}==问题内容:${infos['PROBLEM']}==提问时间:${infos['QUESTIONTIME']}==回答内容:${infos['REPLY']}==回答时间:${infos['ANSWERTIME']}==来源:${infos['NEWSSOURCE']}==互动新闻编码:${infos['INTERACTIVEID']}`)
          }
        }
      },
      onFail: (err: ErrorInfo) => {
        console.info("F10Response error:" + err.getMsg());
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

