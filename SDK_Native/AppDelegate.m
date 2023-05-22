//
//  AppDelegate.m
//  SDK_Native
//
//  Created by Yostar on 2020/8/31.
//

#import "AppDelegate.h"
#import "YostarAppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [YostarAppDelegate YostarApplication:application didFinishLaunchingWithOptions:launchOptions];
    //第三方客服AIHelp 初始化
    //下面三个参数可以在AIHelp管理平台上查找
    //apikey
    //domainName
    //appid
    [YostarAppDelegate YostarAIHelpInitForApiKey:@"YOSTAR_app_85e52116cbb649cf8665a5d947852c0b" domainName:@"yostar.aihelp.net" appID:@"yostar_platform_0e9057d5577680b17751f5b1a60c746f"];
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options
{
    return [YostarAppDelegate YostarApplication:app openURL:url options:options];
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    [YostarAppDelegate YostarDidRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [YostarAppDelegate YostarApplicationDidBecomeActive];
}




@end
