import router from '@ohos.router'
import { ErrorInfo,IPOCalendarReq,Request,IPOCalendarResp} from 'SseCore'

let RequestMap = { "IPOCalendarReq": new IPOCalendarReq(), } as Record<string, Request>
@Entry
@Component
struct F10IPOCalendarResp {
  @State message: string = 'Hello World'
  @State myParams: Object = router.getParams();
  @State autoRefresh: boolean = true; // 开关控制是否进行定时请求
  private title: string = '';
  private request: Request = new Request();
  private param: Record<string, Object> = {};
  build() {
    Column() {
      Text(this.title).padding(5).margin({ bottom: 5 }).fontSize(20).border({ width: 2 }).width('90%')
      Scroll() {
        Text(this.message).width('90%').margin({ left: 15, right: 15, bottom: 5 }).backgroundColor(0xFF56CA6A)
          .padding({ left: 10, right: 10, top: 5, bottom: 25 })
      }
    }.padding({ top: 20 })
  }
  private intervalId?: number
  private sendReq(){
    for (let keyValue of Object.entries(this.param)) {
      Reflect.set(this.request, keyValue[0], keyValue[1]);
    }
    this.request.send({
      onSuccess:(resp:IPOCalendarResp) => {
        this.message = resp.toString();
        if (resp.item) {
          let sg : Record<string,string>[] = resp.item["sglist"] as Record<string,string>[]
          let zq : Record<string,string>[] = resp.item["zqlist"] as Record<string,string>[]
          let ss : Record<string,string>[] = resp.item["sslist"] as Record<string,string>[]
          let jjfx : Record<string,string>[] = resp.item["jjfxlist"] as Record<string,string>[]
          let wss : Record<string,string>[] = resp.item["wsslist"] as Record<string,string>[]
          let dss : Record<string,string>[] = resp.item["dsslist"] as Record<string,string>[]
          if (sg){
            if (sg.length > 0) {
              for (let i = 0; i < sg.length; i++) {
                let sgInfo : Record<string,string> = sg[i]
                if (this.param['type'] === 4) {
                  console.info(`计划发行价区间:${sgInfo['PRICE']}==买卖单位:${sgInfo['TRANSUNIT']}==上市日期:${sgInfo['LISTDATE']}==法人网下配售申购日期起始日:${sgInfo['OFFPLABEGDATE']}==法人网下配售申购日期截止日:${sgInfo['OFFPLAENDDATE']}==股票代码:${sgInfo['TRADINGCODE']}`)
                }else {
                  console.info(`申购代码:${sgInfo['APPLYCODE']}==股票简称:${sgInfo['SECUABBR']}==交易代码:${sgInfo['TRADINGCODE']}==实际发行价格:${sgInfo['ISSUEPRICE']}==预估发行价格:${sgInfo['ISSUEPRICEPLAN']}==发行市盈率:${sgInfo['PEAISSUE']}==中签公告日:${sgInfo['SUCCRESULTNOTICEDATE']}==申购上限:${sgInfo['CAPPLYSHARE']}==中签率:${sgInfo['ALLOTRATEON']}==上市日期:${sgInfo['LISTINGDATE']}==申购日期:${sgInfo['BOOKSTARTDATEON']}==实际发行总量:${sgInfo['ISSUESHARE']}==实际网上发行数量:${sgInfo['ISSUESHAREON']}==实际网上申购所需资金:${sgInfo['CAPPLYPRICE']}==计划发行总量:${sgInfo['CISSUESHAREPLAN']}==计划网上发行量:${sgInfo['ISSUESHAREONPLAN']}==预估网上申购所需资金:${sgInfo['CAPPLYPRICEPLAN']}==顶格申购所需资金:${sgInfo['CAPPLYSHAREPLAN']}==是否科创板:${sgInfo['KEYCODE']}==上市时尚未盈利:${sgInfo['ISPROFIT']}==是否存在投票权差异:${sgInfo['ISDIFFVOTE']}==是否具有协议控制架构:${sgInfo['ISVIEFRAME']}==发行制度:${sgInfo['ISSSYSTEM']}==是否是CDR类型:${sgInfo['SETYPE']}==基础股票(X)与CDR(Y)的转换比例_X:${sgInfo['STOCKCBX']}==基础股票(X)与CDR(Y)的转换比例_Y:${sgInfo['CDRCBY']}`)
                }
              }
            }else {
              console.warn("💧💧💧接口返回今日申购数据为空💧💧💧")
            }
          }
          if (zq){
            if (zq.length > 0) {
              for (let i = 0; i < zq.length; i++) {
                let zqInfo : Record<string,string> = zq[i]
                console.info(`申购代码:${zqInfo['APPLYCODE']}==股票简称:${zqInfo['SECUABBR']}==交易代码:${zqInfo['TRADINGCODE']}==实际发行价格:${zqInfo['ISSUEPRICE']}==预估发行价格:${zqInfo['ISSUEPRICEPLAN']}==发行市盈率:${zqInfo['PEAISSUE']}==中签公告日:${zqInfo['SUCCRESULTNOTICEDATE']}==申购上限:${zqInfo['CAPPLYSHARE']}==中签率:${zqInfo['ALLOTRATEON']}==上市日期:${zqInfo['LISTINGDATE']}==申购日期:${zqInfo['BOOKSTARTDATEON']}==实际发行总量:${zqInfo['ISSUESHARE']}==实际网上发行数量:${zqInfo['ISSUESHAREON']}==实际网上申购所需资金:${zqInfo['CAPPLYPRICE']}==计划发行总量:${zqInfo['CISSUESHAREPLAN']}==计划网上发行量:${zqInfo['ISSUESHAREONPLAN']}==预估网上申购所需资金:${zqInfo['CAPPLYPRICEPLAN']}==顶格申购所需资金:${zqInfo['CAPPLYSHAREPLAN']}==是否科创板:${zqInfo['KEYCODE']}==上市时尚未盈利:${zqInfo['ISPROFIT']}==是否存在投票权差异:${zqInfo['ISDIFFVOTE']}==是否具有协议控制架构:${zqInfo['ISVIEFRAME']}==发行制度:${zqInfo['ISSSYSTEM']}==是否是CDR类型:${zqInfo['SETYPE']}==基础股票(X)与CDR(Y)的转换比例_X:${zqInfo['STOCKCBX']}==基础股票(X)与CDR(Y)的转换比例_Y:${zqInfo['CDRCBY']}`)
              }
            }else {
              console.warn("💧💧💧接口返回今日中签数据为空💧💧💧")
            }
          }
          if(ss){
            if (ss.length > 0) {
              for (let i = 0; i < ss.length; i++) {
                let ssInfo : Record<string,string> = ss[i]
                if (this.param['type'] === 4) {
                  console.info(`计划发行价区间:${ssInfo['PRICE']}==买卖单位:${ssInfo['TRANSUNIT']}==上市日期:${ssInfo['LISTDATE']}==法人网下配售申购日期起始日:${ssInfo['OFFPLABEGDATE']}==法人网下配售申购日期截止日:${ssInfo['OFFPLAENDDATE']}==股票代码:${ssInfo['TRADINGCODE']}`)
                }else {
                  console.info(`申购代码:${ssInfo['APPLYCODE']}==股票简称:${ssInfo['SECUABBR']}==交易代码:${ssInfo['TRADINGCODE']}==实际发行价格:${ssInfo['ISSUEPRICE']}==预估发行价格:${ssInfo['ISSUEPRICEPLAN']}==发行市盈率:${ssInfo['PEAISSUE']}==中签公告日:${ssInfo['SUCCRESULTNOTICEDATE']}==申购上限:${ssInfo['CAPPLYSHARE']}==中签率:${ssInfo['ALLOTRATEON']}==上市日期:${ssInfo['LISTINGDATE']}==申购日期:${ssInfo['BOOKSTARTDATEON']}==实际发行总量:${ssInfo['ISSUESHARE']}==实际网上发行数量:${ssInfo['ISSUESHAREON']}==实际网上申购所需资金:${ssInfo['CAPPLYPRICE']}==计划发行总量:${ssInfo['CISSUESHAREPLAN']}==计划网上发行量:${ssInfo['ISSUESHAREONPLAN']}==预估网上申购所需资金:${ssInfo['CAPPLYPRICEPLAN']}==顶格申购所需资金:${ssInfo['CAPPLYSHAREPLAN']}==是否科创板:${ssInfo['KEYCODE']}==上市时尚未盈利:${ssInfo['ISPROFIT']}==是否存在投票权差异:${ssInfo['ISDIFFVOTE']}==是否具有协议控制架构:${ssInfo['ISVIEFRAME']}==发行制度:${ssInfo['ISSSYSTEM']}==是否是CDR类型:${ssInfo['SETYPE']}==基础股票(X)与CDR(Y)的转换比例_X:${ssInfo['STOCKCBX']}==基础股票(X)与CDR(Y)的转换比例_Y:${ssInfo['CDRCBY']}`)
                }
              }
            }else {
              console.warn("💧💧💧接口返回今日上市数据为空💧💧💧")
            }
          }
          if (jjfx){
            if (jjfx.length > 0) {
              for (let i = 0; i < jjfx.length; i++) {
                let jjfxInfo : Record<string,string> = jjfx[i]
                console.info(`申购代码:${jjfxInfo['APPLYCODE']}==股票简称:${jjfxInfo['SECUABBR']}==交易代码:${jjfxInfo['TRADINGCODE']}==实际发行价格:${jjfxInfo['ISSUEPRICE']}==预估发行价格:${jjfxInfo['ISSUEPRICEPLAN']}==发行市盈率:${jjfxInfo['PEAISSUE']}==中签公告日:${jjfxInfo['SUCCRESULTNOTICEDATE']}==申购上限:${jjfxInfo['CAPPLYSHARE']}==中签率:${jjfxInfo['ALLOTRATEON']}==上市日期:${jjfxInfo['LISTINGDATE']}==申购日期:${jjfxInfo['BOOKSTARTDATEON']}==实际发行总量:${jjfxInfo['ISSUESHARE']}==实际网上发行数量:${jjfxInfo['ISSUESHAREON']}==实际网上申购所需资金:${jjfxInfo['CAPPLYPRICE']}==计划发行总量:${jjfxInfo['CISSUESHAREPLAN']}==计划网上发行量:${jjfxInfo['ISSUESHAREONPLAN']}==预估网上申购所需资金:${jjfxInfo['CAPPLYPRICEPLAN']}==顶格申购所需资金:${jjfxInfo['CAPPLYSHAREPLAN']}==是否科创板:${jjfxInfo['KEYCODE']}==上市时尚未盈利:${jjfxInfo['ISPROFIT']}==是否存在投票权差异:${jjfxInfo['ISDIFFVOTE']}==是否具有协议控制架构:${jjfxInfo['ISVIEFRAME']}==发行制度:${jjfxInfo['ISSSYSTEM']}==是否是CDR类型:${jjfxInfo['SETYPE']}==基础股票(X)与CDR(Y)的转换比例_X:${jjfxInfo['STOCKCBX']}==基础股票(X)与CDR(Y)的转换比例_Y:${jjfxInfo['CDRCBY']}`)
              }
            }else {
              console.warn("💧💧💧接口返回即将发行数据为空💧💧💧")
            }
          }
          if (wss){
            if (wss.length > 0) {
              for (let i = 0; i < wss.length; i++) {
                let wssInfo : Record<string,string> = wss[i]
                console.info(`申购代码:${wssInfo['APPLYCODE']}==股票简称:${wssInfo['SECUABBR']}==交易代码:${wssInfo['TRADINGCODE']}==实际发行价格:${wssInfo['ISSUEPRICE']}==预估发行价格:${wssInfo['ISSUEPRICEPLAN']}==发行市盈率:${wssInfo['PEAISSUE']}==中签公告日:${wssInfo['SUCCRESULTNOTICEDATE']}==申购上限:${wssInfo['CAPPLYSHARE']}==中签率:${wssInfo['ALLOTRATEON']}==上市日期:${wssInfo['LISTINGDATE']}==申购日期:${wssInfo['BOOKSTARTDATEON']}==实际发行总量:${wssInfo['ISSUESHARE']}==实际网上发行数量:${wssInfo['ISSUESHAREON']}==实际网上申购所需资金:${wssInfo['CAPPLYPRICE']}==计划发行总量:${wssInfo['CISSUESHAREPLAN']}==计划网上发行量:${wssInfo['ISSUESHAREONPLAN']}==预估网上申购所需资金:${wssInfo['CAPPLYPRICEPLAN']}==顶格申购所需资金:${wssInfo['CAPPLYSHAREPLAN']}==是否科创板:${wssInfo['KEYCODE']}==上市时尚未盈利:${wssInfo['ISPROFIT']}==是否存在投票权差异:${wssInfo['ISDIFFVOTE']}==是否具有协议控制架构:${wssInfo['ISVIEFRAME']}==发行制度:${wssInfo['ISSSYSTEM']}==是否是CDR类型:${wssInfo['SETYPE']}==基础股票(X)与CDR(Y)的转换比例_X:${wssInfo['STOCKCBX']}==基础股票(X)与CDR(Y)的转换比例_Y:${wssInfo['CDRCBY']}`)
              }
            }else {
              console.warn("💧💧💧接口返回未上市数据为空💧💧💧")
            }
          }
          if (dss) {
            if(dss.length > 0){
              for (let i = 0; i < dss.length; i++) {
                let dssInfo: Record<string,string> = dss[i]
                console.info(`上市日期:${dssInfo['LISTINGDATE']}==债券代码:${dssInfo['TRADINGCODE']}==可转债名称:${dssInfo['SECUABBR']}==中签率:${dssInfo['ALLOTRATEON']}==转股价格:${dssInfo['CONVERTPRICE']}==对应正股代码:${dssInfo['STOCKTRADINGCODE']}==对应正股名称:${dssInfo['STOCKSECUABBR']}==原股东配售代码:${dssInfo['PREFERREDPLACINGCODE']}==可转债申购代码:${dssInfo['APPLYCODE']}==申购日期:${dssInfo['BEGINDATE']}==债券发行总额:${dssInfo['ISSUEVAL']}==网上认购数量上限:${dssInfo['CAPPLYVOL']}==网下认购数量上限:${dssInfo['OFFCAPPLYVOL']}==发行价格:${dssInfo['ISSUEPRICE']}`)
              }
            }else {
              console.warn("💧💧💧接口返回当日待上市数据为空💧💧💧")
            }
          }
        }
      },
      onFail:(err:ErrorInfo) => {
        console.info("F10IPODateResp error" + err.getMsg());
      }
    });
  }
  private startAutoRefresh() {
    this.stopAutoRefresh(); // 先清除可能存在的定时器
    this.intervalId = setInterval(() => {
      if (this.autoRefresh) {
        this.sendReq();
      }
    }, 3000);
  }

  private stopAutoRefresh() {
    if (this.intervalId) {
      clearInterval(this.intervalId);
      this.intervalId = undefined;
    }
  }

  async aboutToAppear() {
    let recordParam = this.myParams as Record<string, Object>;
    this.title = recordParam['title'] as string;
    this.param = recordParam['param'] as Record<string, Object>;
    this.request = RequestMap[recordParam['request'] as string];

    this.sendReq(); // 立即请求一次
    if (this.autoRefresh) {
      this.startAutoRefresh();
    }
  }

  aboutToDisappear() {
    this.stopAutoRefresh();
  }
}

