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
    [YostarAppDelegate YostarAIHelpInitForApiKey:@"YOSTAR_app_59d69b706fdb43d6b51c43a907b61fbb" domainName:@"yostar@aihelp.net" appID:@"yostar_platform_4d06213b-51c0-4b03-881f-425fd1e3aa76"];
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options
{
    return [YostarAppDelegate YostarApplication:app openURL:url options:options];
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    [YostarAppDelegate YostarAiHelpDidRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
    [YostarAppDelegate YostarAdjustDidRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [YostarAppDelegate YostarApplicationDidBecomeActive];
}




@end
