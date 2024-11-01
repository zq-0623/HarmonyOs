import router from '@ohos.router'
import { ErrorInfo,IPODetailReq,Request,IPODetailResp} from 'SseCore'
import {StockField,BondField} from '../../common/NewStockBondFields'

let RequestMap = { "IPODetailReq": new IPODetailReq(), } as Record<string, Request>
@Entry
@Component
struct F10IPODetailResp {
  @State message: string = 'Hello World'
  @State myParams: Object = router.getParams();
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
      onSuccess:(resp:IPODetailResp) => {
        if (resp.item) {
          let str:Record<string,string> = resp.item as Record<string,string>
          Object.keys(str).forEach(key => {
            // 新股字段 StockField  新债字段 BondField
            const newKey = StockField[key] || key; // 使用映射值，若无映射则使用原值
            console.info(`${newKey}===》${str[key]}`);
          });
        }
      },
      onFail:(err:ErrorInfo) => {
        console.info("F10IPODateResp error" + err.getMsg());
      }
    });
  }
  async aboutToAppear() {
    let recordParam = this.myParams as Record<string, Object>;
    this.title = recordParam['title'] as string;
    this.param = recordParam['param'] as Record<string, Object>;
    this.request = RequestMap[recordParam['request'] as string];
    this.sendReq()
  }
  aboutToDisappear(){
    clearInterval(this.intervalId)
  }
}

