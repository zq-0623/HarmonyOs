/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the  Eclipse Public License -v 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.eclipse.org/legal/epl-2.0/
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {MqttAsync,MqttClientOptions,MqttConnectOptions,MqttSubscribeOptions,MqttPublishOptions,MqttResponse,MqttMessage,MqttClient,MqttQos,MqttPersistenceType} from '@ohos/mqtt';
import LogUtil from './utils/LogUtil';
import TimeUtil from './utils/TimeUtil';
const TAG = 'mqttasync';

@Entry
@Component
struct EmqxPage {
  @State arr: string[] = [];
  private mqttAsyncClient: MqttClient | null = null;
  scroller: Scroller = new Scroller();
  //  Set Client Configuration
  @State topic: string = 'Broker';
  @State topic1: string = 'Broker1';
  @State topic2: string = 'Broker2';
  @State payload: string = 'hello world';
  @State url: string = 'broker.emqx.io';
  @State clientId: string = '8083';
  @State userName: string = "";
  @State password: string = "";
  @State connectedCount: number = 0;
  @State isConnect: boolean = false;
  @State isPromise: boolean = false;

  build() {
    Column() {
      Text($r('app.string.entry_MainAbility')).fontSize(50).fontWeight(FontWeight.Bold).margin(10)
      Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween }) {
        Button() {
          Text('使用promise接口').fontSize($r("app.float.font_20")).fontWeight(FontWeight.Bold).fontColor($r("app.color.white")).maxLines(1).textAlign(TextAlign.Center)
        }.backgroundColor($r("app.color.blue_1677ff")).width("100%").margin({ right: 8 }).onClick(() => {
          this.setIsPromise(this.isPromise)
        })
      }.margin(10)

      Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween }) {
        Button() {
          Text('CreateClient').fontSize($r("app.float.font_20")).fontWeight(FontWeight.Bold).fontColor($r("app.color.white")).maxLines(1).textAlign(TextAlign.Center)
        }
        .backgroundColor($r("app.color.blue_1677ff")).width("100%").margin({ right: 8 })
        .onClick(() => {
          this.createClient()
        })

        Button() {
          Text('Connect').fontSize($r("app.float.font_20")).fontWeight(FontWeight.Bold).fontColor($r("app.color.white")).maxLines(1).textAlign(TextAlign.Center)
        }.backgroundColor($r("app.color.blue_1677ff")).width("100%")
        .onClick(() => {
          this.connect()
        })
      }.margin(10)

      Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceAround }) {
        Button() {
          Text('Subscribe').fontSize($r("app.float.font_20")).fontWeight(FontWeight.Bold).fontColor($r("app.color.white")).maxLines(1).textAlign(TextAlign.Center)
        }.backgroundColor($r("app.color.blue_1677ff")).width("100%").margin({ right: 8 })
        .onClick(() => {
          this.subscribe()
        })

        Button() {
          Text('SubscribeMany').fontSize($r("app.float.font_20")).fontWeight(FontWeight.Bold).fontColor($r("app.color.white")).maxLines(1).textAlign(TextAlign.Center)
        }.backgroundColor($r("app.color.blue_1677ff")).width("100%")
        .onClick(() => {
          this.subscribeMany()
        })
      }.margin(10)

      Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceAround }) {
        Button() {
          Text('Publish').fontSize($r("app.float.font_20")).fontWeight(FontWeight.Bold).fontColor($r("app.color.white")).maxLines(1).textAlign(TextAlign.Center)
        }.backgroundColor($r("app.color.blue_1677ff")).width("100%").margin({ right: 8 })
        .onClick(() => {
          this.publish()
        })

        Button() {
          Text('UnsubscribeMany')
            .fontSize($r("app.float.font_20"))
            .fontWeight(FontWeight.Bold)
            .fontColor($r("app.color.white"))
            .maxLines(1)
            .textAlign(TextAlign.Center)
        }
        .backgroundColor($r("app.color.blue_1677ff"))
        .width("100%")
        .onClick(() => {
          this.unsubscribeMany()
        })
      }.margin(10)

      Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceAround }) {
        Button() {
          Text('MessageArrived')
            .fontSize($r("app.float.font_20"))
            .fontWeight(FontWeight.Bold)
            .fontColor($r("app.color.white"))
            .maxLines(1)
            .textAlign(TextAlign.Center)
        }
        .backgroundColor($r("app.color.blue_1677ff"))
        .width("100%")
        .margin({ right: 8 })
        .onClick(() => {
          this.messageArrived()
        })

        Button() {
          Text('Unsubscribe')
            .fontSize($r("app.float.font_20"))
            .fontWeight(FontWeight.Bold)
            .fontColor($r("app.color.white"))
            .maxLines(1)
            .textAlign(TextAlign.Center)
        }
        .backgroundColor($r("app.color.blue_1677ff"))
        .width("100%")
        .onClick(() => {
          this.unsubscribe()
        })
      }.margin(10)

      Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceAround }) {
        Button() {
          Text('Disconnect')
            .fontSize($r("app.float.font_20"))
            .fontWeight(FontWeight.Bold)
            .fontColor($r("app.color.white"))
            .maxLines(1)
            .textAlign(TextAlign.Center)
        }
        .backgroundColor($r("app.color.blue_1677ff"))
        .width("100%")
        .margin({ right: 8 })
        .onClick(() => {
          this.disconnect()
        })

        Button() {
          Text('Destroy')
            .fontSize($r("app.float.font_20"))
            .fontWeight(FontWeight.Bold)
            .fontColor($r("app.color.white"))
            .maxLines(1)
            .textAlign(TextAlign.Center)
        }
        .backgroundColor($r("app.color.blue_1677ff"))
        .width("100%")
        .onClick(() => {
          this.destroy()
        })
      }.margin(10)

      Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceAround }) {
        Button() {
          Text('IsConnected')
            .fontSize($r("app.float.font_20"))
            .fontWeight(FontWeight.Bold)
            .fontColor($r("app.color.white"))
            .width("100%")
            .maxLines(1)
            .textAlign(TextAlign.Center)
        }
        .backgroundColor($r("app.color.blue_1677ff"))
        .width("100%")
        .margin({ right: 8 })
        .onClick(() => {
          if (!this.mqttAsyncClient) {
            this.showLog("client is not created");
            return;
          }
          this.isConnected()
        })

        Button() {
          Text('Reconnect')
            .fontSize($r("app.float.font_20"))
            .fontWeight(FontWeight.Bold)
            .fontColor($r("app.color.white"))
            .width("100%")
            .maxLines(1)
            .textAlign(TextAlign.Center)
        }
        .backgroundColor($r("app.color.blue_1677ff"))
        .width("100%")
        .onClick(() => {
          this.reconnect()
        })
      }.margin(10)

      Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceAround }) {
        Button() {
          Text('ConnectLost')
            .fontSize($r("app.float.font_20"))
            .fontWeight(FontWeight.Bold)
            .fontColor($r("app.color.white"))
            .width("100%")
            .maxLines(1)
            .textAlign(TextAlign.Center)
        }
        .backgroundColor($r("app.color.blue_1677ff"))
        .width("100%")
        .margin({ right: 8 })
        .onClick(() => {
          this.connectLost()
        })

        Button() {
          Text('Clear')
            .fontSize($r("app.float.font_20"))
            .fontWeight(FontWeight.Bold)
            .fontColor($r("app.color.white"))
            .maxLines(1)
            .textAlign(TextAlign.Center)
        }
        .backgroundColor($r("app.color.blue_1677ff"))
        .width("100%")
        .onClick(() => {
          this.clear()
        })
      }.margin(10)

      Scroll(this.scroller) {
        Column({ space: 8 }) {
          ForEach(this.arr, (item: string) => {
            Text(item).fontSize($r("app.float.font_18"))
          }, (item: string) => item)
        }
        .alignItems(HorizontalAlign.Start)
        .width("100%")
        .padding(10)
      }
      .width("100%")
      .height("45%")
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.On)
      .padding(16)
      .align(Alignment.TopStart)
    }.width("100%").height("100%")
  }

  showLog(info: string) {
    let time = TimeUtil.currentTimeStamp();
    this.arr.push(time + " | " + info);
    this.scroller.scrollEdge(Edge.Bottom);
  }

  createClient(): undefined | void {
    this.showLog("create client");
    if (this.mqttAsyncClient) {
      this.showLog("client is created");
      return;
    }
    this.mqttAsyncClient = MqttAsync.createMqtt({
      url: this.url,
      clientId: this.clientId,
      persistenceType: 1,
    });
    if (!this.mqttAsyncClient) {
      this.showLog("create client failed");
      return;
    }
    this.messageArrived()
    this.connectLost()
    this.mqttAsyncClient.setMqttTrace(6);
    this.showLog("create client success");
  }

  async connect(): Promise<undefined | void> {
    LogUtil.info(TAG, "connect");
    this.showLog("connect");
    let options: MqttConnectOptions = {
      userName: this.userName,
      password: this.password,
      connectTimeout: 300
    };
    if (this.mqttAsyncClient == null) {
      this.showLog("client not created");
      return;
    }
    if (!(await this.isConnected())) {
      if (this.isPromise) {
        this.mqttAsyncClient.connect(options).then((data: MqttResponse) => {
          LogUtil.info(TAG, "connect result:" + JSON.stringify(data));
          this.showLog(JSON.stringify(data.message));
          this.connectedCount++;
        }).catch((data: MqttResponse) => {
          LogUtil.info(TAG, "connect fail result:" + JSON.stringify(data));
          this.showLog(JSON.stringify(data.message));
        })
      } else {
        this.mqttAsyncClient.connect(options, (err: Error, data: MqttResponse) => {
          if (!err) {
            LogUtil.info(TAG, "connect result:" + JSON.stringify(data));
            this.showLog(data.message);
            if (data.message == "Connect Success") {
              LogUtil.info(TAG, "connect result connectedCount:");
              this.connectedCount++;
            }
          } else {
            this.showLog("connect error");
            this.showLog(JSON.stringify(err));
            LogUtil.info(TAG, "connect error:" + JSON.stringify(err));
          }
        });
      }
    }
  }

  async publish(): Promise<undefined | void> {
    LogUtil.info(TAG, "publish");
    this.showLog("publish");
    let binary : Uint8Array = new Uint8Array([97, 98 ,99, 100])

    let publishOption: MqttPublishOptions = {
      topic: this.topic1,
      qos: 1,
      // payload: this.payload
      payloadBinary : binary.buffer
    }
    if (this.mqttAsyncClient == null) {
      this.showLog("client not created");
      return;
    }
    if (await this.isConnected()) {
      if (this.isPromise) {
        this.mqttAsyncClient.publish(publishOption).then((data: MqttResponse) => {
          LogUtil.info(TAG, "publish success result:" + JSON.stringify(data));
          this.showLog(data.message);
        }).catch((err: MqttResponse) => {
          LogUtil.info(TAG, "publish fail result:" + JSON.stringify(err));
          this.showLog(err.message);
        })
      } else {
        this.mqttAsyncClient.publish(publishOption, (err: Error, data: MqttResponse) => {
          LogUtil.info(TAG, "publish response:");
          if (!err) {
            this.showLog(data.message);
            LogUtil.info(TAG, "publish result:" + JSON.stringify(data));
          } else {
            this.showLog("publish error");
            this.showLog(JSON.stringify(err));
            LogUtil.info(TAG, "publish error:" + JSON.stringify(err));
          }
        });
      }
    }
  }

  async subscribe(): Promise<undefined | void> {
    LogUtil.info(TAG, "subscribe");
    this.showLog("subscribe");
    let subscribeOption: MqttSubscribeOptions = {
      topic: this.topic,
      qos: 2
    }
    if (this.mqttAsyncClient == null) {
      this.showLog("client not created");
      return;
    }
    if (await this.isConnected()) {
      if (this.isPromise) {
        this.mqttAsyncClient.subscribe(subscribeOption).then((data: MqttResponse) => {
          LogUtil.info(TAG, "subscribe success result:" + JSON.stringify(data));
          this.showLog(data.message);
        }).catch((err: MqttResponse) => {
          LogUtil.info(TAG, "subscribe fail result:" + JSON.stringify(err));
          this.showLog(err.message);
        })
      } else {
        this.mqttAsyncClient.subscribe(subscribeOption, (err: Error, data: MqttResponse) => {
          if (!err) {
            this.showLog(data.message);
            LogUtil.info(TAG, "subscribe result:" + JSON.stringify(data));
          } else {
            this.showLog("subscribe error");
            this.showLog(JSON.stringify(err));
            LogUtil.info(TAG, "subscribe error:" + JSON.stringify(err));
          }
        });
      }
    }
  }

  async subscribeMany(): Promise<undefined | void> {
    LogUtil.info(TAG, "subscribeMany");
    this.showLog("subscribeMany");
    let subscribeOption: MqttSubscribeOptions = {
      topic: this.topic,
      qos: 2
    }
    let subscribeOption1: MqttSubscribeOptions = {
      topic: this.topic1,
      qos: 2
    }
    let subscribeOption2: MqttSubscribeOptions = {
      topic: this.topic2,
      qos: 2
    }
    if (this.mqttAsyncClient == null) {
      this.showLog("client not created");
      return;
    }
    if (await this.isConnected()) {
      if (this.isPromise) {
        this.mqttAsyncClient.subscribeMany([subscribeOption, subscribeOption1, subscribeOption2]).then((data: MqttResponse) => {
          LogUtil.info(TAG, "subscribeMany success result:" + JSON.stringify(data));
          this.showLog(data.message);
        }).catch((err: MqttResponse) => {
          LogUtil.info(TAG, "subscribeMany fail result:" + JSON.stringify(err));
          this.showLog(err.message);
        })
      } else {
        this.mqttAsyncClient.subscribeMany([subscribeOption, subscribeOption1, subscribeOption2], (err: Error, data: MqttResponse) => {
          if (!err) {
            this.showLog(data.message);
            LogUtil.info(TAG, "subscribeMany result:" + JSON.stringify(data));
          } else {
            this.showLog("subscribeMany error");
            this.showLog(JSON.stringify(err));
            LogUtil.info(TAG, "subscribeMany error:" + JSON.stringify(err));
          }
        });
      }
    }
  }

  messageArrived(): undefined | void {
    LogUtil.info(TAG, "messageArrived");
    this.showLog("messageArrived");
    if (this.mqttAsyncClient == null) {
      this.showLog("client not created");
      return;
    }
    this.mqttAsyncClient.messageArrived((err: Error, data: MqttMessage) => {
      if (!err) {
        let msg = "messageArrived topic:" + data.topic + ", msg:" + data.payload;
        this.showLog(msg);

        let tmp : Uint8Array = new Uint8Array(data.payloadBinary)
        this.showLog("msg Uint8Array:" + tmp.toString())

        LogUtil.info(TAG, "messageArrived message:" + JSON.stringify(data));
      } else {
        this.showLog("messageArrived error");
        this.showLog(JSON.stringify(err));
        LogUtil.info(TAG, "messageArrived error:" + JSON.stringify(err));
      }
    });
  }

  async unsubscribe(): Promise<undefined | void> {
    LogUtil.info(TAG, "unsubscribe");
    this.showLog("unsubscribe");
    let subscribeOption: MqttSubscribeOptions = {
      topic: this.topic,
      qos: 2
    }
    if (this.mqttAsyncClient == null) {
      this.showLog("client not created");
      return;
    }
    if (await this.isConnected()) {
      if (this.isPromise) {
        this.mqttAsyncClient.unsubscribe(subscribeOption).then((data: MqttResponse) => {
          LogUtil.info(TAG, "unsubscribe success result:" + JSON.stringify(data));
          this.showLog(data.message);
        }).catch((err: MqttResponse) => {
          LogUtil.info(TAG, "unsubscribe fail result:" + JSON.stringify(err));
          this.showLog(err.message);
        })
      } else {
        this.mqttAsyncClient.unsubscribe(subscribeOption, (err: Error, data: MqttResponse) => {
          if (!err) {
            this.showLog(data.message);
            LogUtil.info(TAG, "unsubscribe result:" + JSON.stringify(data));
          } else {
            this.showLog("unsubscribe error");
            this.showLog(JSON.stringify(err));
            LogUtil.info(TAG, "unsubscribe error:" + JSON.stringify(err));
          }
        });
      }
    }
  }

  async unsubscribeMany(): Promise<undefined | void> {
    LogUtil.info(TAG, "unsubscribeMany");
    this.showLog("unsubscribeMany");
    let subscribeOption: MqttSubscribeOptions = {
      topic: this.topic,
      qos: 2
    }
    let subscribeOption1: MqttSubscribeOptions = {
      topic: this.topic1,
      qos: 2
    }
    let subscribeOption2: MqttSubscribeOptions = {
      topic: this.topic2,
      qos: 2
    }
    if (this.mqttAsyncClient == null) {
      this.showLog("client not created");
      return;
    }
    if (await this.isConnected()) {
      if (this.isPromise) {
        this.mqttAsyncClient.unsubscribeMany([subscribeOption, subscribeOption1, subscribeOption2]).then((data: MqttResponse) => {
          LogUtil.info(TAG, "unsubscribeMany success result:" + JSON.stringify(data));
          this.showLog(data.message);
        }).catch((err: MqttResponse) => {
          LogUtil.info(TAG, "unsubscribeMany fail result:" + JSON.stringify(err));
          this.showLog(err.message);
        })
      } else {
        this.mqttAsyncClient.unsubscribeMany([subscribeOption, subscribeOption1, subscribeOption2], (err: Error, data: MqttResponse) => {
          if (!err) {
            this.showLog(data.message);
            LogUtil.info(TAG, "unsubscribeMany result:" + JSON.stringify(data));
          } else {
            this.showLog("unsubscribeMany error");
            this.showLog(JSON.stringify(err));
            LogUtil.info(TAG, "unsubscribeMany error:" + JSON.stringify(err));
          }
        });
      }
    }
  }

  async disconnect(): Promise<undefined | void> {
    LogUtil.info(TAG, "disconnect");
    this.showLog("disconnect");
    if (this.mqttAsyncClient == null) {
      this.showLog("client not created");
      return;
    }
    if (await this.isConnected()) {
      if (this.isPromise) {
        this.mqttAsyncClient.disconnect().then((data: MqttResponse) => {
          LogUtil.info(TAG, "disconnect success result:" + JSON.stringify(data));
          this.showLog(data.message);
        }).catch((err: MqttResponse) => {
          LogUtil.info(TAG, "disconnect fail result:" + JSON.stringify(err));
          this.showLog(err.message);
        })
      } else {
        this.mqttAsyncClient.disconnect((err: Error, data: MqttResponse) => {
          if (!err) {
            this.showLog(data.message);
            LogUtil.info(TAG, "disconnect result:" + JSON.stringify(data));
          } else {
            this.showLog("disconnect error");
            this.showLog(JSON.stringify(err));
            LogUtil.info(TAG, "disconnect error:" + JSON.stringify(err));
          }
        });
      }
    }
  }

  async isConnected(): Promise<undefined | boolean> {
    LogUtil.info(TAG, "isConnected");
    this.showLog("isConnected");
    if (this.mqttAsyncClient == null) {
      this.showLog("client not created");
      return;
    }
    return this.mqttAsyncClient.isConnected().then((data: boolean) => {
      this.showLog("isConnected " + data);
      LogUtil.info(TAG, "isConnected result:" + data);
      if (!data) {
        this.showLog("client not connect");
      }
      return data;
    })
  }

  async reconnect(): Promise<undefined | void> {
    LogUtil.info(TAG, "reconnect");
    this.showLog("reconnect");
    if (this.mqttAsyncClient == null) {
      this.showLog("client not created");
      return;
    }
    if (!(await this.isConnected())) {
      if (this.connectedCount == 0) {
        this.showLog("reconnect: client previously not connected");
        LogUtil.info(TAG, "reconnect: client previously not connected");
        return;
      }
      this.mqttAsyncClient.reconnect().then((data: boolean) => {
        this.showLog("reConnected " + data);
        LogUtil.info(TAG, "reConnected result:" + data);
      });
    }
  }

  connectLost(): undefined | void {
    LogUtil.info(TAG, "connectLost");
    this.showLog("connectLost");
    if (this.mqttAsyncClient == null) {
      this.showLog("client not created");
      return;
    }
    this.mqttAsyncClient.connectLost((err: Error, data: MqttResponse) => {
      if (!err) {
        this.showLog(data.message);
        this.reconnect();
        LogUtil.info(TAG, "connect lost cause:" + JSON.stringify(data));
      } else {
        this.showLog("connect lost error");
        this.showLog(JSON.stringify(err));
        LogUtil.info(TAG, "connect lost error:" + JSON.stringify(err));
      }
    });
  }

  async destroy(): Promise<undefined | void> {
    LogUtil.info(TAG, "destroy");
    this.showLog("destroy client");
    if (this.mqttAsyncClient == null) {
      this.showLog("client not created");
      return;
    }
    this.mqttAsyncClient.destroy().then((data: boolean) => {
      this.showLog("destroy " + data);
      LogUtil.info(TAG, "destroy result:" + data);
      this.mqttAsyncClient = null;
      this.connectedCount = 0;
    });
  }

  clear(): void {
    this.arr = [];
  }

  setIsPromise(isPromise: boolean): void {
    this.isPromise = !isPromise
    this.showLog("setIsPromise： " + this.isPromise);
    LogUtil.info(TAG, "setIsPromise result:" + this.isPromise);
  }
}