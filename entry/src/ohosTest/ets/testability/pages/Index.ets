import { expect, Hypium } from '@ohos/hypium';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import testsuite from '../../test/List.test';
import {
  router
} from '@kit.ArkUI';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Text("level two")
          .fontSize(50).margin({top:20}).fontWeight(FontWeight.Bold).onClick((env)=>{

        })
      }
      .width('100%')
    }
    .height('100%')
  }
}