import router from '@ohos.router'
import { ErrorInfo,IPODateReq,Request,IPODateResp} from 'SseCore'

let RequestMap = { "IPODateReq": new IPODateReq(), } as Record<string, Request>
@Entry
@Component
struct F10IPODateResp {
  @State message: string = 'Hello World'
  @State myParams: Object = router.getParams();
  @State autoRefresh: boolean = true; // 开关控制是否进行定时请求
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
      onSuccess: (resp:IPODateResp) => {
        if (resp.items) {
          let str: Record<string,string>[] = resp.items as Record<string,string>[]
          for (let i = 0; i < str.length; i++) {
            let infos: Record<string,string> = str[i]
            console.info(`今日申购个数:${infos.sg}==当日待申购个数:${infos.jjsg}==今日中签个数:${infos.zq}==今日上市个数:${infos.ss}==当日待上市个数:${infos.dss}==今日即将发行个数:${infos.jjfx}==今日未上市个数:${infos.wss}==日期:${infos.NORMALDAY}`)
          }
        }
      },
      onFail: (err: ErrorInfo) => {
        console.info("F10IPODateResp error:" + err.getMsg());
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

