//
//  YostarAppDelegate.h
//  YostarSDK
//
//  Created by Yostar on 2019/8/12.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YostarAppDelegate : NSObject

+ (void)YostarApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;



//AIHelp init
+ (void)YostarAIHelpInitForApiKey:(NSString *)apiKey domainName:(NSString *)domainName appID:(NSString *)appID;
+ (BOOL)YostarApplication:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options;
+ (void)Yostar:(UIViewController *)rootViewController didReceiveRemoteNotification:(NSDictionary *)userInfo;
+ (void)YostarAiHelpDidRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken;


// Adjust
+ (void)YostarAdjustDidRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken;

+ (void)YostarApplicationDidBecomeActive;

@end

NS_ASSUME_NONNULL_END
