import router from '@ohos.router'
@Entry
@Component
struct PricePriceVolumeReq {
  @State message: string = 'Hello World'
  requestList:Array<ListRequestType> = [
    {title: "分价-少传参数校验",request: "PriceVolumeReq",param:{code:"600000.sh,900948.sh"}},
    {title: "分价-code参数校验",request: "PriceVolumeReq",param:{code:"600000.sh,900948.sh", subtype:"1001"}},
    {title: "分价-subtype参数校验",request: "PriceVolumeReq",param:{code:"600000.sh,900948.sh", subtype:"1001"}},
    {title: "分价-SH1001",request: "PriceVolumeReq",param:{code:"600000.sh", subtype:"1001"}},
    {title: "分价-SH1002",request: "PriceVolumeReq",param:{code:"900948.sh", subtype:"1002"}},
    {title: "分价-SH1006",request: "PriceVolumeReq",param:{code:"688009.sh", subtype:"1006"}},
    {title: "分价-SH1100",request: "PriceVolumeReq",param:{code:"513330.sh", subtype:"1100"}},
    {title: "分价-SH1300",request: "PriceVolumeReq",param:{code:"204001.sh", subtype:"1300"}},
    {title: "分价-SH3002",request: "PriceVolumeReq",param:{code:"10006414.sh", subtype:"3002"}},
    {title: "分价-SZ1001",request: "PriceVolumeReq",param:{code:"000001.sz", subtype: "1001"}},
    {title: "分价-SZ1002",request: "PriceVolumeReq",param:{code:"200625.sz", subtype: "1002"}},
    {title: "分价-SZ1004",request: "PriceVolumeReq",param:{code:"300459.sz", subtype: "1004"}},
    {title: "分价-SZ1100",request: "PriceVolumeReq",param:{code: "159792.sz", subtype: "1100"}},
    {title: "分价-SZ1300",request: "PriceVolumeReq",param:{code: "131810.sz", subtype: "1300"}},
    {title: "分价-SZ3002",request: "PriceVolumeReq",param:{code: "90002507.sz", subtype: "3002"}},
    {title: "分价-HK1000",request: "PriceVolumeReq",param:{code: "01468.hk", subtype: "1010"}},
    {title: "分价-HK1100",request: "PriceVolumeReq",param:{code: "03033.hk", subtype: "1100"}},
    {title: "分价-HK1300",request: "PriceVolumeReq",param:{code: "04246.hk", subtype: "1300"}},
    {title: "分价-HK1500",request: "PriceVolumeReq",param:{code: "61759.hk", subtype: "1500"}},
    {title: "分价-HK1600",request: "PriceVolumeReq",param:{code: "23140.hk", subtype: "1600"}},
    {title: "分价-CFF",request: "PriceVolumeReq",param:{code: "HO2506-P-3000.cff", subtype: "futureT"}},
    {title: "分价-DCE",request: "PriceVolumeReq",param:{code: "m2503-C-3150.dce", subtype: "futurej"}},
    {title: "分价-CZCE",request: "PriceVolumeReq",param:{code: "AP505C6700.czce", subtype: "futureSA"}},
    {title: "分价-SHFE",request: "PriceVolumeReq",param:{code: "ag2601.shfe", subtype: "futurerb"}},
    {title: "分价-INE",request: "PriceVolumeReq",param:{code: "sc2712.ine", subtype: "futuresc"}},
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                  router.pushUrl({ url: 'pages/ResponsePages/PriceVolumeResp', params: value });
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
  subtype?: string;
}