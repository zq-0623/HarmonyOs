import { expect, Hypium } from '@ohos/hypium';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import QuoteDetail from '../../test/List.test';
import Quote from '../../test/List.test';

let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs;
abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Column({space:20}){
      List() {
        ListItem() {
          Button("QuoteDetail").onClick(() => {
            Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, QuoteDetail);
            console.info("开始执行测试用例……")
          }).width('80%')
        }.width("100%").padding({top:20})
        ListItem() {
          Button("Quote").onClick(() => {
            Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, Quote);
            console.info("开始执行测试用例……")
          }).width('80%')
        }.width("100%").padding({top:20})
      }
    }.padding({top:50})
  }
}