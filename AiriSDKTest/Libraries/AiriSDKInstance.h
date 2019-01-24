//
//  AiriSDK.h
//  AiriSDK
//
//  Created by Yostar on 2019/1/7.
//  Copyright © 2019 Yostar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AiriSDKInstance : NSObject

typedef void(^InitSuccessHandle)(NSDictionary *result);
typedef void(^InitFailHandle)(NSDictionary *result);

typedef void(^LoginSuccessHandle)(NSDictionary *result);
typedef void(^LoginFailHandle)(NSDictionary *result);

typedef void(^QuickLoginSuccessHandle)(NSDictionary *result);
typedef void(^QuickLoginFailHandle)(NSDictionary *result);

typedef void(^TranscodeReqSuccessHandle)(NSDictionary *result);
typedef void(^TranscodeReqFailHandle)(NSDictionary *result);

typedef void(^VerCodeReqSuccessHandle)(NSDictionary *result);
typedef void(^VerCodeReqFailHandle)(NSDictionary *result);

typedef void(^LinkSuccessHandle)(NSDictionary *result);
typedef void(^LinkFailHandle)(NSDictionary *result);

typedef void(^UnLinkSuccessHandle)(NSDictionary *result);
typedef void(^UnLinkFailHandle)(NSDictionary *result);

typedef void(^ReLinkSuccessHandle)(NSDictionary *result);
typedef void(^ReLinkFailHandle)(NSDictionary *result);

typedef void(^BirthSuccessHandle)(NSDictionary *result);
typedef void(^BirthFailHandle)(NSDictionary *result);

typedef void(^LogoutHandle)(NSDictionary *result);

typedef void(^ShareSuccessHandle)(NSDictionary *result);
typedef void(^ShareFailHandle)(NSDictionary *result);

typedef void(^PurchaseSuccessHandle)(NSDictionary *result);
typedef void(^PurchaseFailHandle)(NSDictionary *result);

@property (nonatomic, copy) NSString *baseURL;
@property (nonatomic, copy) NSString *payStoreId;
@property (nonatomic, copy) NSString *twKey;
@property (nonatomic, copy) NSString *twSecret;

// Management case
+ (instancetype)yostarShareton;
// Get DevicdID
+ (NSString *)SDKGetDeviceID;
// Helpshift
+ (void)SDKOpenHelpShift;
// Appstore score
+ (void)RequestStoreReview;
// init SDK
- (void)initSDK:(InitSuccessHandle)success fail:(InitFailHandle)fail;
// login
// Inherit code login. param1 -- > transcode; param2 --> uid
// yostar login. param1 -- > strEmail; param2 --> strVerificationCode
- (void)SDKLogin:(NSInteger)platform param1:(NSString *)param1 param2:(NSString *)param2 isCreateNew:(BOOL)isCreateNew success:(LoginSuccessHandle)success fail:(LoginFailHandle)fail;
// Quick Login
- (void)SDKQuickLogin:(QuickLoginSuccessHandle)success fail:(QuickLoginFailHandle)fail;
// Release inheritance code
- (void)SDKTranscodeReq:(TranscodeReqSuccessHandle)success fail:(TranscodeReqFailHandle)fail;
// Request verification code
- (void)SDKVerificationCodeReq:(NSString *)accountEmail success:(VerCodeReqSuccessHandle)success fail:(VerCodeReqFailHandle)fail;
// Binding
- (void)SDKLink:(NSInteger)platfrom param1:(NSString *)param1 param2:(NSString *)param2 success:(LinkSuccessHandle)success fail:(LinkFailHandle)fail;
// Untied
- (void)SDKUnLink:(NSInteger)platform success:(UnLinkSuccessHandle)success fail:(UnLinkFailHandle)fail;
// Overlay binding
- (void)SDKNewAccountLink:(ReLinkSuccessHandle)success fail:(ReLinkFailHandle)fail;
// Set birthday
- (void)SDKSetBirth:(NSString *)birthDay success:(BirthSuccessHandle)success fail:(BirthFailHandle)fail;
// Event upload
- (void)SDKUserEventUpload:(NSString *)strEventName strJson:(NSString *)strJson;
// Logout、Empty token
- (void)SDKLogout:(LogoutHandle)handle;
// System sharing
- (void)SDKSystemShare:(NSString *)strShareText shareImageData:(NSData *)shareImageData success:(ShareSuccessHandle)success fail:(ShareFailHandle)fail;
// Pay
- (void)SDKPurchase:(NSString *)productId serverTag:(NSString *)serverTag extraData:(NSString *)extraData success:(PurchaseSuccessHandle)success fail:(PurchaseFailHandle)fail;

@end
