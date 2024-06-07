/**
 * Author:qiang
 * Date:2024/5/16
 * IDEA:SseHarmonyOS
 * FileName:SaveLog
 */

// import file from '@ohos.file.fs';
// import  FeatureAbility  from '@ohos.ability.featureAbility';
// import  PermissionRequestResult  from '@kit.AbilityKit';
//
// @Entry
// @Component
// struct LogSaver {
//   @State logMessages: string[] = [];
//   private logFileName: string = 'console_log.txt';
//   private logFilePath: string = `/data/accounts/account_0/appdata/com.example.yourapp/${this.logFileName}`;
//   private fd: number = -1; // 文件描述符
//
//   build() {
//     Column() {
//       Button("Save Log to File")
//         .onClick(() => this.saveLogToFile())
//         .width('100%')
//         .height(50)
//         .backgroundColor(0xFF0000)
//         .fontSize(20)
//         .fontColor(0xFFFFFF)
//
//       Scroll() {
//         Text(this.logMessages.join('\n'))
//           .padding(10)
//           .fontSize(16)
//           .width('100%')
//       }.width('100%').height('70%')
//     }
//   }
//
//   private async saveLogToFile() {
//     try {
//       // 请求权限
//       await this.requestPermissions();
//
//       // 打开文件，如果文件不存在则创建
//       const fileHandle = await file.open(this.logFilePath, file.OpenMode.READ_WRITE | file.OpenMode.CREATE);
//       // 获取文件描述符
//       this.fd = fileHandle.fd;
//
//       // 写入日志内容到文件
//       const logContent = this.logMessages.join('\n');
//       await file.write(this.fd, logContent.toString());
//
//       console.info(`Log has been saved to ${this.logFilePath}`);
//     } catch (err) {
//       console.error(`Failed to save log: ${err}`);
//     } finally {
//       // 关闭文件
//       if (this.fd !== -1) {
//         await file.close(this.fd);
//         this.fd = -1;
//       }
//     }
//   }
//
//   // 请求权限的方法
//   private async requestPermissions() {
//     const permissions = [
//       "ohos.permission.READ_USER_STORAGE",
//       "ohos.permission.WRITE_USER_STORAGE"
//     ];
//     for (const permission of permissions) {
//       // try {
//       //   const result: PermissionRequestResult = await FeatureAbility.requestPermissionsFromUser([permission]);
//       //   if (result.authResults[0] !== FeatureAbility.PermissionState.PERMISSION_GRANTED) {
//       //     throw new Error(`Permission denied: ${permission}`);
//       //   }
//       // } catch (err) {
//       //   throw new Error(`Failed to request permission: ${err}`);
//       // }
//     }
//   }
//
//   // 模拟捕获控制台日志并添加到 logMessages 数组中
//   private captureConsoleLog(message: string) {
//     this.logMessages.push(message);
//   }
//
//   async aboutToAppear() {
//     // 模拟捕获一些控制台日志
//     this.captureConsoleLog("Application started");
//     this.captureConsoleLog("First log message");
//     this.captureConsoleLog("Second log message");
//   }
// }

