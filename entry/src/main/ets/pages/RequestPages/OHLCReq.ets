/**
 * Author:qiang
 * Date:2024/4/11
 * IDEA:SseHarmonyOS
 * FileName:OHLCReq
 */
import router from '@ohos.router';
import { ListRequestType } from '../ApiList';

@Entry
@Component
struct OHLCReqList {
  @State message: string = 'Hello World'
  requestList:Array<ListRequestType> = [
    {title:"最新300根历史K线",request:"newOHLCReq"},
    {title:"给定日期之后300根",request:"afterDateOHLCReq"},
    {title:"给定日志之前300根",request:"forwardDateOHLCReq"},
    {title:"获取指定期间的历史数据",request:"betweenDateOHLCReq"}
  ]
  aboutToAppear(){
  }
  // 方式一
  // build() {
  //   Column() {
  //     List() {
  //       ListItem() {
  //         Button("最新300根历史K线").onClick(() => {
  //           router.pushUrl({ url: 'pages/RequestPages/NewThreeHundredOHLCReq' });
  //         }).width('80%');
  //       }.width('100%').padding({bottom:20})
  //       ListItem() {
  //         Button("给定日期之后300根").onClick(() => {
  //           router.pushUrl({ url: 'pages/RequestPages/HistoryThreeOHLCReq' });
  //         }).width('80%');
  //       }.width('100%').padding({bottom:20})
  //       ListItem() {
  //         Button("给定日志之前300根").onClick(() => {
  //           router.pushUrl({ url: 'pages/ApiList' });
  //         }).width('80%');
  //       }.width('100%').padding({bottom:20})
  //       ListItem() {
  //         Button("获取指定期间的历史数据").onClick(() => {
  //           router.pushUrl({ url: 'pages/ApiList' });
  //         }).width('80%');
  //       }.width('100%').padding({bottom:20})
  //     }.alignListItem(ListItemAlign.Center)
  //   }.padding({ top: 50 })
  // }

  // 方式二
  build(){
    Column(){
      List({space:20}){
          ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem(){
            if (value && value.title){
              Button(value.title).onClick(()=>{
                if (value.request === "newOHLCReq") {
                  router.pushUrl({url:'pages/RequestPages/NewOHLCReq'})
                }
                if (value.request === 'afterDateOHLCReq'){
                  router.pushUrl({url:'pages/RequestPages/afterDateOHLCReq'})
                }
                if (value.request === 'forwardDateOHLCReq') {
                  router.pushUrl({url:'pages/RequestPages/forwardDateOHLCReq'})
                }
                if (value.request === 'betweenDateOHLCReq') {
                  router.pushUrl({url:'pages/RequestPages/betweenDateOHLCReq'})
                }
              }).align(Alignment.Center).width('80%');
            }
          }.width('100%')
        })
      }
    }.padding({top:50})
  }

}