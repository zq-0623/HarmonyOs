/**
 * Author:qiang
 * Date:2024/5/7
 * IDEA:SseHarmonyOS
 * FileName:TCPTickEntrustResp
 */
import router from '@ohos.router'
import { IPush, SseSDK, MQTTManager,SubscribeType,L2TickEntrustResp, Permission } from 'SseCore';

@Entry
@Component
struct TCPTickEntrustResponse {
  @State message: string = 'Hello World'
  @State  myParams: Object = router.getParams();
  private  title: string = '';
  private param: Record<string, Object> = {} ;
  build() {
    Column() {
      Button('切换权限').onClick(() => {
        SseSDK.permission().removeShSzPermission(Permission.SH_LEVEL_2)
        SseSDK.permission().removeShSzPermission(Permission.SZ_LEVEL_2)
        SseSDK.permission().addShSzOverseaPermission(Permission.OL_SH_LEVEL_2)
        SseSDK.permission().addShSzOverseaPermission(Permission.OL_SZ_LEVEL_2)
        SseSDK.permission().submit();
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
    iPush.tickEntrustPush   = {push:(code,resp:L2TickEntrustResp) => {
      this.message = resp.toString();
      console.log("起始引索:" + resp.startIndex)
      console.log("结束引索:" + resp.endIndex)
      if (resp.items){
        for(let i = 0; i < resp.items.length; i++){
          let str = resp.items[i]
          console.info(`委托序号:${str.sn}==委托价:${str.price}==委托量:${str.volume}==买卖方:${str.bs}==卖委时间:${str.time}`)
        }
      }
    }};
    SseSDK.setIPush(iPush);
    MQTTManager.getInstance().subscribe(this.param["code"] as string ,SubscribeType.TickEntrust)
  }

  aboutToDisappear(){
    let codeStrs = this.param["code"] as  string
    MQTTManager.getInstance().unSubscribe(codeStrs,SubscribeType.TickEntrust)
  }
}