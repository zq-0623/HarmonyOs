/**
 * Author:qiang
 * Date:2024/5/6
 * IDEA:SseHarmonyOS
 * FileName:BaseResponse
 */
import { ErrorInfo, Request,ABLinkReq,ABListReq } from 'SseCore'
import { Response } from 'SseCore/src/main/ets/b/d2/h2';

export let RequestMap = {
  "ABLinkReq": new ABLinkReq(),
  "ABListReq": new ABListReq(),
} as Record<string, Request>

export function sendRequest(request: Request, param: Record<string, Object>, messageCallback: (resp: Response) => void, errorCallback: (err: ErrorInfo) => void) {
  for (let keyValue of Object.entries(param)) {
    Reflect.set(request, keyValue[0], keyValue[1]);
  }
  let date = new Date()
  let beginTime = date.getTime()
  request.send({
    onSuccess: (resp: Response) => {
      let date = new Date()
      let endTime = date.getTime()
      console.info('cost ' + (endTime - beginTime))
      messageCallback(resp);
    },
    onFail: (err: ErrorInfo) => {
      console.info("Request error:" + err.getMsg());
      errorCallback(err);
    }
  });
}
