import router from '@ohos.router'
import { StockTableManager2 } from 'SseCore'
import { SearchReqV2,SearchResp,ErrorInfo,Request,SearchItem } from 'SseCore'
let RequestMap = {
  "SearchReqV2": new SearchReqV2(),
} as Record<string, Request>
@Entry
@Component
struct SearchReqV2Response {
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
    let date = new Date()
    let beginTime = date.getTime()
    this.request.send({
      onSuccess: (resp: SearchResp) => {
        let date = new Date()
        let endTime = date.getTime()
        console.info('cost ' + (endTime - beginTime))
        this.message = resp.toString();
        if (resp.items) {
          for (let i = 0; i < resp.items.length; i++) {
            let str:SearchItem = resp.items.convertToArray()[i]
            console.info(`股票代码:${str.code}==股票名称:${str.name}==次类别:${str.subtype}==拼音:${str.pinYin}==市场别:${str.market}==沪港通标签:${str.hh}==深港通标签:${str.hz}==JSON29栏位:${str.st}==股票长名称:${str.longName}==股票长名称首字母:${str.longPinYin}==股票代码（不含市场后缀）:${str.ID}==股票名称（去除文字间空格的股票名称）:${str.name2}`)
          }
        }
        else {
          console.error("接口返回数据为空！！！")
        }
      },
      onFail: (err: ErrorInfo) => {
        console.info("SearchReqV2 error:" + err.getMsg());
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