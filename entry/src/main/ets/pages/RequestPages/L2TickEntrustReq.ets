import router from '@ohos.router'
@Entry
@Component
struct L2TickEntrustReq {
  @State message: string = 'Hello World'
  /*
  测试场景：
  * type: -1 表示最新一页的数据
  *        0 表示比pageIndex更新一页的数据
  *        1 表示比pageIndex更旧一页的数据
  *  场景一：
  *     当param无值时，pageIndex(页码)，pageSize(每页笔数)，type三个参数
  *         (pageIndex:0,pageSize:50,type:-1)
  *             表示获取最新一页的数据，返回有个结束索引，传入pageIndex中，type为1，则表示拉取前一页的数据 ====>借此方法可拉取全部的委托数据
  *         参数传：结束索引，1  表示获取结束索引之前的数据（更旧/早的数据）
  *         参数传：开始索引，0  表示获取开始索引之后最新的数据
  *  场景二：
  *     当param有值时，优先使用param的值，此时index，pageSize，type三个参数无效
  *         1.param:num1,num2,num3
  *              A.当num3=-1时,num1为任意数字(建议给0)，num2为条数,如 0,20,-1 表示获取最新的20条   ====>获取到的数据最新一条在最前面,starIndex<endIndex
  *              B.当num3=0时,num1为下标，num2为条数，如 2.22373434E8,20,0，表示获取分笔下标为2.22373434E8之后的20条   param:startIndex,20,0;starIndex<endIndex
  *              C.当num3=1时,num1为下标，num2为条数，如 2.22373434E8,20,1，表示获取分笔下标为2.22373434E8之前的20条   param:endIndex,20,1;starIndex>endIndex
  *
   */
  requestList:Array<ListRequestType> = [
    {title: "param和type同时存在",request: "L2TickEntrustReq",param:{code:"600000.sh",subtype:"1001",param:"0,10,-1",pageIndex:0,pageSize:50,type:"-1"}},
    {title: "number参数校验",request: "L2TickEntrustReq",param:{code:"600000.sh",subtype:"1001",pageIndex:0,pageSize:10.3,type:"-1"}},
    {title: "type不存在",request: "L2TickEntrustReq",param:{code:"600000.sh",subtype:"1001",pageIndex:0,pageSize:10.2,type:"5"}},
    {title: "string参数校验",request: "L2TickEntrustReq",param:{code:"600000.sh",subtype:"1001",param:"？？？￥,10,-1"}},
    {title: "获取最新一页数据-type",request: "L2TickEntrustReq",param:{code:"600000.sh",subtype:"1001",pageIndex:0,pageSize:10,type:"-1"}},
    {title: "向前拉取(endIndex)-type",request: "L2TickEntrustReq",param:{code:"600000.sh",subtype:"1001",pageIndex:1.2381588E7,pageSize:10,type:"1"}},
    {title: "向后拉取(startIndex)-type",request: "L2TickEntrustReq",param:{code:"600000.sh",subtype:"1001",pageIndex:1.2381054E7,pageSize:10,type:"0"}},
    {title: "获取最新一页数据-param",request: "L2TickEntrustReq",param:{code:"600000.sh",subtype:"1001",param:"0,20,-1"}},
    {title: "向前拉取-param(endIndex)",request: "L2TickEntrustReq",param:{code:"600000.sh",subtype:"1001",param:"1.2380536E7,20,1"}},
    {title: "向后拉取-param(startIndex)",request: "L2TickEntrustReq",param:{code:"600000.sh",subtype:"1001",param:"1.2379842E7,20,0"}},
    {title: "code参数校验",request: "L2TickEntrustReq",param:{code:"600000.sh",subtype:"1001",pageIndex:0,pageSize:10,type:"0"}},
    {title: "获取最早930开始的委托数据",request: "L2TickEntrustReq",param:{code:"600000.sh",subtype:"1001",param:"0,20,0"}},
  ]
  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.requestList,(value: ListRequestType)=> {
          ListItem() {
            if(value && value.title) {
              Button(value.title).onClick(() => {
                  router.pushUrl({ url: 'pages/ResponsePages/L2TickEntrustResp', params: value });
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
  pageIndex?: number;
  pageSize?: number;
  type?: string;
  param?: string;
}