//
//  AiriSDKAppDelegate.h
//  AiriSDK
//
//  Created by Yostar on 2019/1/22.
//  Copyright © 2019 Yostar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AiriSDKAppDelegate : NSObject

+ (void)AiriSDKApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

+ (BOOL)AiriSDKApplication:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options;

+ (void)AiriSDKApplicationDidReceiveRemoteNotification:(NSDictionary*)userInfo;

+ (void)AiriSDKApplicationDidRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken;

+ (void)AiriSDKApplicationDidBecomeActive;

@end

NS_ASSUME_NONNULL_END
