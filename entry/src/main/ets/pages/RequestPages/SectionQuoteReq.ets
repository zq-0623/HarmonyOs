import router from '@ohos.router'
import { CompoundUpdownsType,ChartIndexType } from 'SseCore'
@Entry
@Component
struct SectionQuoteReq {
  @State message: string = 'Hello World'
  requestList:Array<ListRequestType> = [
    {title: "个股所属板块-SH1001",request: "SectionQuoteReq",param:{code:"600000.sh",type:"trade,area,notion,trade_sw,trade_sw1,notion_szyp,area_szyp,trade_szyp,trade_fz"}},
    {title: "个股所属板块-SH1002",request: "SectionQuoteReq",param:{code:"900948.sh",type:"trade,area,notion,trade_sw,trade_sw1,notion_szyp,area_szyp,trade_szyp,trade_fz"}},
    {title: "个股所属板块-SH1006",request: "SectionQuoteReq",param:{code:"688009.sh",type:"trade,area,notion,trade_sw,trade_sw1,notion_szyp,area_szyp,trade_szyp,trade_fz"}},
    {title: "个股所属板块-SH1100",request: "SectionQuoteReq",param:{code:"513330.sh",type:"trade,area,notion,trade_sw,trade_sw1,notion_szyp,area_szyp,trade_szyp,trade_fz"}},
    {title: "个股所属板块-SH1300",request: "SectionQuoteReq",param:{code:"204001.sh",type:"trade,area,notion,trade_sw,trade_sw1,notion_szyp,area_szyp,trade_szyp,trade_fz"}},
    {title: "个股所属板块-SH1400",request: "SectionQuoteReq",param:{code:"000001.sh",type:"trade,area,notion,trade_sw,trade_sw1,notion_szyp,area_szyp,trade_szyp,trade_fz"}},
    {title: "个股所属板块-SH3002",request: "SectionQuoteReq",param:{code:"10006414.sh",type:"trade,area,notion,trade_sw,trade_sw1,notion_szyp,area_szyp,trade_szyp,trade_fz"}},
    {title: "个股所属板块-SZ1001",request: "SectionQuoteReq",param:{code:"000001.sz",type:"trade,area,notion,trade_sw,trade_sw1,notion_szyp,area_szyp,trade_szyp,trade_fz"}},
    {title: "个股所属板块-SZ1002",request: "SectionQuoteReq",param:{code:"200625.sz",type:"trade,area,notion,trade_sw,trade_sw1,notion_szyp,area_szyp,trade_szyp,trade_fz"}},
    {title: "个股所属板块-SZ1004",request: "SectionQuoteReq",param:{code:"300459.sz",type:"trade,area,notion,trade_sw,trade_sw1,notion_szyp,area_szyp,trade_szyp,trade_fz"}},
    {title: "个股所属板块-SZ1100",request: "SectionQuoteReq",param:{code:"159792.sz",type:"trade,area,notion,trade_sw,trade_sw1,notion_szyp,area_szyp,trade_szyp,trade_fz"}},
    {title: "个股所属板块-SZ1300",request: "SectionQuoteReq",param:{code:"131810.sz",type:"trade,area,notion,trade_sw,trade_sw1,notion_szyp,area_szyp,trade_szyp,trade_fz"}},
    {title: "个股所属板块-SZ1400",request: "SectionQuoteReq",param:{code:"399001.sz",type:"trade,area,notion,trade_sw,trade_sw1,notion_szyp,area_szyp,trade_szyp,trade_fz"}},
    {title: "个股所属板块-SZ3002",request: "SectionQuoteReq",param:{code:"90002507.sz",type:"trade,area,notion,trade_sw,trade_sw1,notion_szyp,area_szyp,trade_szyp,trade_fz"}},
    {title: "个股所属板块-BZ1001",request: "SectionQuoteReq",param:{code:"836208.bz",type:"trade,area,notion,trade_sw,trade_sw1,notion_szyp,area_szyp,trade_szyp,trade_fz"}},
    {title: "个股所属板块-BZ1300",request: "SectionQuoteReq",param:{code:"821003.bz",type:"trade,area,notion,trade_sw,trade_sw1,notion_szyp,area_szyp,trade_szyp,trade_fz"}},
    {title: "个股所属板块-BZ1400",request: "SectionQuoteReq",param:{code:"899050.bz",type:"trade,area,notion,trade_sw,trade_sw1,notion_szyp,area_szyp,trade_szyp,trade_fz"}},
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                  router.pushUrl({ url: 'pages/ResponsePages/SectionQuoteResp', params: value });
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