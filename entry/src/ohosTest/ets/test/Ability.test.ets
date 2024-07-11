import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Hypium ,DataDriver} from '@ohos/hypium';
import {abilityDelegatorRegistry} from '@kit.TestKit'
import { ErrorInfo ,Permission,QuoteItem,QuoteReq,QuoteResp,RegisterReq,SseConfig,SseSDK} from 'SseCore'
import { QuoteFiled } from '../../../main/ets/common/quoteCustomField';
import { addValue } from '../../../main/ets/common/AddValueCustomField';

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
const bundleName = abilityDelegatorRegistry.getArguments().bundleName
async function sleep(time: number){
  return new Promise<void>(resolve => setTimeout(resolve, time));
}

export default function abilityTest() {
  describe('ActsAbilityTest', () => {

    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      // 预设一个操作，该操作在测试套件的所有测试用例启动之前仅执行一次。
      //       此 API 仅支持一个参数：预置操作函数
      let sseConfig: SseConfig = new SseConfig()
      sseConfig.setAppkey("RNDHZGpBEDW3D3VPErhCLMtUKrkJK5UE0dyd/gvGW00=");
      SseSDK.setConfig(sseConfig);
      SseSDK.setDebug(true,true);
      SseSDK.getHid();
      SseSDK.permission().addShSzPermission(Permission.SH_LEVEL_2).addShSzPermission(Permission.SZ_LEVEL_2)
        .addHkPermission(Permission.HK10).setLevel(Permission.LEVEL_1);
      new RegisterReq().send({
        onSuccess:() => {
          console.info('注册成功');
          console.info("resgister sscuess:" + RegisterReq.toString());
        },
        onFail: (err:ErrorInfo) => {
          console.error("error:" + err.getMsg())
          hilog.info(0x0000, 'testTag', 'Test ping fail', "SseCore.add(2, 3)");
        }
      });

      SseSDK.setIpAndLevelChangedListener({
        ipChanged:(ipOwn:string) => {
          console.info("ipChanged => ipOwn:" + ipOwn);
        },
        onLevelChanged:(market:string,status:string) => {
          console.log("onLevelChanged => market:" + market + ", status:" + status)
        }
      })

    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      // 预设一个操作，该操作在每个单元测试用例启动之前执行。
      //       执行次数与 **it** 定义的测试用例数相同。
      //       此 API 仅支持一个参数：预置操作函数。
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      // 预设一个明确的操作，该操作在每个单元测试用例结束后执行。
      //       执行次数与 **it** 定义的测试用例数相同。
      //       该接口仅支持一个参数：清除操作函数。
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
      // 预设一个明确的操作，该操作在测试套件的所有测试用例结束后执行。
      //       该接口仅支持一个参数：清除操作函数。
    })
    // it("Register",0, () => {
    //   let sseConfig: SseConfig = new SseConfig()
    //   sseConfig.setAppkey("RNDHZGpBEDW3D3VPErhCLMtUKrkJK5UE0dyd/gvGW00=");
    //   SseSDK.setConfig(sseConfig);
    //   SseSDK.setDebug(true,true);
    //   SseSDK.permission().addShSzPermission(Permission.SH_LEVEL_2).addShSzPermission(Permission.SZ_LEVEL_2)
    //     .addHkPermission(Permission.HK10).setLevel(Permission.LEVEL_1);
    //   new RegisterReq().send({
    //     onSuccess:() => {
    //       expect(SseSDK.getHid()).assertEqual('ohos@ac06c026-a650-419f-8874-7d02c7a97a28')
    //       console.info('注册成功');
    //       console.info("resgister sscuess:" + RegisterReq.toString());
    //     },
    //     onFail: (err: ErrorInfo) => {
    //       console.error("error" + err.getMsg())
    //       expect().assertEqual(err.getErrCode()+err.getMsg())
    //       hilog.info(0x0000, 'testTag', 'Test ping fail', "SseCore.add(2, 3)");
    //     }
    //   });
    //
    //   SseSDK.setIpAndLevelChangedListener({
    //     ipChanged:(ipOwn:string) => {
    //       console.info("ipChanged => ipOwn:" + ipOwn);
    //     },
    //     onLevelChanged:(market:string,status:string) => {
    //       console.log("onLevelChanged => market:" + market + ", status:" + status)
    //     }
    //   })
    // })
    it("test",0,async () =>{
     let requestList:Array<ListRequestType> = [
        {title: "自选单市场-sh",request: "QuoteReq",param:{codes:["600010.sh","900924.sh","688009.sh","513330.sh", "204001.sh","000001.sh","10006419.sh"]}},
        {title: "自选单市场-sz",request: "QuoteReq",param:{codes:["000001.sz","200625.sz","300315.sz","159792.sz", "131810.sz","399317.sz","90002507.sz"]}},
        {title: "自选单市场-bz",request: "QuoteReq",param:{codes:["836433.bz","821001.bz","899050.bz"]}},
        {title: "自选单市场-hk",request: "QuoteReq",param:{codes:["00020.hk","03033.hk","04246.hk","HSI.hk","61759.hk","23140.hk"]}},
        {title: "自选单市场-csi",request: "QuoteReq",param:{codes:["000902.csi","930903.csi","932000.csi"]}},
        {title: "自选单市场-bj",request: "QuoteReq",param:{codes:["830899.bj","830806.bj","899001.bj"]}},
        {title: "自选单市场-bk",request: "QuoteReq",param:{codes:["E01039.bk","F10031.bk","A20090.bk","D10032.bk","D20167.bk","J10570.bk","I10034.bk","H10051.bk","G10076.bk"]}},
        {title: "自选单市场-gb",request: "QuoteReq",param:{codes:["M00003.gb","AUDUSD.gb"]}},
        {title: "自选单市场-cff",request: "QuoteReq",param:{codes:["IO2403-P-3200.cff","IM0001.cff"]}},
        {title: "自选单市场-dce",request: "QuoteReq",param:{codes:["a0001.dce","a2405-C-4100.dce"]}},
        {title: "自选单市场-czce",request: "QuoteReq",param:{codes:["AP0001.czce","AP405C10000.czce"]}},
        {title: "自选单市场-shfe",request: "QuoteReq",param:{codes:["al2405C21200.shfe","ag0001.shfe"]}},
        {title: "自选单市场-ine",request: "QuoteReq",param:{codes:["bc0001.ine","sc2404C590.ine"]}},
        {title: "自选单市场-uk",request: "QuoteReq",param:{codes:["CYPC.uk","HTSC.uk"]}},
        {title: "自选多市场-all",request: "QuoteReq",param:{codes:["600010.sh","000001.sz","836433.bz","00020.hk","000902.csi","830899.bj","E01039.bk","M00003.gb","IO2403-P-3200.cff","a0001.dce","AP0001.czce","al2405C21200.shfe","bc0001.ine","CYPC.uk"]}},
        {title: "自选单市场自定义栏位-sh",request: "QuoteReq",param:{codes:["600010.sh","900924.sh","688009.sh","513330.sh", "204001.sh","000001.sh","10006419.sh"],quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns}},
        {title: "自选单市场自定义栏位-sz",request: "QuoteReq",param:{codes:["000001.sz","200625.sz","300315.sz","159792.sz", "131810.sz","399317.sz","90002507.sz"],quoteColumns:[QuoteFiled.quoteCustoms[2]],addValueColumns:addValue.addValueColumns}},
        {title: "自选单市场自定义栏位-bz",request: "QuoteReq",param:{codes:["836433.bz","821001.bz","899050.bz"],quoteColumns:QuoteFiled.quoteCustoms}},
        {title: "自选单市场自定义栏位-hk",request: "QuoteReq",param:{codes:["00020.hk","03033.hk","04246.hk","HSI.hk","61759.hk","23140.hk"],quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns}},
        {title: "自选单市场自定义栏位-csi",request: "QuoteReq",param:{codes:["000902.csi","930903.csi","932000.csi"],quoteColumns:QuoteFiled.quoteCustoms}},
        {title: "自选单市场自定义栏位-bj",request: "QuoteReq",param:{codes:["830899.bj","830806.bj","899001.bj"],quoteColumns:QuoteFiled.quoteCustoms}},
        {title: "自选单市场自定义栏位-bk",request: "QuoteReq",param:{codes:["E01039.bk","F10031.bk","A20090.bk","D10032.bk","D20167.bk","J10570.bk","I10034.bk","H10051.bk","G10076.bk"],quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns}},
        {title: "自选单市场自定义栏位-gb",request: "QuoteReq",param:{codes:["M00003.gb","AUDUSD.gb"],quoteColumns:QuoteFiled.quoteCustoms}},
        {title: "自选单市场自定义栏位-cff",request: "QuoteReq",param:{codes:["IO2403-P-3200.cff","IM0001.cff"],quoteColumns:QuoteFiled.quoteCustoms}},
        {title: "自选单市场自定义栏位-dce",request: "QuoteReq",param:{codes:["a0001.dce","a2405-C-4100.dce"],quoteColumns:QuoteFiled.quoteCustoms}},
        {title: "自选单市场自定义栏位-czce",request: "QuoteReq",param:{codes:["AP0001.czce","AP405C10000.czce"],quoteColumns:QuoteFiled.quoteCustoms}},
        {title: "自选单市场自定义栏位-shfe",request: "QuoteReq",param:{codes:["al2405C21200.shfe","ag0001.shfe"],quoteColumns:QuoteFiled.quoteCustoms}},
        {title: "自选单市场自定义栏位-ine",request: "QuoteReq",param:{codes:["bc0001.ine","sc2404C590.ine"],quoteColumns:QuoteFiled.quoteCustoms}},
        {title: "自选单市场自定义栏位-uk",request: "QuoteReq",param:{codes:["CYPC.uk","HTSC.uk"],quoteColumns:QuoteFiled.quoteCustoms}},
        {title: "自选多市场自定义栏位-all",request: "QuoteReq",param:{codes:["600010.sh","000001.sz","E01039.bk"],quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns}},
        {title: "限制200用例",request: "QuoteReq",param:{codes:["600010.sh","600707.sh","601857.sh","601398.sh","600257.sh","601288.sh","600361.sh","600777.sh","601388.sh","603993.sh","600569.sh","601005.sh","601162.sh","600839.sh","601818.sh","600804.sh","603799.sh","600022.sh","601991.sh","600048.sh","601138.sh","601916.sh","601868.sh","601600.sh","600795.sh","603626.sh","601899.sh","600028.sh","600203.sh","603527.sh","600200.sh","600581.sh","600577.sh","600871.sh","600819.sh","601016.sh","600106.sh","600919.sh","600016.sh","601901.sh","600909.sh","600462.sh","601878.sh","601988.sh","601975.sh","600988.sh","601985.sh","603389.sh","600497.sh","600339.sh","600031.sh","600423.sh","600666.sh","601615.sh","600256.sh","600266.sh","601212.sh","603259.sh","600711.sh","600307.sh","600863.sh","600050.sh","600006.sh","600490.sh","601618.sh","603876.sh","600098.sh","601669.sh","601099.sh","601328.sh","600715.sh","600938.sh","601668.sh","600219.sh","600415.sh","603020.sh","601515.sh","600546.sh","601658.sh","600881.sh","600808.sh","601012.sh","601992.sh","601866.sh","600686.sh","601169.sh","603218.sh","603843.sh","600595.sh","601608.sh","600008.sh","600231.sh","600592.sh","601816.sh","600288.sh","600683.sh","601939.sh","601127.sh","600531.sh","601766.sh","600121.sh","600418.sh","600968.sh","601390.sh","600331.sh","600281.sh","600580.sh","603087.sh","600019.sh","600362.sh","601728.sh","600518.sh","600166.sh","601919.sh","603363.sh","601360.sh","600156.sh","600186.sh","600489.sh","600246.sh","601860.sh","600905.sh","601989.sh","600575.sh","600986.sh","603221.sh","603077.sh","600011.sh","600478.sh","600979.sh","600157.sh","603018.sh","600066.sh","600255.sh","600900.sh","603377.sh","600023.sh","601168.sh","601018.sh","600126.sh","605138.sh","600030.sh","600192.sh","600782.sh","600825.sh","601800.sh","600027.sh","600688.sh","601601.sh","600136.sh","603003.sh","601077.sh","601881.sh","600606.sh","600867.sh","601186.sh","600243.sh","603533.sh","600302.sh","603327.sh","600602.sh","601006.sh","600879.sh","600820.sh","601555.sh","601456.sh","601666.sh","601218.sh","601929.sh","600383.sh","600667.sh","600584.sh","600348.sh","600017.sh","603926.sh","600583.sh","601061.sh","601880.sh","601998.sh","600159.sh","600115.sh","600111.sh","600178.sh","603588.sh","605088.sh","600338.sh","601113.sh","603042.sh","601598.sh","600439.sh","603019.sh","603050.sh","600843.sh","603167.sh","601111.sh","600552.sh","600335.sh","600399.sh","603037.sh","900957.sh","000001.sz"],quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns}},
        {title: "期货限制50用例",request: "QuoteReq",param:{codes:["m2409.dce","m0001.dce","v2409.dce","v0001.dce","p2409.dce","p0001.dce","y0001.dce","y2409.dce","c2407.dce","c0001.dce","i0001.dce","i2409.dce","pp0001.dce","pp2409.dce","l2409.dce","eb2406.dce","eb0001.dce","e2405.dce","eg0001.dce","eg2409.dce","jd0001.dce","jd2409.dce","cs0001.dce","cs2407.dce","pg0001.dce","pg2406.dce","m2405.dce","c2405.dce","jm0001.dce","jm2409.dce","c2409.dce","b2405.dce","v2405.dce","m2501.dce","cs2405.dce","a2405.dce","a0001.dce","a2407.dce","jd2406.dce","eg2405.dce","b0001.dce","b2409.dce","p2405.dce","jd2405.dce","pg2405.dce","y2405.dce","i2501.dce","pp2405.dce","m2407.dce","m2411.dce","SA405.czce"],quoteColumns:QuoteFiled.quoteCustoms}},
      ]
      requestList.forEach((value,index)=>{
        let req = new QuoteReq();
        for (let keyValue of Object.entries(value.param as Record<string, Object>)) {
          Reflect.set(req, keyValue[0], keyValue[1]);
        }
        req.send({
          onSuccess: (resp: QuoteResp) => {
            expect('200').assertEqual('200')
          },
          onFail: (err: ErrorInfo) => {
            console.error(err.getMsg()+value.title);
            expect('200').assertEqual(err.getErrCode()+err.getMsg())
          }
        });
      })
      await sleep(11000);
    })
    it("test1",0,() =>{
      expect('3').assertEqual('2')
    })
  })
}

export  interface ListRequestType {
  title?: string;
  request?: string;
  param?: Params;
}
export  interface Params {
  codes?: string[];
  quoteColumns?: number[];
  addValueColumns?: number[]
}
