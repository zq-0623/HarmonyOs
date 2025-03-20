/**
 * Author:qiang
 * Date:2024/4/29
 * IDEA:SseHarmonyOS
 * FileName:TCPQuoteResp
 */
import router from '@ohos.router'
import { IPush, SseSDK, MQTTManager,SubscribeType, QuoteItem } from 'SseCore';

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
        MQTTManager.getInstance().unSubscribe("600839.sh",SubscribeType.Snap)
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
    iPush.quotePush = {push:(item:QuoteItem) => {
      if (item) {
        console.info(`时间:${item.datetime}==代码:${item.id}==最新价:${item.lastPrice}==五档/十档 买价:${item.buyPrice}`)
      }
      if (item.buyPrices) {
        for (let i = 0; i < item.buyPrices.length; i++) {
          console.info(`五档/十档 买价:${item.buyPrices.at(i)}`)
        }
      }
      if (item.sellBrokerInfos){      // 卖经济席位列表   只有港股才有
        if (item.sellBrokerInfos.values()) {
          for (let element of item.sellBrokerInfos.values()!) {
            console.info("ID:" + element.id);
            console.info("证券名称:" + element.corp);
            console.info("证券全名:" + element.corportion);
            console.info("买卖方向:" + element.state);  // 0卖1买
          }
        }
      }
      // if (item.sellPrices) {
      //   for (let i = 0; i < item.sellPrices.length; i++) {
      //     console.info(`五档/十档 卖价:${item.sellPrices.at(i)}`)
      //   }
      // }
      // if (item.buySingleVolumes) {
      //   for (let i = 0; i < item.buySingleVolumes.length; i++) {
      //     console.info(`五档/十档 委托总笔数（买）:${item.buySingleVolumes.at(i)}`)
      //   }
      // }
      // if (item.sellSingleVolumes) {
      //   for (let i = 0; i < item.sellSingleVolumes.length; i++) {
      //     console.info(`五档/十档 委托总笔数（卖）:${item.sellSingleVolumes.at(i)}`)
      //   }
      // }
      // if (item.buyVolumes) {
      //   for (let i = 0; i < item.buyVolumes.length; i++) {
      //     console.info(`五档/十档 买量：${item.buyVolumes.at(i)}`)
      //   }
      // }
      // if (item.sellVolumes) {
      //   for (let i = 0; i < item.sellVolumes.length; i++) {
      //     console.info(`五档/十档 卖量：${item.sellVolumes.at(i)}`)
      //   }
      // }


    }};
    SseSDK.setIPush(iPush);
    MQTTManager.getInstance().subscribe(this.param["code"] as string ,SubscribeType.Snap)
  }

  aboutToDisappear(){
    let codeStrs = this.param["code"] as  string
    MQTTManager.getInstance().unSubscribe(codeStrs,SubscribeType.Snap)
  }
}