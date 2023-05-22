//
//  ViewController.m
//  SDK_Native
//
//  Created by Yostar on 2020/8/31.
//

#import "ViewController.h"

#import "YostarSDK.h"
#import "Firebase.h"

#import "InputInfoViewController.h"
#import "LogViewController.h"

@interface ViewController ()<UIImagePickerControllerDelegate>
@property (nonatomic, strong) UITextView *tf;
@property(nonatomic, strong) UIImage *shareImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    if (@available(iOS 14, *)) {
//        if ([ATTrackingManager trackingAuthorizationStatus] != ATTrackingManagerAuthorizationStatusAuthorized) {
//            UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"IDFA" message:@"" preferredStyle:UIAlertControllerStyleAlert];
//            [alertC addAction: [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//                
//            }]];
//            UIAlertAction *acnelAction =[UIAlertAction actionWithTitle:@"Cancek" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
//                
//            }];
//            [alertC addAction: acnelAction];
//            alertC.preferredAction =acnelAction;
//            dispatch_async(dispatch_get_main_queue(), ^{
//                [self presentViewController:alertC animated:YES completion:^{
//                    
//                }];
//            });
//            
//            [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
//                NSLog(@"ATTrackingManagerAuthorizationStatus = %ld", status);
//            }];
//        }
//        
//    } else {
//        // Fallback on earlier versions
//    }
    
    
    
    [YostarSDK yostarShareton].SDKCallBack = ^(NSString *content) {
        dispatch_async(dispatch_get_main_queue(), ^{
            UIViewController *topVc= [[UIApplication sharedApplication].keyWindow rootViewController].presentedViewController;
            LogViewController *viewC;
            if ([topVc isKindOfClass:[LogViewController class]]) {
                viewC= (LogViewController *)topVc;
                viewC.content = content;
            } else {
                viewC = [[LogViewController alloc] init];
                viewC.content = content;
                [self presentViewController:viewC animated:YES completion:^{
                    
                }];
            }
            
            
        });
        
    };
    
    
    
}


- (IBAction)initSDkAction:(UIButton *)sender {
    NSLog(@"current selector --> %@",NSStringFromSelector(_cmd));
    //初始化需要替换成自己的服务器
//https://passport.arknights.global:443
//http://test.sdk.azurlane.jp:3011
    SDKInit([@"https://passporttest.arknights.global:9093" UTF8String], [@"appstore" UTF8String], true);
}
- (IBAction)buyAction:(UIButton *)sender {
    //参数需要替换成自己的商品id和环境
    SDKBuy([@"com.yostar.arknightsen.starter" UTF8String], [@"production" UTF8String], [@"abc" UTF8String]);
}
- (IBAction)AIHelpAction:(UIButton *)sender {
    NSData *tagData = [NSJSONSerialization dataWithJSONObject:@[@"bug",@"bad_user"] options:NSJSONWritingFragmentsAllowed error:nil];
    NSString *tagStr = [[NSString alloc] initWithData:tagData encoding:NSUTF8StringEncoding];
    NSDate *nowDate = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSString *nowStr = [formatter stringFromDate:nowDate];
    NSLog(@"nowStr = %@",nowStr);
    ShowAiHelpFAQs([@"1.0.3" UTF8String], [@"serverId1" UTF8String], [@"huxiaohuiroleUid1" UTF8String], [@"huxiaohuiroleName1" UTF8String], [nowStr UTF8String], 10000, [tagStr UTF8String]);
}
- (IBAction)accountRegisterAction:(UIButton *)sender {
    SDKAccountRegister([@"" UTF8String], [@"" UTF8String]);
}

- (IBAction)registerBindAction:(UIButton *)sender {
    SDKRegsitLink([@"" UTF8String], [@"" UTF8String]);
}

- (IBAction)rebindAccountACtion:(UIButton *)sender {
    SDKNewAccountLink();
}


#pragma mark --------登录---------

