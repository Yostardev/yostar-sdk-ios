//
//  SecondViewController.m
//  AiriSDKTest
//
//  Created by Yostar on 2019/1/10.
//  Copyright © 2019 Yostar. All rights reserved.
//

#import "SecondViewController.h"
#import "AiriSDKInstance.h"

@interface SecondViewController ()

@property (nonatomic, strong) UITextField *firstText;
@property (nonatomic, strong) UITextField *secondText;
@property (nonatomic, strong) UITextField *thirdText;
@property (nonatomic, strong) UITextField *fourthText;
@property (nonatomic, strong) AiriSDKInstance *airiSDK;
@property (nonatomic, assign) NSInteger myIndex;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self configUI];
}

- (instancetype)initWithIndex:(NSInteger)index{
    if (self = [super init]) {
        self.myIndex = index;
        self.airiSDK = [AiriSDKInstance yostarShareton];
    }
    return self;
}

//创建textField的工厂
- (UITextField *)createViewWithFrame:(CGRect)frame placeholder:(NSString *)placeholder borderStyle:(UITextBorderStyle)borderStyle fontSize:(CGFloat)size keyboardType:(UIKeyboardType)keyboardType{
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.placeholder = placeholder;
    textField.borderStyle = borderStyle;
    textField.keyboardType = keyboardType;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.font = [UIFont systemFontOfSize:size];
    return textField;
}

- (void)configUI{
    self.firstText = [self createViewWithFrame:CGRectMake(30, 90, self.view.bounds.size.width - 60, 44) placeholder:@"parameter" borderStyle:UITextBorderStyleRoundedRect fontSize:16.f keyboardType:UIKeyboardTypeDefault];

    self.secondText = [self createViewWithFrame:CGRectMake(30, CGRectGetMaxY(self.firstText.frame) + 20, self.view.bounds.size.width - 60, 44) placeholder:@"parameter" borderStyle:UITextBorderStyleRoundedRect fontSize:16.f keyboardType:UIKeyboardTypeDefault];

    self.thirdText = [self createViewWithFrame:CGRectMake(30, CGRectGetMaxY(self.secondText.frame) + 20, self.view.bounds.size.width - 60, 44) placeholder:@"parameter" borderStyle:UITextBorderStyleRoundedRect fontSize:16.f keyboardType:UIKeyboardTypeDefault];

    self.fourthText = [self createViewWithFrame:CGRectMake(30, CGRectGetMaxY(self.thirdText.frame) + 20, self.view.bounds.size.width - 60, 44) placeholder:@"parameter" borderStyle:UITextBorderStyleRoundedRect fontSize:16.f keyboardType:UIKeyboardTypeDefault];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(50, CGRectGetMaxY(self.fourthText.frame) + 30, self.view.bounds.size.width - 100, 44);
    btn.backgroundColor = [UIColor blueColor];
    NSString *title = [self setBtnTitle:self.myIndex];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.layer.cornerRadius = 11.f;
    [btn addTarget:self action:@selector(didClicked:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:self.firstText];
    [self.view addSubview:self.secondText];
    [self.view addSubview:self.thirdText];
    [self.view addSubview:self.fourthText];

    [self.view addSubview:btn];
}

- (NSString *)setBtnTitle:(NSInteger)index{
    NSString *result = nil;
    switch (index) {
        case 5:
            result = @"Login";
            break;
        case 6:
            result = @"Set birthday";
            break;
        case 7:
            result = @"Event upload";
            break;
        case 8:
            result = @"Pay";
            break;
        case 9:
            result = @"Request verification code";
            break;
        case 10:
            result = @"Binding";
            break;
        case 11:
            result = @"Untied";
            break;
        case 12:
        {
            self.firstText.hidden = YES;
            self.secondText.hidden = YES;
            self.thirdText.hidden = YES;
            self.fourthText.hidden = YES;
            result = @"Helpshift";
        }
            break;

        default:
            break;
    }
    return result;
}

- (void)didClicked:(UIButton *)button{
    NSLog(@"%ld*****", (long)self.myIndex);
    switch (self.myIndex) {
        case 5:
        {
            NSInteger platform = [self.firstText.text integerValue];
            BOOL isNew = [self.fourthText.text boolValue];
            [self.airiSDK SDKLogin:platform param1:self.secondText.text param2:self.thirdText.text isCreateNew:isNew success:^(NSDictionary *result) {
                NSLog(@"%@*****", result);
            } fail:^(NSDictionary *result) {
                NSLog(@"%@*****", result);
            }];
        }
            break;
        case 6:
            NSLog(@"%ld*****", (long)self.myIndex);
            [self.airiSDK SDKSetBirth:self.firstText.text success:^(NSDictionary *result) {
                NSLog(@"%@*****", result);
            } fail:^(NSDictionary *result) {
                NSLog(@"%@*****", result);
            }];
            break;
        case 7:
            [self.airiSDK SDKUserEventUpload:self.firstText.text strJson:self.secondText.text];
            break;
        case 8:
            [self.airiSDK SDKPurchase:self.firstText.text serverTag:self.secondText.text extraData:self.thirdText.text success:^(NSDictionary *result) {
                NSLog(@"%@*****", result);
            } fail:^(NSDictionary *result) {
                NSLog(@"%@*****", result);
            }];
            break;
        case 9:
            [self.airiSDK SDKVerificationCodeReq:self.firstText.text success:^(NSDictionary *result) {
                NSLog(@"%@*****", result);
            } fail:^(NSDictionary *result) {
                NSLog(@"%@*****", result);
            }];
            break;
        case 10:
        {
            NSInteger platform = [self.firstText.text integerValue];
            [self.airiSDK SDKLink:platform param1:self.secondText.text param2:self.thirdText.text success:^(NSDictionary *result) {
                NSLog(@"%@*****", result);
            } fail:^(NSDictionary *result) {
                NSLog(@"%@*****", result);
            }];
        }
            break;
        case 11:
        {
            NSInteger platform = [self.firstText.text integerValue];
            [self.airiSDK SDKUnLink:platform success:^(NSDictionary *result) {
                NSLog(@"%@*****", result);
            } fail:^(NSDictionary *result) {
                NSLog(@"%@*****", result);
            }];
        }
            break;
        case 12:
            [AiriSDKInstance SDKOpenHelpShift];
            break;
            
        default:
            break;
    }
}

@end
