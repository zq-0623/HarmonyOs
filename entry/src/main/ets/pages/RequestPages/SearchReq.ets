import router from '@ohos.router'
@Entry
@Component
struct SearchReq {   // 在线搜索
  @State message: string = 'Hello World'
  requestList:Array<ListRequestType> = [
    {title: "搜索-sh",request: "SearchReq",param:{keyword:"0",categories:['sh'],limit:10}},
    {title: "搜索-sz",request: "SearchReq",param:{keyword:"0",categories:['sz']}},
    {title: "搜索-bz",request: "SearchReq",param:{keyword:"0",categories:['bz']}},
    {title: "搜索-csi",request: "SearchReq",param:{keyword:"0",categories:['csi']}},
    {title: "搜索-hk",request: "SearchReq",param:{keyword:"0",categories:['hk']}},
    {title: "搜索-hh",request: "SearchReq",param:{keyword:"0",categories:['hh']}},
    {title: "搜索-hz",request: "SearchReq",param:{keyword:"0",categories:['hz']}},
    {title: "搜索-bk",request: "SearchReq",param:{keyword:"0",categories:['bk']}},
    {title: "搜索-bj",request: "SearchReq",param:{keyword:"0",categories:['bj']}},
    {title: "搜索-gb",request: "SearchReq",param:{keyword:"0",categories:['gb']}},
    {title: "搜索-CFF",request: "SearchReq",param:{keyword:"0",categories:['cff']}},
    {title: "搜索-DCE",request: "SearchReq",param:{keyword:"0",categories:['dce']}},
    {title: "搜索-CZCE",request: "SearchReq",param:{keyword:"0",categories:['czce']}},
    {title: "搜索-SHFE",request: "SearchReq",param:{keyword:"0",categories:['shfe']}},
    {title: "搜索-INE",request: "SearchReq",param:{keyword:"0",categories:['ine']}},
    {title: "搜索-SH1001",request: "SearchReq",param:{keyword:"0",categories:['sh_1001']}},
    {title: "搜索-SZ1001",request: "SearchReq",param:{keyword:"0",categories:['sz_1001']}},
    {title: "搜索-SH1006",request: "SearchReq",param:{keyword:"0",categories:['sh_1006']}},
    {title: "搜索-SZ1004",request: "SearchReq",param:{keyword:"0",categories:['sz_1004']}},
    {title: "搜索-SH1100",request: "SearchReq",param:{keyword:"0",categories:['sh_1100']}},
    {title: "搜索-SZ1100",request: "SearchReq",param:{keyword:"0",categories:['sz_1100']}},
    {title: "搜索-SH1300",request: "SearchReq",param:{keyword:"0",categories:['sh_1300']}},
    {title: "搜索-SZ1300",request: "SearchReq",param:{keyword:"0",categories:['sz_1300']}},
    {title: "搜索-SH1400",request: "SearchReq",param:{keyword:"0",categories:['sh_1400']}},
    {title: "搜索-SZ1400",request: "SearchReq",param:{keyword:"0",categories:['sz_1400']}},
    {title: "搜索-SH3002",request: "SearchReq",param:{keyword:"0",categories:['sh_3002']}},
    {title: "搜索-SZ3002",request: "SearchReq",param:{keyword:"0",categories:['sz_3002']}},
    {title: "搜索-SZHK",request: "SearchReq",param:{keyword:"0",categories:['SZHK']}},
    {title: "搜索-shbh",request: "SearchReq",param:{keyword:"0",categories:['shbh']}},
    {title: "搜索-szbh",request: "SearchReq",param:{keyword:"0",categories:['szbh']}},
    {title: "搜索-all",request: "SearchReq",param:{keyword:'0',categories:['sz','sh','bz','csi','hk','hh','hz','cff','dce','czce','gb','ine','shfe','bk','bj','bz','SH1001','SZ1001','SH1006','shbh']}},
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                router.pushUrl({ url: 'pages/ResponsePages/SearchResp', params: value });
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
  limit?: number
}