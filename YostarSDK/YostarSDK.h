//
//  YostarSDK.h
//  YostarSDK
//  V2.1.66
//  Created by Yostar on 2018/7/12.
//

#import <Foundation/Foundation.h>
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif

extern void SDKInit(const char *strURL, const char *strPayStoreID, bool bIsShowDebugLog);
///实名认证
extern void SDKCert(void);
extern int UpdateUnityToken(const char *token ,const char *uid);
// 继承码登录时 param -- > transcode; param2 --> uid
// yostar登录时 param -- > strEmail; param2 --> strVerificationCode
extern void SDKLogin(int platform, const char *param, const char *param2, bool bIsCreateNewAccount);
extern void SDKLink(int platform, const char *strEmail, const char *strVerificationCode);
extern void SDKUnlink(int platform, const char *strEmail, const char *strVerificationCode);
///除GooglePlayGames解绑的其他第三方账号解绑时
///如果code返回PLAY_GAME_ACCOUNT_UNLNK_WARN
///可调用ConfirmUnLinkGooglePlayGame强制解绑；
extern void SDKConfirmUnLinkGooglePlayGame(void);
extern void SDKTranscodeReq(void);
extern void SDKSetBirth(const char *strBirth);
extern char *SDKGetDeviceID(void);
extern char *SDKGetFirebaseToken(void);
extern void SDKBuy(const char *productId, const char *serverTag, const char *extraData);
// 新增重复支付验证
extern void SDKReconfirmOrderAPI(void);
// 查询支付账号对应商品的货币价格
extern void QuerySkuDetails(const char *skus);
extern const char * QueryRemoteConfig(const char *configKey);
extern void SDKUserEventUpload(const char *strEventName, const char *strJsonCallbackParameter);
extern void SystemShare(const char *strShareText, Byte *imgData, int nSize);
extern void RequestStoreReview(void);
extern void SDKClearAccount(void);
extern void SDKNewAccountLink(void);
extern void QuickLogin(void);
// account -- > strEmail; strVerificationCode --> strVerificationCode
extern void SDKAccountRegister(const char *account, const char *strVerificationCode);
extern void SDKRegsitLink(const char *strEmail, const char *strVerificationCode);
extern void SDKVerificationCodeReq(const char *strEmail);


//AIHelp
/**
 更新AIHelp中用户信息并打开对话框
 */
extern void ShowAiHelpFAQs(const char *sdkVersion,const char *serverId,const char *roleUid, const char *roleName,const char *roleCreateTime,int purchase,const char *tags);
/**
 更新AIHelp中用户信息
 */

extern void UpdateUserTag(const char *roleUid, const char *roleName,const char *tags);
// 新增获取屏幕安全区域
extern void GetSafeAreaImpl(float *x, float *y, float *w, float *h);
// 删除账号
extern void SDKDeleteAccount(void);
// 恢复账号
extern void SDKRebornAccount(void);

//返回协议的URL地址
extern const char *SDKGetAgreement(void);
//同意协议
extern void SDKConifrmAgreement(void);
// 返回协议内容信息
extern void SDKGetAgreementInfo(void);

// 返回其他协议信息
extern void SDKGetShopAgreementInfo(const char *q);

// 返回未成年人商店退款协议信息
extern void SDKGetUnderAgeAgrement(void);
// 确认未成年人商店退款协议信息
extern void SDKConifrmShopAgreement(void);

// SDKServerToServer
extern void SDKServerToServer(const char *devToken, const char *linkID, const char *appEventName, const char *priceValue, const char *currencyCode);

// 系统剪切板
extern int SDKToClipboard(const char *cValue);
/**
 问卷调查
 @param activityID 问卷ID
 @param gameUID 游戏中用户的ID
 @param gameNotifyURL 游戏通知地址
 */
extern void ShowSurvey(const char *activityID, const char *gameUID, const char *gameNotifyURL);

// 判断系统版本是否大于iOS 13
extern bool SDKSystemVerAvailable(void);

// 获取当前UID和token
extern const char *SDKGetUID(void);
extern const char *SDKGetAccessToken(void);

// 获取ErrorCode
extern const char *SDKGetErrorCode(int code);

// ************* 废弃 ******************
extern void SDKValidateAccount(const char *strVerificationCode);
extern void SDKResetAccountPW(const char *strAccount, const char *strNewPW, const char *strVerificationCode);
// ************* end ******************
typedef void(^YostarSDKCallBack)(NSString *result);


@protocol YostarPushDelegate <NSObject>
@optional
- (void)yoStarUserNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler API_AVAILABLE(ios(10.0));
- (void)yoStarUserNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler
API_AVAILABLE(ios(10.0));

@end


@interface YostarSDK : NSObject
@property (nonatomic, weak) id <YostarPushDelegate> pushDelegate;
@property (nonatomic, copy) NSString *baseURL;
@property (nonatomic, copy) NSString *payStoreId;
@property (nonatomic, copy) NSString *twKey;
@property (nonatomic, copy) NSString *twSecret;
@property (nonatomic, copy) NSString *twClientID;
/**
 YES 发起客诉，进入机器人客服界面，点击【人工客服】，进入人工客服界面
 NO 发起客诉，进入FAQ页面，点击【人工客服】，进入人工客服界面
 */
@property (nonatomic, assign) BOOL aihelpModel;

@property (nonatomic, copy) YostarSDKCallBack SDKCallBack;
// 管理单例
+ (instancetype)yostarShareton;
- (void)registerPushDelegate:(id)delegate;
- (void)callBackUnity:(id)result;
@end
