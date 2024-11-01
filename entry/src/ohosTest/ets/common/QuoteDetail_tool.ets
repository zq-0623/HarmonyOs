/**
 * Author:qiang
 * Date:2024/7/12
 * IDEA:SseHarmonyOS
 * FileName:QuoteDetail_tool
 */
import {
  expect
} from '@ohos/hypium';
import {
  ErrorInfo,
  QuoteDetailReq,
  QuoteItem,
  QuoteResp} from 'SseCore';
import {ListRequestType} from '../test/TestCases/QuoteDetail.test';


async function sendQuoteRequest(requestList:Array<ListRequestType>, expected:string,expectedFail:string) {
  requestList.forEach((value) => {
    let req = new QuoteDetailReq();
    for (let keyValue of Object.entries(value.param as Record<string,Object>)){
      Reflect.set(req,keyValue[0],keyValue[1])
    }
    req.send({
      onSuccess:(resp:QuoteResp) => {
        if (resp.quoteItems) {
          let str:QuoteItem = resp.quoteItems[0];
        }
      },
      onFail: (err:ErrorInfo) => {
        console.error(err.getMsg() + value.title);
        expect('200').assertEqual(err.getErrCode() + err.getMsg());
      }
    })
  })
}