- (IBAction)twitterLoginAction:(UIButton *)sender {
    SDKLogin(2, [@"" UTF8String], [@"" UTF8String], false);
    
}
- (IBAction)FBLoginAction:(UIButton *)sender {
    SDKLogin(3, [@"" UTF8String], [@"" UTF8String], false);
}
- (IBAction)appleLoginAction:(UIButton *)sender {
    SDKLogin(9, [@"" UTF8String], [@"" UTF8String], false);
}
- (IBAction)quickLoginAction:(UIButton *)sender {
    QuickLogin();
}
- (IBAction)deviceLoginAction:(UIButton *)sender {
    SDKLogin(0, [@"" UTF8String], [@"" UTF8String], false);
}
- (IBAction)yostarLoginAction:(UIButton *)sender {
    InputInfoViewController *inputVc = [InputInfoViewController new];
    inputVc.showEmail = true;
    inputVc.showVerCode = true;
    inputVc.inputBlock = ^(NSString * _Nonnull email, NSString * _Nonnull verCode,NSString * _Nonnull birthStr) {
        
        SDKLogin(4, [email UTF8String], [verCode UTF8String], false);
    };
    [self presentViewController:inputVc animated:true completion:^{
        
    }];
    
}
- (IBAction)transecodeLoginAction:(UIButton *)sender {
    SDKTranscodeReq();
//    SDKLogin(1, [@"" UTF8String], [@"" UTF8String], false);
}
#pragma mark --------绑定---------

- (IBAction)twitterBindAction:(UIButton *)sender {
    SDKLink(2, [@"" UTF8String], [@"" UTF8String]);
}
- (IBAction)FBBindAction:(UIButton *)sender {
    SDKLink(3, [@"" UTF8String], [@"" UTF8String]);
}
- (IBAction)appleBindAction:(UIButton *)sender {
    SDKLink(9, [@"" UTF8String], [@"" UTF8String]);
}
- (IBAction)yostarBindAction:(UIButton *)sender {
    SDKLink(4, [@"" UTF8String], [@"" UTF8String]);
}


#pragma mark --------解绑---------

- (IBAction)twitterUnbindAction:(UIButton *)sender {
    SDKUnlink(2, [@"" UTF8String], [@"" UTF8String]);
}
- (IBAction)FBUnbindAction:(UIButton *)sender {
    SDKUnlink(3, [@"" UTF8String], [@"" UTF8String]);
}
- (IBAction)appleUnbindAction:(UIButton *)sender {
    SDKUnlink(9, [@"" UTF8String], [@"" UTF8String]);
}
- (IBAction)yostarUnbindAction:(UIButton *)sender {
    SDKUnlink(4, [@"" UTF8String], [@"" UTF8String]);
}


#pragma mark --------other---------

- (IBAction)getVerCodeAction:(UIButton *)sender {
    InputInfoViewController *inputVc = [InputInfoViewController new];
    inputVc.showEmail = true;
    inputVc.inputBlock = ^(NSString * _Nonnull email, NSString * _Nonnull verCode,NSString * _Nonnull birthStr) {
        
        SDKVerificationCodeReq([email UTF8String]);
    };
    [self presentViewController:inputVc animated:true completion:^{
        
    }];
}
- (IBAction)writeUnityDatAction:(UIButton *)sender {
    UpdateUnityToken([@"" UTF8String], [@"" UTF8String]);
}
- (IBAction)payVeryAction:(UIButton *)sender {
    SDKReconfirmOrderAPI();
}
- (IBAction)remoteCongifAction:(UIButton *)sender {
    QueryRemoteConfig([@"" UTF8String]);
}
- (IBAction)lookPriceAction:(UIButton *)sender {
    QuerySkuDetails([@"" UTF8String]);
}
- (IBAction)uploadEventACtion:(UIButton *)sender {
    NSDictionary *paramsDic = @{
        @"name" : @"ALIAS",
        @"age" : @"20"
    };
    NSData *data = [NSJSONSerialization dataWithJSONObject:paramsDic options:NSJSONWritingFragmentsAllowed error:nil];
    NSString *pStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    SDKUserEventUpload([@"role_login" UTF8String], [pStr UTF8String]);
}
- (IBAction)shareAction:(UIButton *)sender {
    
    UIImagePickerController *imagePickerC = [UIImagePickerController new];
    imagePickerC.delegate = (id)self;
    [self presentViewController:imagePickerC animated:YES completion:^{
            
    }];
    
}
- (IBAction)storeViewAction:(UIButton *)sender {
    RequestStoreReview();
}
- (IBAction)deleteAccountAction:(UIButton *)sender {
    SDKDeleteAccount();
}
- (IBAction)rebornAccountAction:(UIButton *)sender {
    SDKRebornAccount();
}
- (IBAction)clearAccountAction:(UIButton *)sender {
    SDKClearAccount();
}

