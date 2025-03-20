import router from '@ohos.router'
import { OHLCPriceAdjustedMode,RequestType,OHLCPeriod,OHLCReq,ErrorInfo,OHLCResp,Request, FQItem,FormatUtility,QuoteDetailReq,QuoteResp,QuoteItem } from 'SseCore'
let RequestMap = { "OHLCReq": new OHLCReq(), } as Record<string, Request>
@Entry
@Component
struct OHLCResponse {
  @State message: string = 'Hello World'
  @State myParams: Object = router.getParams();
  @State autoRefresh: boolean = true; // 开关控制是否进行定时请求
  private title: string = '';
  private request: Request = new Request();
  private param: Record<string, Object> = {};
  private item: QuoteItem = new QuoteItem()
  private code: string = ''
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
    // 计算其他市场换手率需要传入快照，所以得先请求快照数据
    // let quoteDetailReq: QuoteDetailReq = new QuoteDetailReq();
    // quoteDetailReq.code = this.code;
    // quoteDetailReq.send({
    //   onSuccess: (resp: QuoteResp) => {
    //     if (resp && resp.quoteItems && resp.quoteItems.length > 0) {
    //       this.item = resp.quoteItems.convertToArray()[0];
    //     }
    //     this.request.send({
    //       onSuccess: (resp: OHLCResp) => {
    //         if (resp.OHLCItems && resp.OHLCItems.length > 0) {
    //           for (let i = 0; i < resp.OHLCItems.length; i++) {
    //             let res = resp.OHLCItems.convertToArray()
    //             const turnoverRate_others = FormatUtility.formatDayChangeHand(res[i].tradeVolume,this.item)
    //             console.log("其他市场市场计算的换手率：",turnoverRate_others,"code:",this.code)
    //           }
    //         }
    //       },
    //       onFail: (err: ErrorInfo) => {
    //         console.info("OHLCRequest error:" + err.getMsg());
    //       } });
    //   },
    //   onFail: (error: ErrorInfo) => {
    //   }
    // })
    for (let keyValue of Object.entries(this.param)) {
      Reflect.set(this.request, keyValue[0], keyValue[1]);
    }
    let date = new Date()
    let beginTime = date.getTime()
    this.request.send({
      onSuccess: (resp: OHLCResp) => {
        let date = new Date()
        let endTime = date.getTime()
        console.info('cost ' + (endTime - beginTime))
        this.message = resp.toString();   // 输出response到手机屏幕  string类型
        if (resp.OHLCItems && resp.OHLCItems.length > 0) {
          for (let i = 0; i < resp.OHLCItems.length; i++) {
            let res = resp.OHLCItems.convertToArray()
            // let strOHLCItem = `交易时间：${res[i].datetime}==开盘价：${res[i].openPrice}==最高价：${res[i].highPrice}==最低价：${res[i].lowPrice}==收盘价：${res[i].closePrice}==交易量：${res[i].tradeVolume}==均价：${res[i].averagePrice}==参考价/昨收价：${res[i].referencePrice}==成交额：${res[i].amount}==持仓量：${res[i].openInterest}==盘后成交量：${res[i].afterHoursVolume}==盘后成交额：${res[i].afterHoursAmount}==盘后成交额：${res[i].afterHoursAmount}`;
            let strOHLCItem = `交易时间：${res[i].datetime}==开盘价：${res[i].openPrice}==最高价：${res[i].highPrice}==最低价：${res[i].lowPrice}==收盘价：${res[i].closePrice}==交易量：${res[i].tradeVolume}==均价：${res[i].averagePrice}==参考价/昨收价：${res[i].referencePrice}==成交额：${res[i].amount}`;
            // const turnoverRate = FormatUtility.calculateTurnoverRate(res[i],resp.GBItems);
            // console.log("沪深京港市场计算的换手率：",turnoverRate,"code:",this.code)
            console.info(strOHLCItem);
          }
        }
        // console.info("=============================")
        if (resp.FQItems && resp.FQItems.length > 0) {
          for (let j = 0; j < resp.FQItems.length; j++) {
            let res = resp.FQItems.convertToArray()
            let strFQItems = `除权息日：${res[j].dateTime}==增发价：${res[j].increasePrice}==配股价：${res[j].allotmentPrice}==每股分红（包含基金分红)：${res[j].bonusAmount}==送股比例（包含基金折算比例）：${res[j].bonusProportion}==转增比例：${res[j].increaseProportion}==增发股份：${res[j].increaseVolume}==配股比例：${res[j].allotmentProportion}==并股/拆细比例：${res[j].mergeSplitRatio}`
            console.info(strFQItems)
          }
        }
        // console.info("=============================")
        if (resp.GBItems && resp.GBItems.length > 0) {
          for (let k = 0; k < resp.GBItems.length; k++) {
            let res = resp.GBItems.convertToArray()
            let strGBItems = `日期：${res[k].dateTime}==股本：${res[k].circulatingShare}`
            console.info(strGBItems)
          }
        }
      },
      onFail: (err: ErrorInfo) => {
        console.info("OHLCRequest error:" + err.getMsg());
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