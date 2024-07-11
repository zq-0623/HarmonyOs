import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { Hypium } from '@ohos/hypium';
import testsuite from '../test/List.test';
import { Permission,RegisterReq,SseConfig,SseSDK } from 'SseCore';

export default class TestAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onCreate');
    hilog.info(0x0000, 'testTag', '%{public}s', 'want param:' + JSON.stringify(want) ?? '');
    hilog.info(0x0000, 'testTag', '%{public}s', 'launchParam:' + JSON.stringify(launchParam) ?? '');
    let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
    abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    let abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs;
    abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
    hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
    let sseConfig: SseConfig = new SseConfig()
    sseConfig.setAppkey("RNDHZGpBEDW3D3VPErhCLMtUKrkJK5UE0dyd/gvGW00=");
    SseSDK.setConfig(sseConfig);
    SseSDK.setDebug(true,true);
    SseSDK.permission().addShSzPermission(Permission.SH_LEVEL_2).addShSzPermission(Permission.SZ_LEVEL_2)
      .addHkPermission(Permission.HK10).setLevel(Permission.LEVEL_1);
    new RegisterReq().send({
      onSuccess:() => {
        console.info('注册成功');
        console.info("resgister sscuess:" + RegisterReq.toString());
      },
      onFail: () => {
        hilog.info(0x0000, 'testTag', 'Test ping fail', "SseCore.add(2, 3)");
      }
    });

    SseSDK.setIpAndLevelChangedListener({
      ipChanged:(ipOwn:string) => {
        console.info("ipChanged => ipOwn:" + ipOwn);
      },
      onLevelChanged:(market:string,status:string) => {
        console.log("onLevelChanged => market:" + market + ", status:" + status)
      }
    })
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onWindowStageCreate');
    windowStage.loadContent('testability/pages/Index', (err) => {
      if (err.code) {
        hilog.error(0x0000,
          'testTag',
          'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
        hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onWindowStageDestroy');
  }

  onForeground() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onForeground');
  }

  onBackground() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onBackground');
  }
}