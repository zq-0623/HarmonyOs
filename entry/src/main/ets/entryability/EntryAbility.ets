import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import {SseConfig,SseSDK,Permission,RegisterReq, L2TickEntrustResp,IPush, MQTTManager, SubscribeType,
  L2TickRestoreResp} from 'SseCore';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';
import { SpUtils } from '../util/SpUtils';
import fs from '@ohos.file.fs';
import { Log } from '@abner/log/src/main/ets/Log';
import { TextUtils } from 'SseCore/src/main/ets/b/b4/t4';
import { FileUtils } from 'SseCore/src/main/ets/b/b4/v4';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    let sseConfig: SseConfig = new SseConfig()
    let testfile: string = "test.txt"
    FileUtils.saveFile("console",testfile)
    SpUtils.getInstance(this.context);
    sseConfig.setContext(this.context).setAppkey("RNDHZGpBEDW3D3VPErhCLMtUKrkJK5UE0dyd/gvGW00=");
    SseSDK.setConfig(sseConfig);
    SseSDK.setDebug(true,true);
    SseSDK.permission()
      // SseSDK.permission().setLevel(Permission.LEVEL_1)   // 1、统一设置沪深L1权限，不给默认会有L1的权限
      // .addShSzPermission(Permission.SH_LEVEL_1)  // 2、沪L1权限
      // .addShSzPermission(Permission.SZ_LEVEL_1)  // 2、深L1权限
      .addShSzPermission(Permission.SH_LEVEL_2)  // 沪L2权限
      .addShSzPermission(Permission.SZ_LEVEL_2)  // 深L2权限
      // .addShSzPermission(Permission.SH_L2_PLUS)  // 沪L2plus权限  后台若配置L2plus权限，则SDK可以不用单独设置，但必须设置L2权限
      // .addShSzPermission(Permission.SZ_L2_PLUS)  // 深L2plus权限
      // .addShSzOverseaPermission(Permission.OL_LEVEL_1)  // 境外沪深Level1权限必须一起设置，不支持单独设置
      .addShSzOverseaPermission(Permission.OL_SH_LEVEL_2)  // 境外上海Level2
      .addShSzOverseaPermission(Permission.OL_SZ_LEVEL_2)  // 境外深圳Level2
      .addHkPermission(Permission.HK10)   // 港股10档
      // .addHkPermission(Permission.SHHK5)  // 沪港通5档
      // .addHkPermission(Permission.SZHK5)  // 深港通5档
      // .addHkPermission(Permission.HKA1)   // 港股实时1档
      // .addHkPermission(Permission.SHHK1)  // 沪港通1档
      // .addHkPermission(Permission.SZHK1)  // 深港通1档
      // .addHkPermission(Permission.HKD1)   // 港股延时1档
      // .addHkPermission(Permission.HKAZ)   // 港股指数实时
      // .addHkPermission(Permission.HKDZ)  // 港股指数延时
      // .addHKOverseaPermission(Permission.OL_HK10)  // 境外港股10档
      // .addHKOverseaPermission(Permission.OL_HKA1)  // 境外港股1档
      .setSseLevel(Permission.LEVEL_1)   //统一设置大商所、郑商所、全球、外汇市场的level
      // .submit();   // 初始化注册之前不能调该方法，更新权限时会获取不到港股境外权限
    // let iPush: IPush = new IPush();
    // iPush.tickRestorePush = {push:(code,resp:L2TickRestoreResp) => {
    //   if (resp.items){
    //     console.log("起始引索:" + resp.startIndex)
    //     console.log("结束引索:" + resp.endIndex)
    //     for (let i = 0; i < resp.items.length; i++) {
    //       let str = resp.items[i]
    //       console.info(`交易时间:${str.transactionTime}买卖标识:${str.transactionStatus}==交易量:${str.singleVolume}==成交价格:${str.transactionPrice}==索引:${str.index}==买委托序号:${str.bn}==卖委托序号:${str.on}==买委托量:${str.bq}==卖委托量:${str.oq}==买方剩余量:${str.br}==卖方剩余量:${str.sr}`)
    //     }
    //   }
    // }};
    // SseSDK.setIPush(iPush);
    // MQTTManager.getInstance().subscribe("000002.sz" ,SubscribeType.TickRestore)
    new RegisterReq().send({
      onSuccess: () => {
        console.info("注册成功")
        console.info("resgister sscuess:" + RegisterReq.toString())
        // 等待3s再执行里面的代码
        // setTimeout(() => {
        //   MQTTManager.getInstance().unSubscribe("000002.sz",SubscribeType.TickRestore)
        // },3000)
      },
      onFail: () => {
        hilog.info(0x0000, 'testTag', 'Test ping fail', "SseCore.add(2, 3)");
      } });
    // 监听
    SseSDK.setIpAndLevelChangedListener({
      ipChanged: (ipOwn:string) =>{
        console.log("ipChanged => ipOwn:" + ipOwn)
      },
      onLevelChanged:(market:string,status:string) => {
        console.log("onLevelChanged => market:" + market + ", status:" + status)
      }
    })
    console.log("test:" + TextUtils.isEmpty("name"))
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
    SseSDK.onForeground();  // 当APP进入前台时，调用此方法，SDK会自动恢复订阅
  }

  onBackground() {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
    SseSDK.onBackground()  // 当APP进入后台时，调用此方法，SDK会自动断线解除订阅推送
  }
}
