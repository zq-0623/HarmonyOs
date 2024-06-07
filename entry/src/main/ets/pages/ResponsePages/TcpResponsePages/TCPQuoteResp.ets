/**
 * Author:qiang
 * Date:2024/4/29
 * IDEA:SseHarmonyOS
 * FileName:TCPQuoteResp
 */
import router from '@ohos.router'
import { IPush, SseSDK, MQTTManager,SubscribeType, Permission } from 'SseCore';
import hilog from '@ohos.hilog';

@Entry
@Component
struct TCPQuoteResponse {
  @State message: string = 'Hello World'
  @State  myParams: Object = router.getParams();
  private  title: string = '';
  private param: Record<string, Object> = {} ;

  build() {
    Column() {
      Button('切换权限1').onClick(() => {
        SseSDK.permission().removeHkPermission(Permission.HK10)
        SseSDK.permission().addHkPermission(Permission.HKD1)
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
    iPush.quotePush = {push:(item) => {

      if (item) {
        console.info(`时间:${item.datetime}==代码:${item.id}==最新价:${item.lastPrice}==五档/十档 买价:${item.buyPrice}`)
      }
      if (item.buyPrices) {
        for (let i = 0; i < item.buyPrices.length; i++) {
          console.info(`五档/十档 买价:${item.buyPrices[i]}`)
        }
      }

    }};
    SseSDK.setIPush(iPush);
    MQTTManager.getInstance().subscribe(this.param["code"] as string ,SubscribeType.Snap)
  }

  aboutToDisappear(){
    let codeStrs = this.param["code"] as  string
    MQTTManager.getInstance().unSubscribe(codeStrs,SubscribeType.Snap)
  }
}