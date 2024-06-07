import router from '@ohos.router'

@Entry
@Component
struct ZTSortingReq {
  @State message: string = 'Hello World'
  requestList:Array<ListRequestType> = [
    {title: "不给page参数",request: "ZTSortingReq",param:{field:"0",ascending:true,ZTType:"0"}},
    {title: "参数校验-小数",request: "ZTSortingReq",param:{pageIndex:0,pageSize:20.4,field:"0",ascending:true,ZTType:"0"}},
    {title: "参数校验-负数",request: "ZTSortingReq",param:{pageIndex:0,pageSize:-20,field:"0",ascending:true,ZTType:"0"}},
    {title: "参数校验-filed不存在",request: "ZTSortingReq",param:{pageIndex:0,pageSize:20,field:"3",ascending:true,ZTType:"0"}},
    {title: "参数校验-filed特殊符号",request: "ZTSortingReq",param:{pageIndex:0,pageSize:20,field:"￥%……",ascending:true,ZTType:"0"}},
    {title: "参数校验-filed-undefined",request: "ZTSortingReq",param:{pageIndex:0,pageSize:20,field:"undefined",ascending:true,ZTType:"0"}},
    {title: "参数校验-排序-undefined",request: "ZTSortingReq",param:{pageIndex:0,pageSize:20,field:"undefined",ascending:undefined,ZTType:"0"}},
    {title: "参数校验-ZTType不存在",request: "ZTSortingReq",param:{pageIndex:0,pageSize:20,field:"0",ascending:undefined,ZTType:"4"}},
    {title: "参数校验-ZTType-undefined",request: "ZTSortingReq",param:{pageIndex:0,pageSize:20,field:"0",ascending:undefined,ZTType:"undefined"}},
    {title: "参数校验-ZTType-特殊符号",request: "ZTSortingReq",param:{pageIndex:0,pageSize:20,field:"0",ascending:undefined,ZTType:"中文"}},
    {title: "时间升序-所有涨停",request: "ZTSortingReq",param:{pageIndex:0,pageSize:50,field:"0",ascending:true,ZTType:"0"}},
    {title: "时间降序-所有涨停",request: "ZTSortingReq",param:{pageIndex:0,pageSize:50,field:"0",ascending:false,ZTType:"0"}},
    {title: "时间升序-一字涨停",request: "ZTSortingReq",param:{pageIndex:0,pageSize:50,field:"0",ascending:true,ZTType:"1"}},
    {title: "时间降序-一字涨停",request: "ZTSortingReq",param:{pageIndex:0,pageSize:50,field:"0",ascending:false,ZTType:"1"}},
    {title: "时间升序-自然涨停",request: "ZTSortingReq",param:{pageIndex:0,pageSize:50,field:"0",ascending:true,ZTType:"2"}},
    {title: "时间降序-自然涨停",request: "ZTSortingReq",param:{pageIndex:0,pageSize:50,field:"0",ascending:false,ZTType:"2"}},
    {title: "最新价升序-所有涨停",request: "ZTSortingReq",param:{pageIndex:0,pageSize:50,field:"6",ascending:true,ZTType:"0"}},
    {title: "最新价降序-所有涨停",request: "ZTSortingReq",param:{pageIndex:0,pageSize:50,field:"6",ascending:false,ZTType:"0"}},
    {title: "最新价升序-一字涨停",request: "ZTSortingReq",param:{pageIndex:0,pageSize:50,field:"6",ascending:true,ZTType:"1"}},
    {title: "最新价降序-一字涨停",request: "ZTSortingReq",param:{pageIndex:0,pageSize:50,field:"6",ascending:false,ZTType:"1"}},
    {title: "最新价升序-自然涨停",request: "ZTSortingReq",param:{pageIndex:0,pageSize:50,field:"6",ascending:true,ZTType:"2"}},
    {title: "最新价降序-自然涨停",request: "ZTSortingReq",param:{pageIndex:0,pageSize:50,field:"6",ascending:false,ZTType:"2"}},
    {title: "涨跌幅升序-所有涨停",request: "ZTSortingReq",param:{pageIndex:0,pageSize:50,field:"7",ascending:true,ZTType:"0"}},
    {title: "涨跌幅降序-所有涨停",request: "ZTSortingReq",param:{pageIndex:0,pageSize:50,field:"7",ascending:false,ZTType:"0"}},
    {title: "涨跌幅升序-一字涨停",request: "ZTSortingReq",param:{pageIndex:0,pageSize:50,field:"7",ascending:true,ZTType:"1"}},
    {title: "涨跌幅降序-一字涨停",request: "ZTSortingReq",param:{pageIndex:0,pageSize:50,field:"7",ascending:false,ZTType:"1"}},
    {title: "涨跌幅升序-自然涨停",request: "ZTSortingReq",param:{pageIndex:0,pageSize:50,field:"7",ascending:true,ZTType:"2"}},
    {title: "涨跌幅降序-自然涨停",request: "ZTSortingReq",param:{pageIndex:0,pageSize:50,field:"7",ascending:false,ZTType:"2"}},
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                  router.pushUrl({ url: 'pages/ResponsePages/ZTSortingResp', params: value });
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
  pageIndex?: number;
  pageSize?: number;
  field?: string;
  ascending?: boolean;
  ZTType?: string
}