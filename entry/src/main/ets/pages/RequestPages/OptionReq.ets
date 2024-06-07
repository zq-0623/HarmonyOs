import router from '@ohos.router'
import { OptionType } from 'SseCore'
@Entry
@Component
struct OptionReq {
  @State message: string = 'Hello World'
  requestList:Array<ListRequestType> = [
    {title: "期权行情-SH1001",request: "OptionReq",param:{code:"600000.sh",optionType:OptionType.OptionTypeUnknown, pageIndex: 0}},
    {title: "期权行情-SH1002",request: "OptionReq",param:{code:"900948.sh",optionType:OptionType.OptionTypeUnknown, pageIndex: 0}},
    {title: "期权行情-SH1006",request: "OptionReq",param:{code:"688009.sh",optionType:OptionType.OptionTypeUnknown, pageIndex: 0}},
    {title: "期权行情-SH1100",request: "OptionReq",param:{code:"513330.sh",optionType:OptionType.OptionTypeUnknown, pageIndex: 0}},
    {title: "期权行情-SH1300",request: "OptionReq",param:{code:"204001.sh",optionType:OptionType.OptionTypeUnknown, pageIndex: 0}},
    {title: "期权行情-SH1400",request: "OptionReq",param:{code:"000001.sh",optionType:OptionType.OptionTypeUnknown, pageIndex: 0}},
    {title: "期权行情-SH3002",request: "OptionReq",param:{code:"10005812.sh",optionType:OptionType.OptionTypeUnknown, pageIndex: 0}},
    {title: "期权行情-SH8100",request: "OptionReq",param:{code:"901033.sh",optionType:OptionType.OptionTypeUnknown, pageIndex: 0}},
    {title: "期权行情-SZ1001",request: "OptionReq",param:{code:"000001.sz",optionType:OptionType.OptionTypeUnknown, pageIndex: 0}},
    {title: "期权行情-SZ1002",request: "OptionReq",param:{code:"200625.sz",optionType:OptionType.OptionTypeUnknown, pageIndex: 0}},
    {title: "期权行情-SZ1004",request: "OptionReq",param:{code:"300459.sz",optionType:OptionType.OptionTypeUnknown, pageIndex: 0}},
    {title: "期权行情-SZ1100",request: "OptionReq",param:{code:"159792.sz",optionType:OptionType.OptionTypeUnknown, pageIndex: 0}},
    {title: "期权行情-SZ1300",request: "OptionReq",param:{code:"131810.sz",optionType:OptionType.OptionTypeUnknown, pageIndex: 0}},
    {title: "期权行情-SZ1400",request: "OptionReq",param:{code:"399001.sz",optionType:OptionType.OptionTypeUnknown, pageIndex: 0}},
    {title: "期权行情-SZ3002",request: "OptionReq",param:{code:"90002507.sz",optionType:OptionType.OptionTypeUnknown, pageIndex: 0}},
    {title: "期权行情-SZ8100",request: "OptionReq",param:{code:"299920.sz",optionType:OptionType.OptionTypeUnknown, pageIndex: 0}},
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                  router.pushUrl({ url: 'pages/ResponsePages/OptionResp', params: value });
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
  optionType?:OptionType;
  pageIndex?: number
}