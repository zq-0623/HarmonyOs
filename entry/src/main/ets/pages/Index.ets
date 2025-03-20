import router from '@ohos.router';
import { MarketInfo, Permission, SseSDK } from 'SseCore';
import { SpUtils } from '../util/SpUtils';

// import { SpUtils } from '../util/SpUtils';
@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  aboutToAppear(){
  }
  build() {
    Column({space:20}) {
      List({space:20}) {
        ListItem() {
          Button("level one").onClick(() => {
            console.info("marketInfo信息：" + MarketInfo.getSource())
            // SseSDK.permission().setLevel(Permission.LEVEL_1); // 单独设置权限后不需要再这里设置。否则单独设置的权限会失效
            router.pushUrl({ url: 'pages/ApiList' }, router.RouterMode.Standard, (err) => {
              if (err) {
                console.error(`Invoke pushUrl failed, code is ${err.code}, message is ${err.message}`);
                return;
              }
              console.info('Invoke pushUrl succeeded.');
            });
          }).width('80%');
        }.width('100%').padding({top:20})
        ListItem() {
          Button("TestCase").onClick(() => {
            // SseSDK.permission().setLevel(Permission.LEVEL_2);   // 单独设置权限后不需要再这里设置。否则单独设置的权限会失效
            router.pushUrl({ url: 'pages/TestCaseDemo' }, router.RouterMode.Standard, (err) => {
              if (err) {
                console.error(`Invoke pushUrl failed, code is ${err.code}, message is ${err.message}`);
                return;
              }
              console.info('Invoke pushUrl succeeded.');
            });
          }).width('80%');
        }.width('100%').padding({top:20})
        ListItem() {
          Button("set Level").onClick(() => {
            SpUtils.getInstance().saveIpIsc('n')
            router.pushUrl({ url: 'pages/ApiList' }, router.RouterMode.Standard, (err) => {
            // router.pushUrl({ url: 'pages/RequestPages/SaveLog' }, router.RouterMode.Standard, (err) => {
              if (err) {
                console.error(`Invoke pushUrl failed, code is ${err.code}, message is ${err.message}`);
                return;
              }
              console.info('Invoke pushUrl succeeded.');
            });
          }).width('80%');
        }.width('100%')
        ListItem() {
          Button("set Level").onClick(() => {
            SseSDK.permission().setLevel(Permission.LEVEL_2);
            console.info("设置权限成功！")
          }).width('80%');
        }.width('100%')
        .height(90)
      }
    }.padding({ top: 50 })
  }
}