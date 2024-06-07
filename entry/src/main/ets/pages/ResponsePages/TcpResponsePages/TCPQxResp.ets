/**
 * Author:qiang
 * Date:2024/5/7
 * IDEA:SseHarmonyOS
 * FileName:TCPQxResp
 */
import router from '@ohos.router'
import { IPush, SseSDK, MQTTManager,SubscribeType} from 'SseCore';
@Entry
@Component
struct TCPQxResponse {
  @State message: string = 'Hello World'
  @State  myParams: Object = router.getParams();
  private  title: string = '';
  private param: Record<string, Object> = {} ;
  build() {
    Column() {
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
    iPush.qxPush = {push:(code,data) => {
      this.message = data.toString();
      console.info(`股票代码:${data.code}==价格:${data.price}`)
      if (data.items && data.items.length > 0) {
        for (let i = 0; i < data.items.length; i++) {
          let str = data.items[i]
          console.info(`委托序号:${str.sn}==买卖方向:${str.bs}==委托量:${str.volume}`)
        }
      }
    }};
    SseSDK.setIPush(iPush);
    MQTTManager.getInstance().subscribe(this.param["code"] as string ,SubscribeType.QX)
  }

  aboutToDisappear(){
    let codeStrs = this.param["code"] as  string
    MQTTManager.getInstance().unSubscribe(codeStrs,SubscribeType.QX)
  }
}