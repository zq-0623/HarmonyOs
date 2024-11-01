import router from '@ohos.router'
import { CategoryType } from 'SseCore'
import { SectionSortingField } from 'SseCore'

@Entry
@Component
struct SectionSortingReq {
  @State message: string = 'Hello World'
  requestList:Array<ListRequestType> = [
    {title: "板块排行-概念板块",request: "SectionSortingReq",param:{code:CategoryType.CATE_AREA,ascending:true,field:SectionSortingField.SectionSortingFieldChangeRate}},
    {title: "板块排行-地区板块",request: "SectionSortingReq",param:{code: CategoryType.CATE_AREA}},
    {title: "板块排行-行业板块",request: "SectionSortingReq",param:{code: CategoryType.CATE_TRADE}},
    {title: "板块排行-申万二级行业板块",request: "SectionSortingReq",param:{code: CategoryType.TRADE_SW}},
    {title: "板块排行-申万一级行业板块",request: "SectionSortingReq",param:{code: CategoryType.TRADE_SW1}},
    {title: "板块排行-小方行业板块",request: "SectionSortingReq",param:{code: CategoryType.TRADE_FZ}},
    {title: "板块排行-优品行业板块",request: "SectionSortingReq",param:{code: CategoryType.TRADE_SZYP}},
    {title: "板块排行-优品地区板块",request: "SectionSortingReq",param:{code: CategoryType.AREA_SZYP}},
    {title: "板块排行-优品概念板块",request: "SectionSortingReq",param:{code: CategoryType.NOTION_SZYP}},
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                  router.pushUrl({ url: 'pages/ResponsePages/SectionSortingResp', params: value });
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
  beginIndex?: number
  endIndex?: string
  ascending?: boolean
  field?: SectionSortingField
}