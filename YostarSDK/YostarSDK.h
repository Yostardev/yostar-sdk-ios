//
//  YostarSDK.h
//  YostarSDK
//  V2.1.6
//  Created by Yostar on 2018/7/12.
//

#import <Foundation/Foundation.h>

extern void SDKInit(const char *strURL, const char *strPayStoreID, bool bIsShowDebugLog);
extern int UpdateUnityToken(const char *token ,const char *uid);
// 继承码登录时 param -- > transcode; param2 --> uid
// yostar登录时 param -- > strEmail; param2 --> strVerificationCode
extern void SDKLogin(int platform, const char *param, const char *param2, bool bIsCreateNewAccount);
extern void SDKLink(int platform, const char *strEmail, const char *strVerificationCode);
extern void SDKUnlink(int platform, const char *strEmail, const char *strVerificationCode);
extern void SDKTranscodeReq();
extern void SDKSetBirth(const char *strBirth);
extern char *SDKGetDeviceID();
extern void SDKBuy(const char *productId, const char *serverTag, const char *extraData);
// 新增重复支付验证
extern void SDKReconfirmOrderAPI();
// 查询支付账号对应商品的货币价格
extern void QuerySkuDetails(const char *skus);
extern const char * QueryRemoteConfig(const char *configKey);
extern void SDKUserEventUpload(const char *strEventName, const char *strJsonCallbackParameter);
extern void SystemShare(const char *strShareText, Byte *imgData, int nSize);
extern void RequestStoreReview();
extern void SDKClearAccount();
extern void SDKNewAccountLink();
extern void QuickLogin();
// account -- > strEmail; strVerificationCode --> strVerificationCode
extern void SDKAccountRegister(const char *account, const char *strVerificationCode);
extern void SDKRegsitLink(const char *strEmail, const char *strVerificationCode);
extern void SDKVerificationCodeReq(const char *strEmail);


//AIHelp
extern void ShowAiHelpFAQs(const char *sdkVersion,const char *serverId,const char *roleUid, const char *roleName,const char *roleCreateTime,int purchase,const char *tags);
// 新增获取屏幕安全区域
extern void GetSafeAreaImpl(float *x, float *y, float *w, float *h);
// 删除账号
extern void SDKDeleteAccount();
// 恢复账号
extern void SDKRebornAccount();

//返回协议的URL地址
extern const char *SDKGetAgreement();
//同意协议
extern void SDKConifrmAgreement();
// 返回协议内容信息
extern void SDKGetAgreementInfo();

// 返回其他协议信息
extern void SDKGetShopAgreementInfo(const char *q);

// 返回未成年人商店退款协议信息
extern void SDKGetUnderAgeAgrement();
// 确认未成年人商店退款协议信息
extern void SDKConifrmShopAgreement();

// SDKServerToServer
extern void SDKServerToServer(const char *devToken, const char *linkID, const char *appEventName, const char *priceValue, const char *currencyCode);

// 系统剪切板
extern int SDKToClipboard(const char *cValue);

// 判断系统版本是否大于iOS 13
extern bool SDKSystemVerAvailable();

// 获取当前UID和token
extern const char *SDKGetUID();
extern const char *SDKGetAccessToken();

// 获取ErrorCode
extern const char *SDKGetErrorCode(int code);

// ************* 废弃 ******************
extern void SDKValidateAccount(const char *strVerificationCode);
extern void SDKResetAccountPW(const char *strAccount, const char *strNewPW, const char *strVerificationCode);
// ************* end ******************
typedef void(^YostarSDKCallBack)(NSString *result);
@interface YostarSDK : NSObject

@property (nonatomic, copy) NSString *baseURL;
@property (nonatomic, copy) NSString *payStoreId;
@property (nonatomic, copy) NSString *twKey;
@property (nonatomic, copy) NSString *twSecret;

@property (nonatomic, copy) YostarSDKCallBack SDKCallBack;
// 管理单例
+ (instancetype)yostarShareton;

@end
