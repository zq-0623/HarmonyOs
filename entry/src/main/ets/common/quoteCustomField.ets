// /**
//  * Author:qiang
//  * Date:2024/4/8
//  * IDEA:SseHarmonyOS
//  */
import { QuoteCustomField } from 'SseCore'
export class QuoteFiled {
    static readonly quoteCustoms: number[] = [
    // QuoteCustomField.ALL_COLUMN ,                                  //1
    QuoteCustomField.quote_STATUS,													       //2       // 股票状态
    QuoteCustomField.quote_ID,															       //3      //  代码
    QuoteCustomField.quote_NAME,														       //4       // 名称
    QuoteCustomField.quote_DATETIME,												       //5       	// 交易时间
    QuoteCustomField.quote_PINYIN,													       //6       // 拼音
    QuoteCustomField.quote_LAST_PRICE,											       //7       	// 最新价
    QuoteCustomField.quote_HIGH_PRICE,											       //8       	// 最高价
    QuoteCustomField.quote_LOW_PRICE,												       //9       // 	最低价
    QuoteCustomField.quote_OPEN_PRICE,											       //10       	// 今开价
    QuoteCustomField.quote_PRE_CLOSE_PRICE,									       //11       		// 昨收价
    QuoteCustomField.quote_HK_PARAM_STATUS,									       //12       		// 港股外部参数状态揭示
    QuoteCustomField.quote_VOLUME,													       //13       // 总量
    QuoteCustomField.quote_NOW_VOLUME,											       //14       	// 当前成交量
    QuoteCustomField.quote_LIMIT_UP,												       //15       	// 涨停价
    QuoteCustomField.quote_LIMIT_DOWN,											       //16       	// 跌停价
    QuoteCustomField.quote_AVERAGE_VALUE,										       //17       	// 	均价
    QuoteCustomField.quote_AMOUNT,													       //18       // 成交金额
    QuoteCustomField.quote_VOLUME_RATIO,										       //19       		// 量比
    QuoteCustomField.quote_BUY_PRICE,												       //20       // 	买一价
    QuoteCustomField.quote_SELL_PRICE	,											       //21       // 卖一价
    QuoteCustomField.quote_BUY_VOLUME	,											       //22       // 外盘量
    QuoteCustomField.quote_SELL_VOLUME,											       //23       	// 内盘量
    QuoteCustomField.quote_NET_ASSET,												       //24       // 	净资产
    QuoteCustomField.quote_STOCK_INFO	,											       //25       // 个股静态信息
    QuoteCustomField.quote_CAPITALIZATION	,									       //26       	// 总股本
    QuoteCustomField.quote_CIRCULATING_SHARES,							       //27       			// 流通股
    QuoteCustomField.quote_BUY_PRICES	,											       //28       // 五档买价
    QuoteCustomField.quote_BUY_VOLUMES,											       //29       	// 五档买量
    QuoteCustomField.quote_SELL_PRICES,											       //30       	// 五档卖价
    QuoteCustomField.quote_SELL_VOLUMES	,										       //31       	// 五档卖量
    QuoteCustomField.quote_RECEIPTS,												       //32       	// 收益
    QuoteCustomField.quote_JIA_QUAN_PING_JUN_JIA,						       //33       			// 	加权平均价
    QuoteCustomField.quote_JIA_QUAN_PING_JUN_ZHANG_DIE_BP	,	       //34       					// 加权平均涨跌BP
    QuoteCustomField.quote_ZUO_SHOU_PAN_JIA_QUAN_PING_JUN_JIA,	  //35				    	// 昨收盘加权平均价
    QuoteCustomField.quote_pe2_unit	,													     //36          // 放静态市盈率的计算因子
    QuoteCustomField.quote_GANG_GU_ZUI_XIAO_JIAO_YI_DAN_WEI		,		//37				   // 港股最小交易单位
    QuoteCustomField.quote_UP_DOWN_FLAG,													 //38           // 涨跌标识
    QuoteCustomField.quote_CHANGE,														     //39           // 涨跌
    QuoteCustomField.quote_CHANGE_RATE	,											     //40           // 涨跌幅
    QuoteCustomField.quote_TURNOVER_RATE	,										     //41           // 	换手率
    QuoteCustomField.quote_PE	,													           //42       	// 市盈
    QuoteCustomField.quote_PB	,													           //43       	// 市净率
    QuoteCustomField.quote_TOTAL_VALUE,									           //44       				// 总市值
    QuoteCustomField.quote_FLOW_VALUE	,									           //45       			// 流值
    QuoteCustomField.quote_AMPLITUDE_RATE	,							           //46       				// 振幅比率
    QuoteCustomField.quote_ORDER_RATIO,									           //47       				// 委比
    QuoteCustomField.quote_IOPV	,												           //48       		// 基金净值
    QuoteCustomField.quote_PreIOPV,											           //49       			// 基金净值参考价
    QuoteCustomField.quote_ZH	,													           //50       	// 深港通
    QuoteCustomField.quote_HH	,													           //51       	// 沪港通
    QuoteCustomField.quote_ST	,													           //52       	// 次类别
    QuoteCustomField.quote_BU	,													           //53       	// 融资
    QuoteCustomField.quote_SU	,													           //54          	// 融券
    QuoteCustomField.quote_TBU,													           //55          		// 当日可融资
    QuoteCustomField.quote_TSU,													           //56          		// 当日可融券
    QuoteCustomField.quote_RP	,													           //57          	// 回购期限
    QuoteCustomField.quote_CD	,													           //58          	// 实际占款天数
    QuoteCustomField.quote_HG	,													           //59          	// 沪股通标识
    QuoteCustomField.quote_SG	,													           //60          // 深股通标识
    QuoteCustomField.quote_FX		,												           //61          	// 风险警示标识
    QuoteCustomField.quote_TS		,												           //62          	// 退市整理标识
    QuoteCustomField.quote_VCMFlag,											           //63          			// 港股vcm标识
    QuoteCustomField.quote_CASFlag,											           //64          			// 港股cas标识
    QuoteCustomField.quote_CQCX,												           //65          			// 除权除息标识
    QuoteCustomField.quote_ZRLX,												           //66          			// 转让类型
    QuoteCustomField.quote_ZRZT,												           //67          			// 转让状态
    QuoteCustomField.quote_ZQJB,												           //68          			// 证券级别
    QuoteCustomField.quote_CRP,													           //69          		// 资金可用日期
    QuoteCustomField.quote_CDD,													           //70          		// 资金可取日期
    QuoteCustomField.quote_ETRUST_DIFF,									           //71          // 委差
    QuoteCustomField.quote_EARN_PER_SHARE,							           //72          // 每股收益
    QuoteCustomField.quote_EARN_PER_SHARE_REPORT_PERIOD,           //73         // 每股收益所属报告期	格式: YYYYQ 表示YYYY年第Q季度
    QuoteCustomField.quote_JSFZD,												           //74         // 	较上一副涨跌
    QuoteCustomField.quote_AH,													           //75         // ah股标识
    QuoteCustomField.quote_AB	,													           //76         // ab股标识
    QuoteCustomField.quote_VOTE,												           //77         // 表决权标识
    QuoteCustomField.quote_UPF	,												           //78         // 盈利标识
    QuoteCustomField.quote_DR_CURRENT_SHARE	,						           //79         // 当前份额	沪伦通
    QuoteCustomField.quote_DR_PREVIOUS_CLOSING_SHARE	,	           //80         // 	前收盘份额(上一交易日)	沪伦通
    QuoteCustomField.quote_DR_CONVERSION_BASE,					           //81          // 转换基数(用于计算溢价)	沪伦通
    QuoteCustomField.quote_DR_DEPOSITORY_INSTITUTION_CODE	,				//82			     // 存托机构代码	沪伦通
    QuoteCustomField.quote_DR_DEPOSITORY_INSTITUTION_NAME,				//83			     	// 存托机构名称	沪伦通
    QuoteCustomField.quote_DR_SUBJECT_CLOSING_REFERENCE_PRICE	,		//84			     	// 标的收盘参考价	沪伦通
    QuoteCustomField.quote_DR,															       //85    / 沪伦通标识	沪伦通
    QuoteCustomField.quote_DR_STOCKCODE,										       //86    		// 基础证券代码	沪伦通
    QuoteCustomField.quote_DR_FLOW_START_DATE	,							       //87    		// cdr初始流动性生成起始日	沪伦通
    QuoteCustomField.quote_DR_FLOW_END_DATE,								       //88    			// cdr初始流动性生成终止日	沪伦通
    QuoteCustomField.quote_DR_LISTING_DATE,									       //89    		// 上市日期(CDR或GDR)	沪伦通
    QuoteCustomField.quote_DR_STOCK_NAME,										       //90    	// 	基础证券名称	沪伦通
    QuoteCustomField.quote_DR_SECURITIES_CONVERSION_BASE,		       //91    					// 	基础证券转换基数	沪伦通
    QuoteCustomField.quote_PRESET_PRICE,										       //92    		// 期权昨结算	上证期权
    QuoteCustomField.quote_EXERCISE_WAY,										       //93    		// 行权方式	上证期权
    QuoteCustomField.quote_SUBSCRIBE_UPPER_LIMIT,						       //94    			// 	市价申报数量上限	科创板
    QuoteCustomField.quote_SUBSCRIBE_LOWER_LIMIT,						       //95    			// 	市价申报数量下限	科创板
    QuoteCustomField.quote_AFTER_HOURS_VOLUME	,							       //96    		// 盘后成交量	科创板/深交所创业板
    QuoteCustomField.quote_AFTER_HOURS_AMOUNT	,							       //97    		// 盘后成交额	科创板/深交所创业板
    QuoteCustomField.quote_AFTER_HOURS_TRANSACTION_NUMBER	,	       //98    					// 盘后成交笔数	科创板
    QuoteCustomField.quote_AFTER_HOURS_WITH_DRAW_BUY_COUNT,	       //99           // 盘后撤单买笔数	科创板
    QuoteCustomField.quote_AFTER_HOURS_WITH_DRAW_BUY_VOLUME	,			//100		    		// 盘后撤单买数量	科创板
    QuoteCustomField.quote_AFTER_HOURS_WITH_DRAW_SELL_COUNT,			//101		    			// 盘后撤单卖笔数	科创板
    QuoteCustomField.quote_AFTER_HOURS_WITH_DRAW_SELL_VOLUME,			//102		    		// 	盘后撤单卖数量	科创板
    QuoteCustomField.quote_AFTER_HOURS_BUY_VOLUME,								//103		    // 盘后委托买入总量	科创板
    QuoteCustomField.quote_AFTER_HOURS_SELL_VOLUME,						     //104             // 盘后委托卖出总量	科创板
    QuoteCustomField.quote_LONG_NAME,													     //105          // 	中文证券简称(长)
    QuoteCustomField.quote_LIMIT_PRICE_LOWER_LIMIT	,					     //106          				// 限价申报数量下限
    QuoteCustomField.quote_LIMIT_PRICE_UPPER_LIMIT,						     //107          				// 限价申报数量上限
    QuoteCustomField.quote_ISSUED_CAPITAL,										     //108          		// 注册资本
    QuoteCustomField.quote_UPDOWN_LIMIT_TYPE,									     //109          		// 	涨跌幅限制类型
    QuoteCustomField.quote_LISTINGTYPE,												     //110          	// 挂牌类型
    QuoteCustomField.quote_BUY_QTY_UPPER_LIMIT,								     //111          			// 限价买数量上限	深交所
    QuoteCustomField.quote_SELL_QTY_UPPER_LIMIT,							     //112          				// 限价卖数量上限	深交所
    QuoteCustomField.quote_MARKET_BUY_QTY_UPPER_LIMIT,				     //113          					// 市价买数量上限	深交所
    QuoteCustomField.quote_MARKET_SELL_QTY_UPPER_LIMIT,				     //114          					// 市价卖数量上限	深交所
    QuoteCustomField.quote_SECURITY_STATUS,										     //115          		// 证券状态	深交所
    QuoteCustomField.quote_BUY_SELL_AUCTION_RANGE	,						     //116          			// 买卖有效竞价范围	深交所
    QuoteCustomField.quote_AFTER_HOURS_BUY_UPPER_LIMIT,				     //117          					// 盘后定价交易买数量上限	深交所创业板
    QuoteCustomField.quote_AFTER_HOURS_SELL_UPPER_LIMIT,			     //118          						// 盘后定价交易卖数量上限	深交所创业板
    QuoteCustomField.quote_STOCK_INFO,												     //119          	// 是否是注册制(reg字段.在同一栏位,传一次quote_STOCK_INFO即可)	深交所创业板
    QuoteCustomField.quote_STOCK_INFO	,												     //120          // 是否具有协议控制架构标识(vie字段.在同一栏位,传一次quote_STOCK_INFO即可)	深交所创业板
    // QuoteCustomField.quote_MF,															     //121          // 市场化转融通标识	深交所
    // QuoteCustomField.quote_RSLF,														     //122          	// 限售股份出借标志	深交所
    // QuoteCustomField.quote_MMF,														     //123          	// 做市商标志	深交所
    QuoteCustomField.quote_PRE_DELTA,													     //124          // 	昨虚实度	期货
    QuoteCustomField.quote_CUR_DELTA,													     //125          // 	今虚实度	期货
    QuoteCustomField.quote_UPDATE_MILLISECOND	,								     //126          		// 最后修改毫秒	期货
    QuoteCustomField.quote_UNDERLYING_LAST_PRICE	,						     //127          			// 	标的现价（两位小数）	期货
    QuoteCustomField.quote_UNDERLYING_PRE_CLOSE,							     //128          				// 标的昨收（两位小数）	期货
    QuoteCustomField.quote_UNDERLYING_CHG	,										     //129          	// 标的涨跌 （两位小数）	期货
    QuoteCustomField.quote_UNDERLYING_SYMBOL	,								     //130          		// 	标的名称	期货
    QuoteCustomField.quote_UNDERLYING_TYPE,										     //131          		// 标地品种	期货
    QuoteCustomField.quote_CHANGE1	,													     //132          // 涨跌1	期货
    QuoteCustomField.quote_POS_DIFF,													     //133          	// 仓差	期货、期权
    QuoteCustomField.quote_CUR_DIFF	,													     //134          // 期现差	期货
    QuoteCustomField.quote_CALL_OR_PUT	,											     //135          	// 期权类型	期货
    QuoteCustomField.quote_EXERCISE_PRICE,										     //136          		// 行权价	期货
    QuoteCustomField.quote_PREMIUM_RATE	,											     //137          	// 溢价率(长)	期货
    QuoteCustomField.quote_REMAINING_DAYS	,										     //138          	// 剩余天数	期货
    QuoteCustomField.quote_IMPLIED_VOLATILITY,								     //139          			// 隐含波动率	期货
    QuoteCustomField.quote_RISK_FREE_INTEREST_RATE	,					     //140          				// 无风险利率	期货
    QuoteCustomField.quote_RISK_INDICATOR	,										     //141          	// 风险指标	期货
    QuoteCustomField.quote_LEVERAGE_RATIO		,									     //142          	// 杠杆比率	期货
    QuoteCustomField.quote_INTERSECTION_NUM	,									     //143          		// 交割点数	期货
    QuoteCustomField.quote_FINAL_TRADE_DATE	,									     //144          		// 期权到期日	期货
    QuoteCustomField.quote_TRADE_DAY			,										     //145          // 	交易日	期货
    QuoteCustomField.quote_SETTLEMENT_GROUP_ID,								     //146          			// 结算组代码	期货
    QuoteCustomField.quote_SETTLEMENT_ID	,								         //147                                                                                                                      	// 	结算编号	期货
    QuoteCustomField.quote_PRE_OPEN_INTEREST	,						         //148              // 	昨持仓量（无小数点）	期货
    QuoteCustomField.quote_OPT	,													         //149          	// 持仓量（0位小数）	期货
    QuoteCustomField.quote_POSITION_CHG	,									         //150          			// 日增（0位小数）	期货
    QuoteCustomField.quote_PRESENT_CLOSE,									         //151          			// 	今收盘价	期货
    QuoteCustomField.quote_SETTLEMENT	,										         //152          		// 今结算价	期货
    QuoteCustomField.quote_DELIVERY_DAY	,									         //153          			// 交割日期	期货
    // QuoteCustomField.quote_BID,												         //154          			// 委托买价和委托买量	期货
    // QuoteCustomField.quote_OFFER,											         //155          			// 	委托卖价和委托卖量	期货
    QuoteCustomField.quote_TOTAL_BID	,										         //156          		// 	委买	期货
    QuoteCustomField.quote_TOTAL_ASK,											         //157          		// 	委卖	期货
    QuoteCustomField.quote_BID_VOL,												         //158          		// 买一量	期货
    QuoteCustomField.quote_ASK_VOL,												         //159          		// 卖一量	期货
    QuoteCustomField.quote_TIME_VALUE	,										         //160          		// 时间价值	期货
    QuoteCustomField.quote_IN_VALUE	,											         //161          		// 内在价值	期货
    QuoteCustomField.quote_AVERAGE_CHG,										         //162          			// 均涨幅	板块指数
    QuoteCustomField.quote_BLOCK_CHG	,										         //163          		// 	权涨幅	板块指数
    QuoteCustomField.quote_RATIO_UP_DOWN	,								         //164          			// 	涨跌平家数	板块指数
    QuoteCustomField.quote_CLOSE_INDEX,										         //165          			// 收盘指数	板块指数
    QuoteCustomField.quote_INDEX_CHG5		,									         //166          		// 5日指数涨跌幅	板块指数
    QuoteCustomField.quote_INDEX_CHG10,										         //167          			// 10日指数涨跌幅	板块指数
    QuoteCustomField.quote_ROE		,												         //168          	// 净资产收益率
    // QuoteCustomField.quote_LAST_RECEIPTS,							         //169          					// 	每股净利润	新三板
    QuoteCustomField.quote_UNDERLYING_SECURITY	,					         //170          					// 基础证券标的券	新三板
    // QuoteCustomField.quote_SUB_BLOCK,									         //171          				// 	所属板块	新三板
    QuoteCustomField.quote_LIST_DATE,											         //172          		// 	挂牌日期	新三板
    QuoteCustomField.quote_VALUE_DATE	,										         //173          		// 起息日	新三板
    QuoteCustomField.quote_EXPIRING_DATE	,								         //174          			// 	到期日	新三板
    // QuoteCustomField.quote_BUY_QTY_UNIT	,							         //175          					// 买数量单位	新三板
    // QuoteCustomField.quote_SELL_QTY_UNIT,							         //176          					// 	卖数量单位	新三板
    QuoteCustomField.quote_MARKET_NUMBER,									         //177          			// 	做市商数量	新三板
    QuoteCustomField.quote_SERVICE_STATUS,								         //178          				// 服务状态	新三板
    QuoteCustomField.quote_SUSPENDED_SYMBOL,							         //179          					// 停牌标识	新三板
    QuoteCustomField.quote_EX_DIVIDEND_RIGHT_SYMOBL	,			         //180          						// 除权除息标识	新三板
    QuoteCustomField.quote_TRANSFER_STATUS	,							         //181          				// 转让状态	新三板
    QuoteCustomField.quote_TRANSFER_TYPE,									         //182          			// 	转让类型	新三板
    QuoteCustomField.quote_SECURITY_LEVEL,								         //183          				// 证券级别	新三板
    QuoteCustomField.quote_MARKET_MAKER_QTY	,							         //184          				// 做市商数量	北证
    QuoteCustomField.quote_ISSUE_PE	,											         //185          		// 发行市盈率	新三板
    QuoteCustomField.quote_UNRESTRICTED_SHARE_CAPITAL,		         //186          							// 非限售股本	新三板
    QuoteCustomField.quote_PAR_VALUE,											         //187          		// 	每股面值	新三板
    QuoteCustomField.quote_CONVERT_RATE,									         //188          				// 折合比例	新三板
    QuoteCustomField.quote_CVT_PRICE	,										         //189          		// 	转股价格	新三板
    QuoteCustomField.quote_CPUTTRIGGER_PRICE	,						         //190          				// 	回售触发价	新三板
    QuoteCustomField.quote_SHARE_VALUE,										         //191          			// 每股面值	北证
    QuoteCustomField.quote_REDUCED_PROPORTION		,					         //192          				// 折合比例	北证
    QuoteCustomField.quote_MONTH_CHANGE_RATE	,						         //193          				// 	本月涨跌幅	沪深市场
    QuoteCustomField.quote_YEAR_CHANGE_RATE	,							         //194          				// 本年涨跌幅	沪深市场
    QuoteCustomField.quote_RECENT_MONTH_CHANGE_RATE	,			         //195          						// 近一月涨跌幅	沪深市场
    QuoteCustomField.quote_RECENT_YEAR_CHANGE_RATE,				         //196          						// 近一年涨跌幅	沪深市场
    QuoteCustomField.quote_TTM		,												         //197          	// 滚动市盈率	沪深
    QuoteCustomField.quote_BUY_VOL1	,											         //198          		// 买一量	沪深
    QuoteCustomField.quote_SELL_VOL1,											         //199          		// 	卖一量	沪深
    QuoteCustomField.quote_LISTING_DATE	,									         //200          			// 上市日期	沪深
    QuoteCustomField.quote_CHANGERATE5,										         //201          			// 前5日涨跌幅	沪深
    QuoteCustomField.quote_CHANGERATE10	,									         //202          			// 前10日涨跌幅	沪深
    QuoteCustomField.quote_CHANGERATE20		,								         //203          			// 前20日涨跌幅	沪深市场
    QuoteCustomField.quote_TURNOVER_RATE5	,								         //204          			// 前5日换手率	沪深市场
    QuoteCustomField.quote_TURNOVER_RATE10	,							         //205          				// 前10日换手率	沪深市场
    QuoteCustomField.quote_TURNOVER_RATE20,								         //206          				// 前20日换手率	沪深市场
    QuoteCustomField.quote_LIMITUP_CHANGERATE	,						         //207          				// 沪深两市涨停板百分比	沪深市场
    QuoteCustomField.quote_LIMITDOWN_CHANGERATE	,					         //208          					// 沪深两市跌停板百分比	沪深市场
    QuoteCustomField.quote_LAST_TRADE_DATE,								         //209          				// 预估最后交易日（用于退市整理股票展示）	沪深市场
    QuoteCustomField.quote_SECT,													         //210          		// 股票证券类别	沪深港
    QuoteCustomField.quote_MATCH_LAST_PRICE	,							         //211          				// 匹配成交最新价	深圳债券
    QuoteCustomField.quote_MATCH_VOL,											         //212          		// 匹配成交成交量	深圳债券
    QuoteCustomField.quote_MATCH_AMOUNT	,									         //213          			// 匹配成交成交额	深圳债券
    QuoteCustomField.quote_TRADE_PHASE1,									         //214          				// 交易方式所处阶段	深圳债券
    QuoteCustomField.quote_TRADE_TYPE,										         //215          			// 最新价成交方式	深圳债券
    QuoteCustomField.quote_FIVE_MINUTES_CHANGERATE	,			         //216          						// 五分钟涨速
    QuoteCustomField.quote_THREE_MINUTES_CHANGERATE	,			         //217          						// 三分钟涨速
    QuoteCustomField.quote_STOCK_INFO	,										         //218          		// 货币种类 (hbzl字段.在同一栏位,传一次quote_STOCK_INFO即可)
    QuoteCustomField.quote_HIGH_PRECISION_IOPV	,					         //219          					// 高精度iopv	上海市场
    QuoteCustomField.quote_LONG_NAME,											         //220          		// 中文证券简称(长)
    QuoteCustomField.quote_TRANSACTION_NUM	,							         //221          				// 现成交笔数
    QuoteCustomField.quote_STOCK_INFO,										         //222          			 // 是否支持回转交易字段
    QuoteCustomField.quote_OPTION_BREAK_REFERFENCE_PRICE,	         //223          				// 期权熔断参考价	沪深市场
    // QuoteCustomField.quote_CHANGERATE3,                            // 224                // 前3日涨跌幅	沪深京市场
    // QuoteCustomField.quote_CHANGERATE60,                           // 225                // 前60日涨跌幅	沪深京市场
    // QuoteCustomField.quote_YESTERDAY_CHANGERATE,                   // 226                // 昨日涨跌幅	沪深京市场
    // QuoteCustomField.quote_BUY_CANCEL_COUNT,                       // 227                // ETF申购笔数	沪L2，深L1、L2
    // QuoteCustomField.quote_BUY_CANCEL_NUM,                         // 228                // ETF申购数量	沪L2，深L1、L2
    // QuoteCustomField.quote_BUY_CANCEL_AMOUNT,                      // 229                // ETF申购金额	沪L2，深证无数据
    // QuoteCustomField.quote_SELL_CANCEL_COUNT,                      // 230                // ETF赎回笔数	沪L2，深L1、L2
    // QuoteCustomField.quote_SELL_CANCEL_NUM,                        // 231                // ETF赎回数量	沪L2，深L1、L2
    // QuoteCustomField.quote_SELL_CANCEL_AMOUNT,                     // 232                // ETF赎回金额	沪L2，深证无数据
    // QuoteCustomField.quote_INDEX_TURNOVER_RATE,                    // 233                // 沪深京指数换手率
    // QuoteCustomField.quote_INDEX_TOTAL_VALUE,                      // 234                // 沪深京指数总市值
    // QuoteCustomField.quote_INDEX_TTM,                              // 235                // 沪深京指数动态市盈率
    // QuoteCustomField.quote_INDEX_PB,                               // 236                // 沪深京指数市净率

  ]
}