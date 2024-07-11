/**
 * Author:qiang
 * Date:2024/7/9
 * IDEA:SseHarmonyOS
 * FileName:Test
 */
import {expect} from '@ohos/hypium'
import {QuoteReq} from 'SseCore'

export class Test{
  static quoteReq(){
    expect('4').assertEqual('03')
    let quoteReq = new QuoteReq()

  }
}