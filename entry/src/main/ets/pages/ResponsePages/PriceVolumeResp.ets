/**
 * Author:qiang
 * Date:2024/4/22
 * IDEA:SseHarmonyOS
 * FileName:PriceVolumeResp
 */
import router from '@ohos.router'
import { PriceVolumeReq,ErrorInfo,PriceVolumeResp,Request } from 'SseCore'
let RequestMap = {
  "PriceVolumeReq": new PriceVolumeReq(),
} as Record<string, Request>
@Entry
@Component
struct VolumeResponse {
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
      onSuccess: (resp: PriceVolumeResp) => {
        let date = new Date()
        let endTime = date.getTime()
        console.info('cost ' + (endTime - beginTime))
        this.message = resp.toString();
        if(resp.items){
          for (let i = 0; i < resp.items.length; i++) {
            let str = resp.items.convertToArray()[i]
            console.info(`价格:${str.price}==买卖总量:${str.volume}==买量:${str.buyVolume}==卖量:${str.sellVolume}==未知买卖方向量:${str.unknownVolume}==买卖笔数:${str.tradeCount}==买笔数:${str.buyCount}==卖笔数:${str.sellCount}==未知买卖方向笔数:${str.unknownCount}`)
          }
        }
      },
      onFail: (err: ErrorInfo) => {
        console.info("PriceVolumeRequest error:" + err.getMsg());
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