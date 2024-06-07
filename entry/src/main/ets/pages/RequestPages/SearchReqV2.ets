import router from '@ohos.router'
import { StockTableManager2 ,ErrorInfo} from 'SseCore'

@Entry
@Component
struct SearchReqV2 {
  @State message: string = 'Hello World'
  requestList:Array<ListRequestType> = [
    {title: "搜索V2-sh",request: "SearchReqV2",param:{keyword:"0", searchLocal:true,limit:20,categories:['sh']}},
    {title: "搜索V2-sz",request: "SearchReqV2",param:{keyword:"0", searchLocal:true,limit:20,categories:['sz']}},
    {title: "搜索V2-bz",request: "SearchReqV2",param:{keyword:"0", searchLocal:true,limit:20,categories:['bz']}},
    {title: "搜索V2-csi",request: "SearchReqV2",param:{keyword:"0", searchLocal:true,limit:20,categories:['csi']}},
    {title: "搜索V2-hk",request: "SearchReqV2",param:{keyword:"0", searchLocal:true,limit:20,categories:['hk']}},
    {title: "搜索V2-bz",request: "SearchReqV2",param:{keyword:"0", searchLocal:true,limit:20,categories:['bz']}},
    {title: "搜索V2-hh",request: "SearchReqV2",param:{keyword:"0", searchLocal:true,limit:20,categories:['hh']}},
    {title: "搜索V2-hz",request: "SearchReqV2",param:{keyword:"0", searchLocal:true,limit:20,categories:['hz']}},
    {title: "搜索V2-bk",request: "SearchReqV2",param:{keyword:"0", searchLocal:true,limit:20,categories:['bk']}},
    {title: "搜索V2-bj",request: "SearchReqV2",param:{keyword:"0", searchLocal:true,limit:20,categories:['bj']}},
    {title: "搜索V2-gb",request: "SearchReqV2",param:{keyword:"0", searchLocal:true,limit:20,categories:['gb']}},
    {title: "搜索V2-CFF",request: "SearchReqV2",param:{keyword:"0", searchLocal:true,limit:20,categories:['cff']}},
    {title: "搜索V2-DCE",request: "SearchReqV2",param:{keyword:"0", searchLocal:true,limit:20,categories:['dce']}},
    {title: "搜索V2-CZCE",request: "SearchReqV2",param:{keyword:"0", searchLocal:true,limit:20,categories:['czce']}},
    {title: "搜索V2-SHFE",request: "SearchReqV2",param:{keyword:"0", searchLocal:true,limit:20,categories:['shfe']}},
    {title: "搜索V2-INE",request: "SearchReqV2",param:{keyword:"0", searchLocal:true,limit:20,categories:['ine']}},
    {title: "搜索V2-SH1001",request: "SearchReqV2",param:{keyword:"0", searchLocal:true,limit:20,categories:['SH1001']}},
    {title: "搜索V2-SZ1001",request: "SearchReqV2",param:{keyword:"0", searchLocal:true,limit:20,categories:['SZ1001']}},
    {title: "搜索V2-SH1006",request: "SearchReqV2",param:{keyword:"0", searchLocal:true,limit:20,categories:['SH1006']}},
    {title: "搜索V2-SZ1004",request: "SearchReqV2",param:{keyword:"0", searchLocal:true,limit:20,categories:['SZ1004']}},
    {title: "搜索V2-SH1100",request: "SearchReqV2",param:{keyword:"0", searchLocal:true,limit:20,categories:['SH1100']}},
    {title: "搜索V2-SZ1100",request: "SearchReqV2",param:{keyword:"0", searchLocal:true,limit:20,categories:['SZ1100']}},
    {title: "搜索V2-SH1300",request: "SearchReqV2",param:{keyword:"0", searchLocal:true,limit:20,categories:['SH1300']}},
    {title: "搜索V2-SZ1300",request: "SearchReqV2",param:{keyword:"0", searchLocal:true,limit:20,categories:['SZ1300']}},
    {title: "搜索V2-SH1400",request: "SearchReqV2",param:{keyword:"0", searchLocal:true,limit:20,categories:['SH1400']}},
    {title: "搜索V2-SZ1400",request: "SearchReqV2",param:{keyword:"0", searchLocal:true,limit:20,categories:['SZ1400']}},
    {title: "搜索V2-SH3002",request: "SearchReqV2",param:{keyword:"0", searchLocal:true,limit:20,categories:['SH3002']}},
    {title: "搜索V2-SZ3002",request: "SearchReqV2",param:{keyword:"0", searchLocal:true,limit:20,categories:['SZ3002']}},
    {title: "搜索V2-SZHK",request: "SearchReqV2",param:{keyword:"0", searchLocal:true,limit:20,categories:['SZHK']}},
    {title: "搜索V2-shbh",request: "SearchReqV2",param:{keyword:"0", searchLocal:true,limit:20,categories:['shbh']}},
    {title: "搜索V2-szbh",request: "SearchReqV2",param:{keyword:"0", searchLocal:true,limit:20,categories:['szbh']}},
    {title: "搜索V2-all",request: "SearchReqV2",param:{keyword:'0',searchLocal:true,limit:20,categories:['']}},
  ]
  build() {
    Column() {
      Button("下载码表")
        .onClick(() => {
          StockTableManager2.download(["sh","sz","hk"],(err:ErrorInfo|undefined) => {
          })
        }).width('80%').padding({bottom:20});
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                router.pushUrl({ url: 'pages/ResponsePages/SearchV2Resp', params: value });
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
  keyword?: string;
  categories?: string[];
  searchLocal?: boolean
  limit?: number
}