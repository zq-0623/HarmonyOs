import preferences from '@ohos.data.preferences';
import dataPreferences from '@ohos.data.preferences';
import { SseSDK } from 'SseCore';
// import { NetworkManager } from 'SseCore/src/main/ets/b/n4/e5';

const dataFileName = 'sseSpStore';
const TAG = 'SpUtils';
export class SpUtils {
  private static spUtils: SpUtils;
  static isc: string = "isc";
  static china_ip: string = "y";
  static readonly IP_CHINA = "china";
  static readonly IP_OTHER = "other";
  private getInfoPreferences: () => Promise<preferences.Preferences> | undefined;
  private context?:Context

  private constructor(context?: Context) {
    this.context =context
    this.getInfoPreferences = (() => {
      if (this.context) {
        let preferences: Promise<dataPreferences.Preferences> = dataPreferences.getPreferences(this.context, dataFileName);
        return preferences;
      } else {
        return undefined;
      }
    });
  }
  public static getInstance(context?: Context) {
    if (!SpUtils.spUtils) {
      SpUtils.spUtils = new SpUtils(context);
    }
    return SpUtils.spUtils;
  }
  async saveIpIsc(isc: string) {
    if (!isc) {
      isc = SpUtils.china_ip;
    }
    let cacheIsc = await this.getIpIsc();
    if (cacheIsc != isc) {
      this.getInfoPreferences()?.then(async (preferences) => {
        await preferences.put(SpUtils.isc, isc);
        preferences.flush();
        await SseSDK.permission().initIpState()
        //初始境内外状态、抛通知、重连tcp
        if (SpUtils.china_ip === isc) {
          // NetworkManager.getInstance().ipChanged(SpUtils.IP_CHINA)
        } else {
          // NetworkManager.getInstance().ipChanged(SpUtils.IP_OTHER)
        }
        //ipChanged已经处理重连tcp了
        // TCPManager.getInstance().reConnectTcp();
      }).catch((err:Error) => {
        console.error('saveIpIsc failed, err: ' + err);
      });
    }
  }

  async getIpIsc() {
    const preferences = await this.getInfoPreferences();
    let info: string = "";
    info = await preferences?.get(SpUtils.isc, "") as string;
    return info;
  }

  async getOptionLevel(optionType: string) {
    const preferences = await this.getInfoPreferences();
    let ver: string = "";
    ver = await preferences?.get(optionType, "") as string;
    return ver;
  }
}