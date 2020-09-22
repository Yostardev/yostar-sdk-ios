//
//  InputInfoViewController.h
//  SDK_Native
//
//  Created by Yostar on 2020/9/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^InputBlock)(NSString *email, NSString *verCode, NSString *birthStr);
@interface InputInfoViewController : UIViewController
@property(nonatomic, assign)BOOL  showVerCode;
@property(nonatomic, assign)BOOL  showEmail;
@property(nonatomic, assign)BOOL  showDatePicker;
@property(nonatomic, copy) InputBlock inputBlock;
@end

NS_ASSUME_NONNULL_END
