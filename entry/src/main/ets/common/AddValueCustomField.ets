/**
 * Author:qiang
 * Date:2024/4/9
 * IDEA:SseHarmonyOS
 */
import { AddValueCustomField } from 'SseCore'
export class addValue {
  static readonly addValueColumns :number[] = [
    // AddValueCustomField.ALL_COLUMN,                                                   // 1         // 所有栏位
    AddValueCustomField.addValue_CODE,                                                // 2         // 证券代码
    AddValueCustomField.addValue_DATE,
    AddValueCustomField.addValue_TIME,
    AddValueCustomField.addValue_ULTRALARGEBUYVOLUME,                                 // 3         // 超大单主动买入成交量
    AddValueCustomField.addValue_ULTRALARGESELLVOLUME,                                // 4         // 超大单主动卖出成交量
    AddValueCustomField.addValue_ULTRALARGEBUYAMOUNT,                                 // 5         // 超大单主动买入成交额
    AddValueCustomField.addValue_ULTRALARGESELLAMOUNT,                                // 6         // 超大单主动卖出成交额
    AddValueCustomField.addValue_LARGEBUYVOLUME,                                      // 7         // 大单主动买入成交量
    AddValueCustomField.addValue_LARGESELLVOLUME,                                     // 8         // 大单主动卖出成交量
    AddValueCustomField.addValue_LARGEBUYAMOUNT,                                      // 9         // 大单主动买入成交额
    AddValueCustomField.addValue_LARGESELLAMOUNT,                                     // 10         // 大单主动卖出成交额
    AddValueCustomField.addValue_MEDIUMBUYVOLUME,                                     // 11         // 中单主动买入成交量
    AddValueCustomField.addValue_MEDIUMSELLVOLUME,                                    // 12         // 中单主动卖出成交量
    AddValueCustomField.addValue_MEDIUMBUYAMOUNT,                                     // 13         // 中单主动买入成交额
    AddValueCustomField.addValue_MEDIUMSELLAMOUNT,                                    // 14         // 中单主动卖出成交额
    AddValueCustomField.addValue_SMALLBUYVOLUME,                                      // 15         // 小单主动买入成交量
    AddValueCustomField.addValue_SMALLSELLVOLUME,                                     // 16         // 小单主动卖出成交量
    AddValueCustomField.addValue_SMALLBUYAMOUNT,                                      // 17         // 小单主动买入成交额
    AddValueCustomField.addValue_SMALLSELLAMOUNT,                                     // 18         // 小单主动卖出成交额
    AddValueCustomField.addValue_ULTRALARGENETINFLOW,                                 // 19         // 超大单净流入
    AddValueCustomField.addValue_ULTRALARGENETINFLOW,                                 // 20         // 超大单净流入超大单净流入
    AddValueCustomField.addValue_LARGENETINFLOW,	                                    // 21         // 大单净流入
    AddValueCustomField.addValue_MEDIUMNETINFLOW,	                                    // 22         // 中单净流入
    AddValueCustomField.addValue_SMALLNETINFLOW,	                                    // 23         // 小单净流入
    AddValueCustomField.addValue_FUNDSINFLOW,	                                        // 24         // 主力资金流入
    AddValueCustomField.addValue_FUNDSOUTFLOW,	                                      // 25         // 主力资金流出
    AddValueCustomField.addValue_ULTRALARGEDIFFER,	                                  // 26         // 超大单差
    AddValueCustomField.addValue_LARGEDIFFER,	                                        // 27         // 大单差
    AddValueCustomField.addValue_MEDIUMDIFFER,	                                      // 28         // 中单差
    AddValueCustomField.addValue_SMALLDIFFER,	                                        // 29         // 小单差
    AddValueCustomField.addValue_LARGEBUYDEALCOUNT,	                                  // 30         // 每单大买单成交手数（超大单+大单）
    AddValueCustomField.addValue_LARGESELLDEALCOUNT,	                                // 31         // 每单大卖单成交手数（超大单+大单）
    AddValueCustomField.addValue_DEALCOUNTMOVINGAVERAGE,	                            // 32         // 每单成交手数移动平均值
    AddValueCustomField.addValue_BUYCOUNT,	                                          // 33         // 买入单数
    AddValueCustomField.addValue_SELLCOUNT,	                                          // 34         // 卖出单数
    AddValueCustomField.addValue_BBD,	                                                // 35         // 大单净差
    AddValueCustomField.addValue_BBD5,	                                              // 36         // 五日大单净差
    AddValueCustomField.addValue_BBD10,                                               // 37         // 十日大单净差
    AddValueCustomField.addValue_DDX,	                                                // 38         // 主力动向
    AddValueCustomField.addValue_DDX5,	                                              // 39         // 五日主力动向
    AddValueCustomField.addValue_DDX10,                                               // 40         // 十日主力动向
    AddValueCustomField.addValue_DDY,	                                                // 41         // 涨跌动向
    AddValueCustomField.addValue_DDY5,	                                              // 42         // 五日涨跌动向
    AddValueCustomField.addValue_DDY10,	                                              // 43         // 十日涨跌动向
    AddValueCustomField.addValue_DDZ,	                                                // 44         // 大单差分
    AddValueCustomField.addValue_RATIOBS,                                             // 45         //	单数比
    AddValueCustomField.addValue_OTHERSFUNDSINFLOW,	                                  // 46         // 散户资金流入
    AddValueCustomField.addValue_OTHERSFUNDSOUTFLOW,                                  // 47         // 散户资金流出
    AddValueCustomField.addValue_NET_CAPITAL_INFLOW,                                  // 48         // 主力资金净流入
    AddValueCustomField.addValue_FIVE_MINUTES_CHANGERATE,	                            // 49         //五分钟涨跌幅
    AddValueCustomField.addValue_DATES,	                                              // 50         // 当日与五日日期
    AddValueCustomField.addValue_LARGEORDERNUMB,	                                    // 51         // 超大单买入单数
    AddValueCustomField.addValue_LARGEORDERNUMS,	                                    // 52         // 超大单卖出单数
    AddValueCustomField.addValue_BIGORDERNUMB,	                                      // 53         // 大单买入单数
    AddValueCustomField.addValue_BIGORDERNUMS,	                                      // 54         // 大单卖出单数
    AddValueCustomField.addValue_MIDORDERNUMB,	                                      // 55         // 中单买入单数
    AddValueCustomField.addValue_MIDORDERNUMS,	                                      // 56         // 单卖出单数
    AddValueCustomField.addValue_SMALLORDERNUMB,                                      // 57         // 小单买入单数
    AddValueCustomField.addValue_SMALLORDERNUMS,                                      // 58         // 小单卖出单数
    AddValueCustomField.addValue_MAINFORCEMONEYNETINFLOW5,	                          // 59         // 5日主力资金净流入
    AddValueCustomField.addValue_MAINFORCEMONEYNETINFLOW10,	                          // 60         // 10日主力资金净流入
    AddValueCustomField.addValue_MAINFORCEMONEYNETINFLOW20,	                          // 61         // 20日主力资金净流入
    AddValueCustomField.addValue_RATIOMAINFORCEMONEYNETINFLOW5,	                      // 62         // 5日主力资金净流入占比
    AddValueCustomField.addValue_RATIOMAINFORCEMONEYNETINFLOW10,                      // 63         // 10日主力资金净流入占比
    AddValueCustomField.addValue_RATIOMAINFORCEMONEYNETINFLOW20,                      // 64         // 20日主力资金净流入占比
    AddValueCustomField.addValue_LARGEINFLOW,	                                        // 65         // 超大单流入
    AddValueCustomField.addValue_BIGINFLOW,	                                          // 66         // 大单流入
    AddValueCustomField.addValue_MEDIUMINFLOW,	                                      // 67         // 中单流入
    AddValueCustomField.addValue_SMALLINFLOW,	                                        // 68         // 小单流入
    AddValueCustomField.addValue_LARGEOUTFLOW,	                                      // 69         // 超大单流出
    AddValueCustomField.addValue_BIGOUTFLOW,	                                        // 70         // 大单流出
    AddValueCustomField.addValue_MEDIUMOUTFLOW,	                                      // 71         // 中单流出
    AddValueCustomField.addValue_SMALLOUTFLOW,	                                      // 72         // 小单流出
  ]
}