- (IBAction)agreementURLAction:(UIButton *)sender {
    SDKGetAgreement();
}
- (IBAction)agreeAgreementAction:(UIButton *)sender {
    SDKConifrmAgreement();
}

- (IBAction)agreementInfoAction:(UIButton *)sender {
    SDKGetAgreementInfo();
}
- (IBAction)shopAgreementInfoAction:(UIButton *)sender {
    SDKGetShopAgreementInfo([@"" UTF8String]);
}

- (IBAction)underAgeAgreementInfoAction:(UIButton *)sender {
    SDKGetUnderAgeAgrement();
}
- (IBAction)configUnderAgeAction:(UIButton *)sender {
    SDKConifrmShopAgreement();
}

- (IBAction)getDeviceIdAction:(UIButton *)sender {
    char *deviceId = SDKGetDeviceID();
    NSLog(@"%@",[NSString stringWithCString:deviceId encoding:NSUTF8StringEncoding]);
}

- (IBAction)getSafeAreaAction:(UIButton *)sender {
    float x = 0, y = 0, w = 0, h = 0;
    GetSafeAreaImpl(&x, &y, &w, &h);
    NSLog(@"x = %f,h = %f,w = %f,h = %f",x,y,w,h);
}
- (IBAction)setBirthAction:(UIButton *)sender {
    InputInfoViewController *inputVc = [InputInfoViewController new];
    inputVc.showDatePicker = true;
    inputVc.inputBlock = ^(NSString * _Nonnull email, NSString * _Nonnull verCode, NSString * _Nonnull birthStr) {
        SDKSetBirth([birthStr UTF8String]);
    };
    [self presentViewController:inputVc animated:true completion:^{
        
    }];
    
}

- (IBAction)adjustTestAction:(UIButton *)sender {
    NSDictionary *paramsDic = @{
        @"name" : @"ALIAS",
        @"age" : @"20"
    };
    NSData *data = [NSJSONSerialization dataWithJSONObject:paramsDic options:NSJSONWritingFragmentsAllowed error:nil];
    NSString *pStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    SDKUserEventUpload([@"role_login" UTF8String], [pStr UTF8String]);
}

- (IBAction)ATTAction:(UIButton *)sender {
//    [Adjust requestTrackingAuthorizationWithCompletionHandler:^(NSUInteger status) {
//        NSLog(@"ATT --> %ld",status);
//        switch (status) {
//                case 0:
//                    // ATTrackingManagerAuthorizationStatusNotDetermined case
//                    break;
//                case 1:
//                    // ATTrackingManagerAuthorizationStatusRestricted case
//                    break;
//                case 2:
//                    // ATTrackingManagerAuthorizationStatusDenied case
//                    break;
//                case 3:
//                    // ATTrackingManagerAuthorizationStatusAuthorized case
//                    break;
//            }
//    }];
}
- (IBAction)toClipboardAction:(UIButton *)sender {
    SDKToClipboard([@"大吉大利" UTF8String]);
    
}

- (IBAction)getUIDACtion:(UIButton *)sender {
    SDKGetUID();
}

- (IBAction)getAccessTokenAction:(UIButton *)sender {
    SDKGetAccessToken();
}
- (IBAction)getErrorCodeAction:(UIButton *)sender {
    SDKGetErrorCode(0);
}






- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info
{
    NSLog(@"xxxxxxxx");
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    NSData *imageData = UIImagePNGRepresentation(image);
    [picker dismissViewControllerAnimated:true completion:^{
        SystemShare([@"图片分享" UTF8String], (Byte *)[imageData bytes], (int)(imageData.length));
    }];
    

    
}



- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:^{
            
    }];
}

@end
