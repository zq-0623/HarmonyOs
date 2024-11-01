/**
 * Author:qiang
 * Date:2024/5/6
 * IDEA:SseHarmonyOS
 * FileName:TCPtickResp
 */
import router from '@ohos.router'
import { IPush, SseSDK, MQTTManager,SubscribeType,TickResp, Permission, TickItem } from 'SseCore';
@Entry
@Component
struct TCPtickResponse {
  @State message: string = 'Hello World'
  @State  myParams: Object = router.getParams();
  private  title: string = '';
  private param: Record<string, Object> = {} ;
  build() {
    Column() {
      Button('切换权限1').onClick(() => {
        SseSDK.permission().removeShSzOverseaPermission(Permission.OL_SH_LEVEL_2)
        SseSDK.permission().removeShSzOverseaPermission(Permission.OL_SZ_LEVEL_2)
        SseSDK.permission().addShSzPermission(Permission.SH_LEVEL_2)
        SseSDK.permission().addShSzPermission(Permission.SZ_LEVEL_2)
        SseSDK.permission().submit()
      })
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
    iPush.tickPush  = {push:(code:string,resp:TickResp) => {
      this.message = resp.toString();
      console.info("头里返回的数据:" + resp.headerParams)
      if (resp.tickItems) {
        for (let i = 0; i < resp.tickItems.length; i++) {
          let str:TickItem = resp.tickItems.convertToArray()[i]
          console.info(`买卖方向：${str.transactionStatus}==交易时间：${str.transactionTime}==交易量：${str.singleVolume}==成交价格：${str.transactionPrice}`)
        }
        console.error("买卖方向***************第一次订阅*********************")
      }
    }};
    SseSDK.setIPush(iPush);
    MQTTManager.getInstance().subscribe(this.param["code"] as string ,SubscribeType.Tick)
  }

  aboutToDisappear(){
    let codeStrs = this.param["code"] as  string
    MQTTManager.getInstance().unSubscribe(codeStrs,SubscribeType.Tick)
  }
}