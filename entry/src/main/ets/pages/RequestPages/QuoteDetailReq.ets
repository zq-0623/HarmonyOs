import router from '@ohos.router'
import { QuoteFiled } from '../../common/quoteCustomField'
import { addValue } from '../../common/AddValueCustomField'
@Entry
@Component
struct QuoteDetailReq {
  @State message: string = 'Hello World'
  requestList:Array<ListRequestType> = [
    {title: "请求快照-沪指数",request: "QuoteDetailReq",param:{code:"000001.sh"}},
    {title: "请求快照-深指数",request: "QuoteDetailReq",param:{code:"399001.sz"}},
    {title: "请求快照-北证指数",request: "QuoteDetailReq",param:{code:"899050.bz"}},
    {title: "请求快照-北证指数",request: "QuoteDetailReq",param:{code:"02013.hk"}},
    {title: "请求快照-沪ETF",request: "QuoteDetailReq",param:{code:"513060.sh"}},
    {title: "请求快照-深ETF",request: "QuoteDetailReq",param:{code:"159338.sz"}},
    {title: "请求快照-深申购赎回",request: "QuoteDetailReq",param:{code:"159338.sz"}},
    {title: "请求快照-沪ETF无最新价",request: "QuoteDetailReq",param:{code:"519671.sh",quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns}},
    {title: "请求快照-深ETF无最新价",request: "QuoteDetailReq",param:{code:"161505.sz",quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns}},
    {title: "请求快照-sh",request: "QuoteDetailReq",param:{code:"600000.sh"}},
    {title: "请求快照-sh3002",request: "QuoteDetailReq",param:{code:"10006406.sh"}},
    {title: "请求快照-sz",request: "QuoteDetailReq",param:{code:"300133.sz"}},
    {title: "请求快照-sz3002",request: "QuoteDetailReq",param:{code:"90002507.sz"}},
    {title: "请求快照-hk",request: "QuoteDetailReq",param:{code:"03033.hk"}},
    {title: "请求快照-bz",request: "QuoteDetailReq",param:{code:"836433.bz"}},
    {title: "请求快照-csi",request: "QuoteDetailReq",param:{code:"000902.csi"}},
    {title: "请求快照-bj",request: "QuoteDetailReq",param:{code:"830899.bj",}},
    {title: "请求快照-bk",request: "QuoteDetailReq",param:{code:"F10009.bk"}},
    {title: "请求快照-中金所CFF",request: "QuoteDetailReq",param:{code:"HO2403-C-1975.cff"}},
    {title: "请求快照-大商所DCE",request: "QuoteDetailReq",param:{code:"a2403.dce"}},
    {title: "请求快照-郑商所CZCE",request: "QuoteDetailReq",param:{code:"AP0001.czce"}},
    {title: "请求快照-上期所SHFE",request: "QuoteDetailReq",param:{code:"ag0001.shfe"}},
    {title: "请求快照-上期所原油INE",request: "QuoteDetailReq",param:{code:"bc0001.ine"}},
    {title: "请求快照-gb",request: "QuoteDetailReq",param:{code:"M00003.gb"}},
    {title: "请求快照-uk",request: "QuoteDetailReq",param:{code:"CYPC.uk"}},
    {title: "================================"},
    {title: "自定义快照增值栏位-sh",request: "QuoteDetailReq",param:{code:"512800.sh",quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns}},
    {title: "自定义快照增值栏位-sh3002",request: "QuoteDetailReq",param:{code:"10006956.sh",quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns}},
    {title: "自定义快照增值栏位-sz",request: "QuoteDetailReq",param:{code:"300133.sz",quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns}},
    {title: "自定义快照增值栏位-sz3002",request: "QuoteDetailReq",param:{code:"90002507.sz",quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns}},
    {title: "自定义快照增值栏位-hk",request: "QuoteDetailReq",param:{code:"09988.hk",quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns}},
    {title: "自定义快照增值栏位-bz",request: "QuoteDetailReq",param:{code:"836433.bz",quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns}},
    {title: "自定义快照增值栏位-csi",request: "QuoteDetailReq",param:{code:"000902.csi",quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns}},
    {title: "自定义快照增值栏位-bj",request: "QuoteDetailReq",param:{code:"830899.bj",quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns}},
    {title: "自定义快照增值栏位-bk",request: "QuoteDetailReq",param:{code:"F10009.bk",quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns}},
    {title: "自定义快照增值栏位-中金所CFF",request: "QuoteDetailReq",param:{code:"HO2403-C-1975.cff",quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns}},
    {title: "自定义快照增值栏位-大商所DCE",request: "QuoteDetailReq",param:{code:"a2403.dce",quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns}},
    {title: "自定义快照增值栏位-郑商所CZCE",request: "QuoteDetailReq",param:{code:"AP0001.czce",quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns}},
    {title: "自定义快照增值栏位-上期所SHFE",request: "QuoteDetailReq",param:{code:"ag0001.shfe",quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns}},
    {title: "自定义快照增值栏位-上期所原油INE",request: "QuoteDetailReq",param:{code:"bc0001.ine",quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns}},
    {title: "自定义快照增值栏位-gb",request: "QuoteDetailReq",param:{code:"AUDUSD.gb",quoteColumns:[QuoteFiled.quoteCustoms[4]]}},
    {title: "自定义快照增值栏位-gb",request: "QuoteDetailReq",param:{code:"AUDUSD.gb"}},
    {title: "自定义快照增值栏位-uk",request: "QuoteDetailReq",param:{code:"CYPC.uk",quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns}},
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                  router.pushUrl({ url: 'pages/ResponsePages/QuoteDetailResp', params: value });
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
  quoteColumns?: number[]
  addValueColumns?: number[]
}