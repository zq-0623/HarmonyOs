/**
 * Author:qiang
 * Date:2024/5/7
 * IDEA:SseHarmonyOS
 * FileName:TCPTickRestoreResp
 */
import router from '@ohos.router'
import { IPush, SseSDK, MQTTManager,SubscribeType,L2TickDetailResp, L2TickEntrustResp,
  L2TickRestoreResp,
  Permission,
  TickDetailItem} from 'SseCore';
@Entry
@Component
struct TCPTickRestoreResponse {
  @State message: string = 'Hello World'
  @State  myParams: Object = router.getParams();
  private  title: string = '';
  private param: Record<string, Object> = {} ;
  build() {
    Column() {
      Button('重复订阅').onClick(() => {
        console.info("==============开始给权限======================")
        SseSDK.permission().removeShSzOverseaPermission(Permission.OL_SZ_LEVEL_2)
        SseSDK.permission().addShSzPermission(Permission.SZ_LEVEL_2)
        SseSDK.permission().submit();
        console.info("==================给权限结束============================")
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
    iPush.tickRestorePush = {push:(code:string,resp:L2TickRestoreResp) => {
      this.message = resp.toString();
      if (resp.items){
        console.log("起始引索:" + resp.startIndex)
        console.log("结束引索:" + resp.endIndex)
        for (let i = 0; i < resp.items.length; i++) {
          let str:TickDetailItem = resp.items[i]
          console.info(`交易时间:${str.transactionTime}买卖标识:${str.transactionStatus}==交易量:${str.singleVolume}==成交价格:${str.transactionPrice}==索引:${str.index}==买委托序号:${str.bn}==卖委托序号:${str.on}==买委托量:${str.bq}==卖委托量:${str.oq}==买方剩余量:${str.br}==卖方剩余量:${str.sr}`)
        }
      }
    }};
    SseSDK.setIPush(iPush);
    MQTTManager.getInstance().subscribe(this.param["code"] as string ,SubscribeType.TickRestore)
  }

  aboutToDisappear(){
    let codeStrs = this.param["code"] as  string
    MQTTManager.getInstance().unSubscribe(codeStrs,SubscribeType.TickRestore)
  }
}