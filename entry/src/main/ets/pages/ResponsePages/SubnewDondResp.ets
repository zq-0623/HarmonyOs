import router from '@ohos.router'
import { SubnewBondReq,Request,ErrorInfo,SubnewDondResp } from 'SseCore'
let RequestMap = {
  "SubnewBondReq": new SubnewBondReq(),
} as Record<string, Request>
@Entry
@Component
struct SubnewDondResponse {
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
      onSuccess: (resp: SubnewDondResp) => {
        let date = new Date()
        let endTime = date.getTime()
        console.info('cost ' + (endTime - beginTime))
        this.message = resp.toString();
        if (resp.items) {
          for (let i = 0; i < resp.items.length; i++) {
            let str = resp.items[i]
            console.info(`代码:${str.code}==名称:${str.name}==次类别:${str.subtype}==发行价:${str.IPOPrice}==最新价:${str.lastPrice}==上市日期:${str.IPODate}==昨收价:${str.preClosePrice}==涨跌幅:${str.rate}==累计涨跌幅:${str.totalRate}==涨跌:${str.change}==涨跌状态:${str.changeState}==换手率:${str.turnoverRate}==成交额:${str.amount}==主力资金流入:${str.capitalInflow}==每股收益:${str.EPS}==总股本:${str.capitalization}==流通股本:${str.circulatingShare}==流通市值:${str.flowValue}==总市值:${str.totalValue}==动态市盈:${str.PE}==融券:${str.bu}==融资:${str.su}`)
          }
        }
      },
      onFail: (err: ErrorInfo) => {
        console.info("SubnewBondReq error:" + err.getMsg());
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