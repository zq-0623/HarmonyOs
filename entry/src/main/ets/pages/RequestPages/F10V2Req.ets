import router from '@ohos.router'
import { F10Type, IPOType} from 'SseCore'

@Entry
@Component
struct F10V2Req {
  requestList:Array<ListRequestType> = [
    {title: "董秘问答-提问时间倒序",request: "F10V2Req",param:{code:"000001.sz",src:"d",param:'0,20',apiType:F10Type.NEWS_INTEARACTIVE,type:"QUESTIONTIME_1"}},
    // IPOTypeSHSZ	沪深新股
    // IPOTypeBond	新债
    // IPOTypeBJ	新三板新股
    // IPOTypeBZ	北证新股
    // IPOTypeHK	港股新股
    {title: "新股(债)日历",request: "IPODateReq",param:{type:IPOType.IPOTypeSHSZ}},
    {title: "新股(债)详情",request: "IPODetailReq",param:{code:"688721.sh"}},
    {title: "某日的所有新股(债)信息",request: "IPOCalendarReq",param:{date:"2024-07-01",type:IPOType.IPOTypeBZ}}
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                if (value.request === "F10V2Req") {
                  router.pushUrl({ url: 'pages/ResponsePages/F10V2Resp', params: value });
                }
                if (value.request=== "IPODateReq") {
                  router.pushUrl({ url: 'pages/ResponsePages/F10IPODateResp', params: value });
                }
                if (value.request=== "IPODetailReq") {
                  router.pushUrl({ url: 'pages/ResponsePages/F10IPODetailResp', params: value });
                }
                if (value.request=== "IPOCalendarReq") {
                  router.pushUrl({ url: 'pages/ResponsePages/F10IPOCalendarResp', params: value });
                }
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
  src?:string;
  param?:string;
  date?:string,
  apiType?:string;
  type?:string | IPOType
}