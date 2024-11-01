import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium';
import { ErrorInfo,QuoteDetailReq,QuoteItem,QuoteResp} from '../../../../../oh_modules/SseCore'
import {
  addValue
} from '../../../../main/ets/common/AddValueCustomField';
import {
  QuoteFiled
} from '../../../../main/ets/common/quoteCustomField';

async function sleep(time: number){
  return new Promise<void>(resolve => setTimeout(resolve, time));
}

export default function QuoteDetailTest() {
  // QuoteDetail
  describe('QuoteDetailTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      // 预设一个操作，该操作在测试套件的所有测试用例启动之前仅执行一次。
      //       此 API 仅支持一个参数：预置操作函数

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
    // test01
    it("QuoteDetail_sh",0,async () =>{
      let QuoteRequestList:Array<ListRequestType> = [
        {title: "请求快照-sh",request: "QuoteDetailReq",param:{code:"600000.sh"}}
      ]
      QuoteRequestList.forEach((value,index) =>{
        let req = new QuoteDetailReq();
        for (let keyValue of Object.entries(value.param as Record<string, Object>)) {
                Reflect.set(req, keyValue[0], keyValue[1]);
              }
        req.send({
          onSuccess:(resp:QuoteResp) => {
            if (resp.quoteItems) {
              let str: QuoteItem = resp.quoteItems[0]
              expect(str.lastPrice).assertEqual('05')
            }
          },
          onFail:(err:ErrorInfo) => {
            console.error(err.getMsg()+value.title + index);
            expect('200').assertEqual(err.getErrCode()+err.getMsg())
          }
        })
      })
      await sleep(3000)
    })
    // test02
    it("QuoteDetail_sz",0,async () =>{
      let QuoteRequestList:Array<ListRequestType> = [
        {title: "请求快照-sz",request: "QuoteDetailReq",param:{code:"300133.sz"}}
      ]
      QuoteRequestList.forEach((value,index) =>{
        let req = new QuoteDetailReq();
        for (let keyValue of Object.entries(value.param as Record<string, Object>)) {
          Reflect.set(req, keyValue[0], keyValue[1]);
        }
        req.send({
          onSuccess:(resp:QuoteResp) => {
            if (resp.quoteItems) {
              let str: QuoteItem = resp.quoteItems[0]
              expect(str.buy_cancel_count).assertEqual('05')
            }
          },
          onFail:(err:ErrorInfo) => {
            console.error(err.getMsg()+value.title);
            expect('200').assertEqual(err.getErrCode()+err.getMsg())
          }
        })
      })
      await sleep(3000)
    })
    // test03
    it("QuoteDetail_sh3002",0,async () =>{
      let QuoteRequestList:Array<ListRequestType> = [
        {title: "请求快照-sh3002",request: "QuoteDetailReq",param:{code:"10006406.sh"}}
      ]
      QuoteRequestList.forEach((value,index) =>{
        let req = new QuoteDetailReq();
        for (let keyValue of Object.entries(value.param as Record<string, Object>)) {
          Reflect.set(req, keyValue[0], keyValue[1]);
        }
        req.send({
          onSuccess:(resp:QuoteResp) => {
            if (resp.quoteItems) {
              let str: QuoteItem = resp.quoteItems[0]
              expect(str.buy_cancel_count).assertEqual('05')
            }
          },
          onFail:(err:ErrorInfo) => {
            console.error(err.getMsg()+value.title + index);
            expect('200').assertEqual(err.getErrCode()+err.getMsg())
          }
        })
      })
      await sleep(3000)
    })
    // test04
    it("QuoteDetail_sz3002",0,async () =>{
      let QuoteRequestList:Array<ListRequestType> = [
        {title: "请求快照-sz3002",request: "QuoteDetailReq",param:{code:"90002507.sz"}}
      ]
      QuoteRequestList.forEach((value,index) =>{
        let req = new QuoteDetailReq();
        for (let keyValue of Object.entries(value.param as Record<string, Object>)) {
          Reflect.set(req, keyValue[0], keyValue[1]);
        }
        req.send({
          onSuccess:(resp:QuoteResp) => {
            if (resp.quoteItems) {
              let str: QuoteItem = resp.quoteItems[0]
              expect(str.buy_cancel_count).assertEqual('05')
            }
          },
          onFail:(err:ErrorInfo) => {
            console.error(err.getMsg()+value.title + index);
            expect('200').assertEqual(err.getErrCode()+err.getMsg())
          }
        })
      })
      await sleep(3000)
    })
    // test05
    it("QuoteDetail_hk",0,async () =>{
      let QuoteRequestList:Array<ListRequestType> = [
        {title: "请求快照-hk",request: "QuoteDetailReq",param:{code:"00973.hk"}}
      ]
      QuoteRequestList.forEach((value,index) =>{
        let req = new QuoteDetailReq();
        for (let keyValue of Object.entries(value.param as Record<string, Object>)) {
          Reflect.set(req, keyValue[0], keyValue[1]);
        }
        req.send({
          onSuccess:(resp:QuoteResp) => {
            if (resp.quoteItems) {
              let str: QuoteItem = resp.quoteItems[0]
              expect(str.buy_cancel_count).assertEqual('05')
            }
          },
          onFail:(err:ErrorInfo) => {
            console.error(err.getMsg()+value.title + index);
            expect('200').assertEqual(err.getErrCode()+err.getMsg())
          }
        })
      })
      await sleep(3000)
    })
    // test06
    it("QuoteDetail_bz",0,async () =>{
      let QuoteRequestList:Array<ListRequestType> = [
        {title: "请求快照-bz",request: "QuoteDetailReq",param:{code:"836433.bz"}}
      ]
      QuoteRequestList.forEach((value,index) =>{
        let req = new QuoteDetailReq();
        for (let keyValue of Object.entries(value.param as Record<string, Object>)) {
          Reflect.set(req, keyValue[0], keyValue[1]);
        }
        req.send({
          onSuccess:(resp:QuoteResp) => {
            if (resp.quoteItems) {
              let str: QuoteItem = resp.quoteItems[0]
              expect(str.buy_cancel_count).assertEqual('05')
            }
          },
          onFail:(err:ErrorInfo) => {
            console.error(err.getMsg()+value.title + index);
            expect('200').assertEqual(err.getErrCode()+err.getMsg())
          }
        })
      })
      await sleep(3000)
    })
    // test07
    it("QuoteDetail_csi",0,async () =>{
      let QuoteRequestList:Array<ListRequestType> = [
        {title: "请求快照-csi",request: "QuoteDetailReq",param:{code:"000902.csi"}}
      ]
      QuoteRequestList.forEach((value,index) =>{
        let req = new QuoteDetailReq();
        for (let keyValue of Object.entries(value.param as Record<string, Object>)) {
          Reflect.set(req, keyValue[0], keyValue[1]);
        }
        req.send({
          onSuccess:(resp:QuoteResp) => {
            if (resp.quoteItems) {
              let str: QuoteItem = resp.quoteItems[0]
              expect(str.buy_cancel_count).assertEqual('05')
            }
          },
          onFail:(err:ErrorInfo) => {
            console.error(err.getMsg()+value.title + index);
            expect('200').assertEqual(err.getErrCode()+err.getMsg())
          }
        })
      })
      await sleep(3000)
    })
    // test08
    it("QuoteDetail_bj",0,async () =>{
      let QuoteRequestList:Array<ListRequestType> = [
        {title: "请求快照-bj",request: "QuoteDetailReq",param:{code:"830899.bj",}}
      ]
      QuoteRequestList.forEach((value,index) =>{
        let req = new QuoteDetailReq();
        for (let keyValue of Object.entries(value.param as Record<string, Object>)) {
          Reflect.set(req, keyValue[0], keyValue[1]);
        }
        req.send({
          onSuccess:(resp:QuoteResp) => {
            if (resp.quoteItems) {
              let str: QuoteItem = resp.quoteItems[0]
              expect(str.buy_cancel_count).assertEqual('05')
            }
          },
          onFail:(err:ErrorInfo) => {
            console.error(err.getMsg()+value.title + index);
            expect('200').assertEqual(err.getErrCode()+err.getMsg())
          }
        })
      })
      await sleep(3000)
    })
    // test09
    it("QuoteDetail_bk",0,async () =>{
      let QuoteRequestList:Array<ListRequestType> = [
        {title: "请求快照-bk",request: "QuoteDetailReq",param:{code:"F10009.bk"}}
      ]
      QuoteRequestList.forEach((value,index) =>{
        let req = new QuoteDetailReq();
        for (let keyValue of Object.entries(value.param as Record<string, Object>)) {
          Reflect.set(req, keyValue[0], keyValue[1]);
        }
        req.send({
          onSuccess:(resp:QuoteResp) => {
            if (resp.quoteItems) {
              let str: QuoteItem = resp.quoteItems[0]
              expect(str.buy_cancel_count).assertEqual('05')
            }
          },
          onFail:(err:ErrorInfo) => {
            console.error(err.getMsg()+value.title + index);
            expect('200').assertEqual(err.getErrCode()+err.getMsg())
          }
        })
      })
      await sleep(3000)
    })
    // test10
    it("QuoteDetail_中金所CFF",0,async () =>{
      let QuoteRequestList:Array<ListRequestType> = [
        {title: "请求快照-中金所CFF",request: "QuoteDetailReq",param:{code:"HO2403-C-1975.cff"}}
      ]
      QuoteRequestList.forEach((value,index) =>{
        let req = new QuoteDetailReq();
        for (let keyValue of Object.entries(value.param as Record<string, Object>)) {
          Reflect.set(req, keyValue[0], keyValue[1]);
        }
        req.send({
          onSuccess:(resp:QuoteResp) => {
            if (resp.quoteItems) {
              let str: QuoteItem = resp.quoteItems[0]
              expect(str.buy_cancel_count).assertEqual('05')
            }
          },
          onFail:(err:ErrorInfo) => {
            console.error(err.getMsg()+value.title + index);
            expect('200').assertEqual(err.getErrCode()+err.getMsg())
          }
        })
      })
      await sleep(3000)
    })
    // test11
    it("QuoteDetail_大商所DCE",0,async () =>{
      let QuoteRequestList:Array<ListRequestType> = [
        {title: "请求快照-大商所DCE",request: "QuoteDetailReq",param:{code:"a2403.dce"}}
      ]
      QuoteRequestList.forEach((value,index) =>{
        let req = new QuoteDetailReq();
        for (let keyValue of Object.entries(value.param as Record<string, Object>)) {
          Reflect.set(req, keyValue[0], keyValue[1]);
        }
        req.send({
          onSuccess:(resp:QuoteResp) => {
            if (resp.quoteItems) {
              let str: QuoteItem = resp.quoteItems[0]
              expect(str.buy_cancel_count).assertEqual('05')
            }
          },
          onFail:(err:ErrorInfo) => {
            console.error(err.getMsg()+value.title + index);
            expect('200').assertEqual(err.getErrCode()+err.getMsg())
          }
        })
      })
      await sleep(3000)
    })
    // test12
    it("QuoteDetail_郑商所CZCE",0,async () =>{
      let QuoteRequestList:Array<ListRequestType> = [
        {title: "请求快照-郑商所CZCE",request: "QuoteDetailReq",param:{code:"AP0001.czce"}}
      ]
      QuoteRequestList.forEach((value,index) =>{
        let req = new QuoteDetailReq();
        for (let keyValue of Object.entries(value.param as Record<string, Object>)) {
          Reflect.set(req, keyValue[0], keyValue[1]);
        }
        req.send({
          onSuccess:(resp:QuoteResp) => {
            if (resp.quoteItems) {
              let str: QuoteItem = resp.quoteItems[0]
              expect(str.buy_cancel_count).assertEqual('05')
            }
          },
          onFail:(err:ErrorInfo) => {
            console.error(err.getMsg()+value.title + index);
            expect('200').assertEqual(err.getErrCode()+err.getMsg())
          }
        })
      })
      await sleep(3000)
    })
    // test13
    it("QuoteDetail_上期所SHFE",0,async () =>{
      let QuoteRequestList:Array<ListRequestType> = [
        {title: "请求快照-上期所SHFE",request: "QuoteDetailReq",param:{code:"ag0001.shfe"}}
      ]
      QuoteRequestList.forEach((value,index) =>{
        let req = new QuoteDetailReq();
        for (let keyValue of Object.entries(value.param as Record<string, Object>)) {
          Reflect.set(req, keyValue[0], keyValue[1]);
        }
        req.send({
          onSuccess:(resp:QuoteResp) => {
            if (resp.quoteItems) {
              let str: QuoteItem = resp.quoteItems[0]
              expect(str.buy_cancel_count).assertEqual('05')
            }
          },
          onFail:(err:ErrorInfo) => {
            console.error(err.getMsg()+value.title + index);
            expect('200').assertEqual(err.getErrCode()+err.getMsg())
          }
        })
      })
      await sleep(3000)
    })
    // test14
    it("QuoteDetail_上期所原油INE",0,async () =>{
      let QuoteRequestList:Array<ListRequestType> = [
        {title: "请求快照-上期所原油INE",request: "QuoteDetailReq",param:{code:"bc0001.ine"}}
      ]
      QuoteRequestList.forEach((value,index) =>{
        let req = new QuoteDetailReq();
        for (let keyValue of Object.entries(value.param as Record<string, Object>)) {
          Reflect.set(req, keyValue[0], keyValue[1]);
        }
        req.send({
          onSuccess:(resp:QuoteResp) => {
            if (resp.quoteItems) {
              let str: QuoteItem = resp.quoteItems[0]
              expect(str.buy_cancel_count).assertEqual('05')
            }
          },
          onFail:(err:ErrorInfo) => {
            console.error(err.getMsg()+value.title + index);
            expect('200').assertEqual(err.getErrCode()+err.getMsg())
          }
        })
      })
      await sleep(3000)
    })
    // test15
    it("QuoteDetail_gb",0,async () =>{
      let QuoteRequestList:Array<ListRequestType> = [
        {title: "请求快照-gb",request: "QuoteDetailReq",param:{code:"M00003.gb"}}
      ]
      QuoteRequestList.forEach((value,index) =>{
        let req = new QuoteDetailReq();
        for (let keyValue of Object.entries(value.param as Record<string, Object>)) {
          Reflect.set(req, keyValue[0], keyValue[1]);
        }
        req.send({
          onSuccess:(resp:QuoteResp) => {
            if (resp.quoteItems) {
              let str: QuoteItem = resp.quoteItems[0]
              expect(str.buy_cancel_count).assertEqual('05')
            }
          },
          onFail:(err:ErrorInfo) => {
            console.error(err.getMsg()+value.title + index);
            expect('200').assertEqual(err.getErrCode()+err.getMsg())
          }
        })
      })
      await sleep(3000)
    })
    // test16
    it("QuoteDetail_uk",0,async () =>{
      let QuoteRequestList:Array<ListRequestType> = [
        {title: "请求快照-uk",request: "QuoteDetailReq",param:{code:"CYPC.uk"}}
      ]
      QuoteRequestList.forEach((value,index) =>{
        let req = new QuoteDetailReq();
        for (let keyValue of Object.entries(value.param as Record<string, Object>)) {
          Reflect.set(req, keyValue[0], keyValue[1]);
        }
        req.send({
          onSuccess:(resp:QuoteResp) => {
            if (resp.quoteItems) {
              let str: QuoteItem = resp.quoteItems[0]
              expect(str.buy_cancel_count).assertEqual('05')
            }
          },
          onFail:(err:ErrorInfo) => {
            console.error(err.getMsg()+value.title + index);
            expect('200').assertEqual(err.getErrCode()+err.getMsg())
          }
        })
      })
      await sleep(3000)
    })
    // test17
    it("QuoteDetail_自定义快照增值栏位-sh",0,async () =>{
      let QuoteRequestList:Array<ListRequestType> = [
        {title: "自定义快照增值栏位-sh",request: "QuoteDetailReq",param:{code:"688779.sh",quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns}}
      ]
      QuoteRequestList.forEach((value,index) =>{
        let req = new QuoteDetailReq();
        for (let keyValue of Object.entries(value.param as Record<string, Object>)) {
          Reflect.set(req, keyValue[0], keyValue[1]);
        }
        req.send({
          onSuccess:(resp:QuoteResp) => {
            if (resp.quoteItems) {
              let str: QuoteItem = resp.quoteItems[0]
              expect(str.buy_cancel_count).assertEqual('05')
            }
          },
          onFail:(err:ErrorInfo) => {
            console.error(err.getMsg()+value.title + index);
            expect('200').assertEqual(err.getErrCode()+err.getMsg())
          }
        })
      })
      await sleep(3000)
    })
    // test18
    it("QuoteDetail_自定义快照增值栏位-sh3002",0,async () =>{
      let QuoteRequestList:Array<ListRequestType> = [
        {title: "自定义快照增值栏位-sh3002",request: "QuoteDetailReq",param:{code:"10006956.sh",quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns}}
      ]
      QuoteRequestList.forEach((value,index) =>{
        let req = new QuoteDetailReq();
        for (let keyValue of Object.entries(value.param as Record<string, Object>)) {
          Reflect.set(req, keyValue[0], keyValue[1]);
        }
        req.send({
          onSuccess:(resp:QuoteResp) => {
            if (resp.quoteItems) {
              let str: QuoteItem = resp.quoteItems[0]
              expect(str.buy_cancel_count).assertEqual('05')
            }
          },
          onFail:(err:ErrorInfo) => {
            console.error(err.getMsg()+value.title + index);
            expect('200').assertEqual(err.getErrCode()+err.getMsg())
          }
        })
      })
      await sleep(3000)
    })
    // test19
    it("QuoteDetail_自定义快照增值栏位-sz",0,async () =>{
      let QuoteRequestList:Array<ListRequestType> = [
        {title: "自定义快照增值栏位-sz",request: "QuoteDetailReq",param:{code:"300133.sz",quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns}}
      ]
      QuoteRequestList.forEach((value,index) =>{
        let req = new QuoteDetailReq();
        for (let keyValue of Object.entries(value.param as Record<string, Object>)) {
          Reflect.set(req, keyValue[0], keyValue[1]);
        }
        req.send({
          onSuccess:(resp:QuoteResp) => {
            if (resp.quoteItems) {
              let str: QuoteItem = resp.quoteItems[0]
              expect(str.buy_cancel_count).assertEqual('05')
            }
          },
          onFail:(err:ErrorInfo) => {
            console.error(err.getMsg()+value.title + index);
            expect('200').assertEqual(err.getErrCode()+err.getMsg())
          }
        })
      })
      await sleep(3000)
    })
    // test20
    it("QuoteDetail_自定义快照增值栏位-sz3002",0,async () =>{
      let QuoteRequestList:Array<ListRequestType> = [
        {title: "自定义快照增值栏位-sz3002",request: "QuoteDetailReq",param:{code:"90002507.sz",quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns}}
      ]
      QuoteRequestList.forEach((value,index) =>{
        let req = new QuoteDetailReq();
        for (let keyValue of Object.entries(value.param as Record<string, Object>)) {
          Reflect.set(req, keyValue[0], keyValue[1]);
        }
        req.send({
          onSuccess:(resp:QuoteResp) => {
            if (resp.quoteItems) {
              let str: QuoteItem = resp.quoteItems[0]
              expect(str.buy_cancel_count).assertEqual('05')
            }
          },
          onFail:(err:ErrorInfo) => {
            console.error(err.getMsg()+value.title + index);
            expect('200').assertEqual(err.getErrCode()+err.getMsg())
          }
        })
      })
      await sleep(3000)
    })
    // test21
    it("QuoteDetail_自定义快照增值栏位-hk",0,async () =>{
      let QuoteRequestList:Array<ListRequestType> = [
        {title: "自定义快照增值栏位-hk",request: "QuoteDetailReq",param:{code:"09988.hk",quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns}}
      ]
      QuoteRequestList.forEach((value,index) =>{
        let req = new QuoteDetailReq();
        for (let keyValue of Object.entries(value.param as Record<string, Object>)) {
          Reflect.set(req, keyValue[0], keyValue[1]);
        }
        req.send({
          onSuccess:(resp:QuoteResp) => {
            if (resp.quoteItems) {
              let str: QuoteItem = resp.quoteItems[0]
              expect(str.buy_cancel_count).assertEqual('05')
            }
          },
          onFail:(err:ErrorInfo) => {
            console.error(err.getMsg()+value.title + index);
            expect('200').assertEqual(err.getErrCode()+err.getMsg())
          }
        })
      })
      await sleep(3000)
    })
    // test22
    it("QuoteDetail_自定义快照增值栏位-bz",0,async () =>{
      let QuoteRequestList:Array<ListRequestType> = [
        {title: "自定义快照增值栏位-bz",request: "QuoteDetailReq",param:{code:"836433.bz",quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns}}
      ]
      QuoteRequestList.forEach((value,index) =>{
        let req = new QuoteDetailReq();
        for (let keyValue of Object.entries(value.param as Record<string, Object>)) {
          Reflect.set(req, keyValue[0], keyValue[1]);
        }
        req.send({
          onSuccess:(resp:QuoteResp) => {
            if (resp.quoteItems) {
              let str: QuoteItem = resp.quoteItems[0]
              expect(str.buy_cancel_count).assertEqual('05')
            }
          },
          onFail:(err:ErrorInfo) => {
            console.error(err.getMsg()+value.title + index);
            expect('200').assertEqual(err.getErrCode()+err.getMsg())
          }
        })
      })
      await sleep(3000)
    })
    // test23
    it("QuoteDetail_自定义快照增值栏位-csi",0,async () =>{
      let QuoteRequestList:Array<ListRequestType> = [
        {title: "自定义快照增值栏位-csi",request: "QuoteDetailReq",param:{code:"000902.csi",quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns}}
      ]
      QuoteRequestList.forEach((value,index) =>{
        let req = new QuoteDetailReq();
        for (let keyValue of Object.entries(value.param as Record<string, Object>)) {
          Reflect.set(req, keyValue[0], keyValue[1]);
        }
        req.send({
          onSuccess:(resp:QuoteResp) => {
            if (resp.quoteItems) {
              let str: QuoteItem = resp.quoteItems[0]
              expect(str.buy_cancel_count).assertEqual('05')
            }
          },
          onFail:(err:ErrorInfo) => {
            console.error(err.getMsg()+value.title + index);
            expect('200').assertEqual(err.getErrCode()+err.getMsg())
          }
        })
      })
      await sleep(3000)
    })
    // test24
    it("QuoteDetail_自定义快照增值栏位-bj",0,async () =>{
      let QuoteRequestList:Array<ListRequestType> = [
        {title: "自定义快照增值栏位-bj",request: "QuoteDetailReq",param:{code:"830899.bj",quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns}}
      ]
      QuoteRequestList.forEach((value,index) =>{
        let req = new QuoteDetailReq();
        for (let keyValue of Object.entries(value.param as Record<string, Object>)) {
          Reflect.set(req, keyValue[0], keyValue[1]);
        }
        req.send({
          onSuccess:(resp:QuoteResp) => {
            if (resp.quoteItems) {
              let str: QuoteItem = resp.quoteItems[0]
              expect(str.buy_cancel_count).assertEqual('05')
            }
          },
          onFail:(err:ErrorInfo) => {
            console.error(err.getMsg()+value.title + index);
            expect('200').assertEqual(err.getErrCode()+err.getMsg())
          }
        })
      })
      await sleep(3000)
    })
    // test25
    it("QuoteDetail_自定义快照增值栏位-bk",0,async () =>{
      let QuoteRequestList:Array<ListRequestType> = [
        {title: "自定义快照增值栏位-bk",request: "QuoteDetailReq",param:{code:"F10009.bk",quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns}}
      ]
      QuoteRequestList.forEach((value,index) =>{
        let req = new QuoteDetailReq();
        for (let keyValue of Object.entries(value.param as Record<string, Object>)) {
          Reflect.set(req, keyValue[0], keyValue[1]);
        }
        req.send({
          onSuccess:(resp:QuoteResp) => {
            if (resp.quoteItems) {
              let str: QuoteItem = resp.quoteItems[0]
              expect(str.buy_cancel_count).assertEqual('05')
            }
          },
          onFail:(err:ErrorInfo) => {
            console.error(err.getMsg()+value.title + index);
            expect('200').assertEqual(err.getErrCode()+err.getMsg())
          }
        })
      })
      await sleep(3000)
    })
    // test26
    it("QuoteDetail_自定义快照增值栏位-中金所CFF",0,async () =>{
      let QuoteRequestList:Array<ListRequestType> = [
        {title: "自定义快照增值栏位-中金所CFF",request: "QuoteDetailReq",param:{code:"HO2403-C-1975.cff",quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns}}
      ]
      QuoteRequestList.forEach((value,index) =>{
        let req = new QuoteDetailReq();
        for (let keyValue of Object.entries(value.param as Record<string, Object>)) {
          Reflect.set(req, keyValue[0], keyValue[1]);
        }
        req.send({
          onSuccess:(resp:QuoteResp) => {
            if (resp.quoteItems) {
              let str: QuoteItem = resp.quoteItems[0]
              expect(str.buy_cancel_count).assertEqual('05')
            }
          },
          onFail:(err:ErrorInfo) => {
            console.error(err.getMsg()+value.title + index);
            expect('200').assertEqual(err.getErrCode()+err.getMsg())
          }
        })
      })
      await sleep(3000)
    })
    // test27
    it("QuoteDetail_自定义快照增值栏位-大商所DCE",0,async () =>{
      let QuoteRequestList:Array<ListRequestType> = [
        {title: "自定义快照增值栏位-大商所DCE",request: "QuoteDetailReq",param:{code:"a2403.dce",quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns}}
      ]
      QuoteRequestList.forEach((value,index) =>{
        let req = new QuoteDetailReq();
        for (let keyValue of Object.entries(value.param as Record<string, Object>)) {
          Reflect.set(req, keyValue[0], keyValue[1]);
        }
        req.send({
          onSuccess:(resp:QuoteResp) => {
            if (resp.quoteItems) {
              let str: QuoteItem = resp.quoteItems[0]
              expect(str.buy_cancel_count).assertEqual('05')
            }
          },
          onFail:(err:ErrorInfo) => {
            console.error(err.getMsg()+value.title + index);
            expect('200').assertEqual(err.getErrCode()+err.getMsg())
          }
        })
      })
      await sleep(3000)
    })
    // test28
    it("QuoteDetail_自定义快照增值栏位-郑商所CZCE",0,async () =>{
      let QuoteRequestList:Array<ListRequestType> = [
        {title: "自定义快照增值栏位-郑商所CZCE",request: "QuoteDetailReq",param:{code:"AP0001.czce",quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns}}
      ]
      QuoteRequestList.forEach((value,index) =>{
        let req = new QuoteDetailReq();
        for (let keyValue of Object.entries(value.param as Record<string, Object>)) {
          Reflect.set(req, keyValue[0], keyValue[1]);
        }
        req.send({
          onSuccess:(resp:QuoteResp) => {
            if (resp.quoteItems) {
              let str: QuoteItem = resp.quoteItems[0]
              expect(str.buy_cancel_count).assertEqual('05')
            }
          },
          onFail:(err:ErrorInfo) => {
            console.error(err.getMsg()+value.title + index);
            expect('200').assertEqual(err.getErrCode()+err.getMsg())
          }
        })
      })
      await sleep(3000)
    })
    // test29
    it("QuoteDetail_自定义快照增值栏位-上期所SHFE",0,async () =>{
      let QuoteRequestList:Array<ListRequestType> = [
        {title: "自定义快照增值栏位-上期所SHFE",request: "QuoteDetailReq",param:{code:"ag0001.shfe",quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns}}
      ]
      QuoteRequestList.forEach((value,index) =>{
        let req = new QuoteDetailReq();
        for (let keyValue of Object.entries(value.param as Record<string, Object>)) {
          Reflect.set(req, keyValue[0], keyValue[1]);
        }
        req.send({
          onSuccess:(resp:QuoteResp) => {
            if (resp.quoteItems) {
              let str: QuoteItem = resp.quoteItems[0]
              expect(str.buy_cancel_count).assertEqual('05')
            }
          },
          onFail:(err:ErrorInfo) => {
            console.error(err.getMsg()+value.title + index);
            expect('200').assertEqual(err.getErrCode()+err.getMsg())
          }
        })
      })
      await sleep(3000)
    })
    // test30
    it("QuoteDetail_自定义快照增值栏位-上期所原油INE",0,async () =>{
      let QuoteRequestList:Array<ListRequestType> = [
        {title: "自定义快照增值栏位-上期所原油INE",request: "QuoteDetailReq",param:{code:"bc0001.ine",quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns}}
      ]
      QuoteRequestList.forEach((value,index) =>{
        let req = new QuoteDetailReq();
        for (let keyValue of Object.entries(value.param as Record<string, Object>)) {
          Reflect.set(req, keyValue[0], keyValue[1]);
        }
        req.send({
          onSuccess:(resp:QuoteResp) => {
            if (resp.quoteItems) {
              let str: QuoteItem = resp.quoteItems[0]
              expect(str.buy_cancel_count).assertEqual('05')
            }
          },
          onFail:(err:ErrorInfo) => {
            console.error(err.getMsg()+value.title + index);
            expect('200').assertEqual(err.getErrCode()+err.getMsg())
          }
        })
      })
      await sleep(3000)
    })
    // test31
    it("QuoteDetail_自定义快照增值栏位-gb",0,async () =>{
      let QuoteRequestList:Array<ListRequestType> = [
        {title: "自定义快照增值栏位-gb",request: "QuoteDetailReq",param:{code:"AUDUSD.gb",quoteColumns:[QuoteFiled.quoteCustoms[4]]}}
      ]
      QuoteRequestList.forEach((value,index) =>{
        let req = new QuoteDetailReq();
        for (let keyValue of Object.entries(value.param as Record<string, Object>)) {
          Reflect.set(req, keyValue[0], keyValue[1]);
        }
        req.send({
          onSuccess:(resp:QuoteResp) => {
            if (resp.quoteItems) {
              let str: QuoteItem = resp.quoteItems[0]
              expect(str.buy_cancel_count).assertEqual('05')
            }
          },
          onFail:(err:ErrorInfo) => {
            console.error(err.getMsg()+value.title + index);
            expect('200').assertEqual(err.getErrCode()+err.getMsg())
          }
        })
      })
      await sleep(3000)
    })
    // test32
    it("QuoteDetail_自定义快照增值栏位-uk",0,async () =>{
      let QuoteRequestList:Array<ListRequestType> = [
        {title: "自定义快照增值栏位-uk",request: "QuoteDetailReq",param:{code:"CYPC.uk",quoteColumns:QuoteFiled.quoteCustoms,addValueColumns:addValue.addValueColumns}}
      ]
      QuoteRequestList.forEach((value,index) =>{
        let req = new QuoteDetailReq();
        for (let keyValue of Object.entries(value.param as Record<string, Object>)) {
          Reflect.set(req, keyValue[0], keyValue[1]);
        }
        req.send({
          onSuccess:(resp:QuoteResp) => {
            if (resp.quoteItems) {
              let str: QuoteItem = resp.quoteItems[0]
              expect(str.buy_cancel_count).assertEqual('05')
            }
          },
          onFail:(err:ErrorInfo) => {
            console.error(err.getMsg()+value.title + index);
            expect('200').assertEqual(err.getErrCode()+err.getMsg())
          }
        })
      })
      await sleep(3000)
    })
  })
}

export  interface ListRequestType {
  title?: string;
  request?: string;
  param?: Params;
}
export  interface Params {
  code?: string;
  codes?: string[];
  quoteColumns?: number[];
  addValueColumns?: number[]
}

