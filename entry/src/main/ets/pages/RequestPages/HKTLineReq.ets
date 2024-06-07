import router from '@ohos.router'
import { CompoundUpdownsType ,ChartIndexType} from 'SseCore'
@Entry
@Component
struct HKTLineReq {
  @State message: string = 'Hello World'
  requestList:Array<ListRequestType> = [
    {title: "南北向资金买入卖出额走势接口-北向资金",request: "HKTLineReq",param:{type:"n"}},
    {title: "南北向资金买入卖出额走势接口-南向资金",request: "HKTLineReq",param:{type:"s"}},
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                  router.pushUrl({ url: 'pages/ResponsePages/HKTLineResp', params: value });
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