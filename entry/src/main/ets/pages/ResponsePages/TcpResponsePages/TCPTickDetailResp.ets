/**
 * Author:qiang
 * Date:2024/5/7
 * IDEA:SseHarmonyOS
 * FileName:TCPTickDetailResp
 */
import router from '@ohos.router'
import { IPush, SseSDK, MQTTManager,SubscribeType,L2TickDetailResp, Permission, TickDetailItem } from 'SseCore';
@Entry
@Component
struct TCPTickDetailResponse {
  @State message: string = 'Hello World'
  @State  myParams: Object = router.getParams();
  private  title: string = '';
  private param: Record<string, Object> = {} ;
  build() {
    Column() {
      Button('切换权限').onClick(()=>{

      }).width('80%')
      Text(this.title).padding(5).margin({bottom: 5}).fontSize(20).border({ width: 2 }).width('90%')
      Scroll() {
        Text(this.message)
          .width('90%')
          .margin({ left: 15,  right: 15, bottom: 5 })
          .backgroundColor(0xFF56CA6A)
          .padding(5)
      }
    }.padding({ top: 20 })
  }
  async aboutToAppear() {
    let recordParam = this.myParams as Record<string, Object>;
    this.title = recordParam['title'] as  string;
    this.param = recordParam['param'] as Record<string, Object>
    let iPush: IPush = new IPush();
    iPush.tickDetailPush  = {push:(code:string,resp:L2TickDetailResp) => {
      this.message = resp.toString();
      if (resp.tickDetailItems && resp.tickDetailItems.length > 0) {
        console.info('headersParams:' + resp.headerParams)
        for (let i = 0; i < resp.tickDetailItems.length; i++) {
          let str:TickDetailItem = resp.tickDetailItems.convertToArray()[i]
          console.info(`买卖标识:${str.transactionStatus}==交易时间:${str.transactionTime}==交易量:${str.singleVolume}==成交价格:${str.transactionPrice}`)
        }
      }
    }};
    SseSDK.setIPush(iPush);
    MQTTManager.getInstance().subscribe(this.param["code"] as string ,SubscribeType.TickDetail)
  }

  aboutToDisappear(){
    let codeStrs = this.param["code"] as  string
    MQTTManager.getInstance().unSubscribe(codeStrs,SubscribeType.TickDetail)
  }
}