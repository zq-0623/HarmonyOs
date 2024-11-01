/**
 * Author:qiang
 * Date:2024/5/7
 * IDEA:SseHarmonyOS
 * FileName:TCPThousandsResp
 */
import router from '@ohos.router'
import { IPush, SseSDK, MQTTManager,SubscribeType, Permission, ThousandsData, ThousandsItem} from 'SseCore';
@Entry
@Component
struct TCPThousandsResponse {
  @State message: string = 'Hello World'
  @State  myParams: Object = router.getParams();
  private  title: string = '';
  private param: Record<string, Object> = {} ;
  build() {
    Column() {
      Button('切换权限').onClick(()=>{

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
    iPush.thousandsPush  = {push:(code:string,data:ThousandsData) => {
      this.message = data.toString();
      console.info(`testData：${data.code}`)
      if (data.buyItems && data.buyItems.length > 0) {
        for (let i = 0; i < data.buyItems.length; i++) {
          let str:ThousandsItem = data.buyItems[i]
          console.info(`委托价格:${str.price}==委托量:${str.volume}==委托原始价格:${str.originalPrice}==买卖方向:${str.bs}==笔数(委托单子数量):${str.count}`)
        }
      }
      if (data.sellItems && data.sellItems.length > 0) {
        for (let j = 0; j < data.sellItems.length; j++) {
          let str:ThousandsItem = data.sellItems[j]
          console.info(`委托价格:${str.price}==委托量:${str.volume}==委托原始价格:${str.originalPrice}==买卖方向:${str.bs}==笔数(委托单子数量):${str.count}`)
        }
      }
    }};
    SseSDK.setIPush(iPush);
    MQTTManager.getInstance().subscribe(this.param["code"] as string ,SubscribeType.Thousands)
  }

  aboutToDisappear(){
    let codeStrs = this.param["code"] as  string
    MQTTManager.getInstance().unSubscribe(codeStrs,SubscribeType.Thousands)
  }
}