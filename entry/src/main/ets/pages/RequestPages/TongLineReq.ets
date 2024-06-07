import router from '@ohos.router'
import { CompoundUpdownsType } from 'SseCore'
import { ChartIndexType } from 'SseCore'
@Entry
@Component
struct TongLineReq {
  @State message: string = 'Hello World'
  requestList:Array<ListRequestType> = [
    {title: "沪深港股通额度走势接口-获取港股通额度走势",request: "TongLineReq",param:{type:"hkt"}},
    {title: "沪深港股通额度走势接口-获取沪深股通额度走势",request: "TongLineReq",param:{type:"hst"}},
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                  router.pushUrl({ url: 'pages/ResponsePages/TongLineResp', params: value });
              }).align(Alignment.Center).width('80%');
            }
          }.width('100%')
        })
      }
    }.padding({top: 50})
  }
}

export  interface ListRequestType {
  title?: string;
  request?: string;
  param?: Params;
}
export  interface Params {
  type?:string|CompoundUpdownsType|ChartIndexType[];
}