import router from '@ohos.router'
import { CompoundUpdownsType ,ChartIndexType} from 'SseCore'
@Entry
@Component
struct CompoundUpdownsReq {
  @State message: string = 'Hello World'
  requestList:Array<ListRequestType> = [
    {title: "当日复盘涨跌请求类-sh",request: "CompoundUpdownsReq",param:{code:"sh",type:CompoundUpdownsType.CompoundUpdownsTypeOneDay}},
    {title: "当日复盘涨跌请求类-sz",request: "CompoundUpdownsReq",param:{code:"sz",type:CompoundUpdownsType.CompoundUpdownsTypeOneDay}},
    {title: "当日复盘涨跌请求类-cy(创业板)",request: "CompoundUpdownsReq",param:{code:"cy",type:CompoundUpdownsType.CompoundUpdownsTypeOneDay}},
    {title: "当日复盘涨跌请求类-bz",request: "CompoundUpdownsReq",param:{code:"bz",type:CompoundUpdownsType.CompoundUpdownsTypeOneDay}},
    {title: "当日复盘涨跌请求类-all",request: "CompoundUpdownsReq",param:{code:"all",type:CompoundUpdownsType.CompoundUpdownsTypeOneDay}},
    {title: "30日复盘涨跌请求类-sh",request: "CompoundUpdownsReq",param:{code:"sh",type:CompoundUpdownsType.CompoundUpdownsTypeThirtyDays}},
    {title: "30日复盘涨跌请求类-sz",request: "CompoundUpdownsReq",param:{code:"sz",type:CompoundUpdownsType.CompoundUpdownsTypeThirtyDays}},
    {title: "30日复盘涨跌请求类-cy",request: "CompoundUpdownsReq",param:{code:"cy",type:CompoundUpdownsType.CompoundUpdownsTypeThirtyDays}},
    {title: "30日复盘涨跌请求类-bz",request: "CompoundUpdownsReq",param:{code:"bz",type:CompoundUpdownsType.CompoundUpdownsTypeThirtyDays}},
    {title: "30日复盘涨跌请求类-all",request: "CompoundUpdownsReq",param:{code:"all",type:CompoundUpdownsType.CompoundUpdownsTypeThirtyDays}},
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                  router.pushUrl({ url: 'pages/ResponsePages/CompoundUpdownsResp', params: value });
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
  code?: string;
  type?:string|CompoundUpdownsType|ChartIndexType[];
}