import router from '@ohos.router'
@Entry
@Component
struct VolumeReq {
  @State message: string = 'Hello World'
  requestList:Array<ListRequestType> = [
    {title: "分量-SH1001",request: "VolumeReq",param:{code:"600000.sh", subtype:"1002"}},
    {title: "分量-SH1002",request: "VolumeReq",param:{code:"900948.sh", subtype:"1002"}},
    {title: "分量-SH1006",request: "VolumeReq",param:{code:"688009.sh", subtype:"1006"}},
    {title: "分量-SH1100",request: "VolumeReq",param:{code:"513330.sh", subtype:"1100"}},
    {title: "分量-SH1300",request: "VolumeReq",param:{code:"204001.sh", subtype:"1300"}},
    {title: "分量-SH1400",request: "VolumeReq",param:{code:"000001.sh", subtype:"1400"}},
    {title: "分量-SZ1001",request: "VolumeReq",param:{code:"000001.sz", subtype: "1001"}},
    {title: "分量-SZ1002",request: "VolumeReq",param:{code:"200625.sz", subtype: "1002"}},
    {title: "分量-SZ1004",request: "VolumeReq",param:{code:"300459.sz", subtype: "1004"}},
    {title: "分量-SZ1100",request: "VolumeReq",param:{code: "159792.sz", subtype: "1100"}},
    {title: "分量-SZ1300",request: "VolumeReq",param:{code: "131810.sz", subtype: "1300"}},
    {title: "分量-SZ1400",request: "VolumeReq",param:{code: "399001.sz", subtype: "1400"}},
    {title: "分量-HK1000",request: "VolumeReq",param:{code: "01468.hk", subtype: "1010"}},
    {title: "分量-HK1100",request: "VolumeReq",param:{code: "03033.hk", subtype: "1100"}},
    {title: "分量-HK1300",request: "VolumeReq",param:{code: "04246.hk", subtype: "1300"}},
    {title: "分量-HK1400",request: "VolumeReq",param:{code: "HSI.hk", subtype: "1400"}},
    {title: "分量-HK1500",request: "VolumeReq",param:{code: "61759.hk", subtype: "1500"}},
    {title: "分量-HK1600",request: "VolumeReq",param:{code: "23140.hk", subtype: "1600"}},
    {title: "分量-少传参数校验",request: "VolumeReq",param:{ subtype: "1010"}},
    {title: "分量-code参数校验",request: "VolumeReq",param:{code: "23140.hk", subtype: "1600"}},
    {title: "分量-subtype参数校验",request: "VolumeReq",param:{code: "600000.sh", subtype: "1001"}},
    {title: "分量-CFF",request: "VolumeReq",param:{code: "T2406.cff", subtype: "futureT"}},
    {title: "分量-DCE",request: "VolumeReq",param:{code: "j2409.dce", subtype: "futurej"}},
    {title: "分量-CZCE",request: "VolumeReq",param:{code: "SA409.czce", subtype: "futureSA"}},
    {title: "分量-SHFE",request: "VolumeReq",param:{code: "rb2410.shfe", subtype: "futurerb"}},
    {title: "分量-INE",request: "VolumeReq",param:{code: "sc0001.ine", subtype: "futuresc"}},
    {title: "分量-CSI1400",request: "VolumeReq",param:{code: "000902.csi", subtype: "1400"}},
    {title: "分量-BZ1001",request: "VolumeReq",param:{code: "834415.bz", subtype: "1001"}},
    {title: "分量-BZ1400",request: "VolumeReq",param:{code: "899050.bz", subtype: "1400"}},
    {title: "分量-BJ1000",request: "VolumeReq",param:{code: "836964.bj", subtype: "1000"}},
    {title: "分量-BJ1400",request: "VolumeReq",param:{code: "899001.bj", subtype: "1400"}},
    {title: "分量-GB1400",request: "VolumeReq",param:{code: "M00003.gb", subtype: "1400"}},
    {title: "分量-GB1001",request: "VolumeReq",param:{code: "AUDUSD.gb", subtype: "1001"}},
    {title: "分量-Notion",request: "VolumeReq",param:{code: "E00104.bk", subtype: "1400"}},
    {title: "分量-Area",request: "VolumeReq",param:{code: "F10031.bk", subtype: "1400"}},
    {title: "分量-Area",request: "VolumeReq",param:{code: "A20090.bk", subtype: "1400"}},
    {title: "分量-Trade_sw1",request: "VolumeReq",param:{code: "D10032.bk", subtype: "1400"}},
    {title: "分量-Trade_sw",request: "VolumeReq",param:{code: "D20167.bk", subtype: "1400"}},
    {title: "分量-Notion_szyp",request: "VolumeReq",param:{code: "J10570.bk", subtype: "1400"}},
    {title: "分量-Area_szyp",request: "VolumeReq",param:{code: "I10034.bk", subtype: "1400"}},
    {title: "分量-Trade_szyp",request: "VolumeReq",param:{code: "H10052.bk", subtype: "1400"}},
    {title: "分量-Trade_fz",request: "VolumeReq",param:{code: "G10076.bk", subtype: "1400"}},
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                  router.pushUrl({ url: 'pages/ResponsePages/VolumeResp', params: value });
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