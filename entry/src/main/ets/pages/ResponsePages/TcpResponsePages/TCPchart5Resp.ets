/**
 * Author:qiang
 * Date:2024/5/6
 * IDEA:SseHarmonyOS
 * FileName:TCPchart5Resp
 */
import router from '@ohos.router'
import { ChartResp } from 'SseCore';
import { IPush, SseSDK, MQTTManager,SubscribeType, OHLCItem } from 'SseCore';
@Entry
@Component
struct TCPchart5Response {
  @State message: string = 'Hello World'
  @State  myParams: Object = router.getParams();
  private  title: string = '';
  private param: Record<string, Object> = {} ;
  build() {
    Column() {
      Text(this.title).padding(5).margin({bottom: 5}).fontSize(20).border({ width: 2 }).width('90%')
      Scroll() {
        Text(this.message).width('90%').margin({ left: 15,  right: 15, bottom: 5 }).backgroundColor(0xFF56CA6A).padding(5)
      }
    }.padding({ top: 20 })
  }
  async aboutToAppear() {
    let recordParam = this.myParams as Record<string, Object>;
    this.title = recordParam['title'] as  string;
    this.param = recordParam['param'] as Record<string, Object>
    let iPush: IPush = new IPush();
    iPush.chart5Push = {push:(code:string,resp:ChartResp) => {
      // this.message = resp.toString();
      // console.info("总点数:" + resp.tickCount)
      // console.info("市场交易时间:" + resp.systemDatetime)
      // console.info("日期列表:" + resp.systemDatetime)
      // console.info("交易时间段:" + resp.timezones)
      if (resp.OHLCItems) {
        for (let i = 0; i < resp.OHLCItems.length; i++) {
          let str:OHLCItem = resp.OHLCItems[i]
          // console.info(`时间:${str.datetime}==开盘价:${str.openPrice}==最高价${str.highPrice}==最低价${str.lowPrice}==收盘价:${str.closePrice}==交易量:${str.tradeVolume}==均价:${str.averagePrice}==参考价/昨收价:${str.referencePrice}==量比:${str.volumeRatio}==总委买:${str.entrustBuyVolume}==总委卖:${str.entrustSellVolume}==委差:${str.entrustDiff}`)
        }
      }
      if (resp.AFItems) {
        for (let j = 0; j < resp.AFItems.length; j++) {
          let str:OHLCItem = resp.AFItems[j]
          // console.info(`时间:${str.datetime}==收盘价:${str.closePrice}==参考价/昨收价:${str.referencePrice}`)
        }
      }
      if (resp.tradeDates) {
        for (let k = 0; k < resp.tradeDates.length; k++) {
          let str: string = resp.tradeDates[k]
          // console.info("日期列表:"  + str)
        }
      }
      if (resp.referencePrices){
        resp.referencePrices.forEach((key:string, value:string) => {
          // console.info(`时间:${value}==价格:${key}`)
        })
      }
    }};
    SseSDK.setIPush(iPush);
    MQTTManager.getInstance().subscribe(this.param["code"] as string ,SubscribeType.Line5)
  }
  aboutToDisappear(){
    let codeStrs = this.param["code"] as  string
    MQTTManager.getInstance().unSubscribe(codeStrs,SubscribeType.Line5)
  }
}