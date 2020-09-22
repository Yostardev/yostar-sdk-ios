//
//  main.m
//  SDK_Native
//
//  Created by Yostar on 2020/8/31.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        NSLog(@"appDelegateClassName = %@", appDelegateClassName);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
