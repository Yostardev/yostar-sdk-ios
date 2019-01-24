//
//  ViewController.m
//  AiriSDKTest
//
//  Created by Yostar on 2019/1/10.
//  Copyright © 2019 Yostar. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "AiriSDKInstance.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) AiriSDKInstance *airiSDK;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self configData];
    [self configUI];
}

- (void)configData{
    self.dataSource = @[@"1.Get DevicdID", @"2.Appstore score", @"3.init SDK", @"4.Quick Login", @"5.Release inheritance code", @"6.Login", @"7.Set birthday", @"8.Event upload", @"9.Pay", @"10.Request verification code", @"11.Binding", @"12.Untied", @"13.Helpshift", @"14.Overlay binding", @"15.System sharing", @"16.Logout、Empty token", ];
    self.airiSDK = [AiriSDKInstance yostarShareton];
    
    [self.airiSDK initSDK:^(NSDictionary *result) {
        NSLog(@"%@*****", result);
    } fail:^(NSDictionary *result) {
        NSLog(@"%@*****", result);
    }];
}

- (void)configUI{
    self.myTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    [self.myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.myTableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row >= 5 && indexPath.row <= self.dataSource.count - 4) {
        SecondViewController *secondVC = [[SecondViewController alloc] initWithIndex:indexPath.row];
        [self.navigationController pushViewController:secondVC animated:YES];
    }else{
        switch (indexPath.row) {
            case 0:
                [AiriSDKInstance SDKGetDeviceID];
                break;
            case 1:
                [AiriSDKInstance RequestStoreReview];
                break;
            case 2:
                [self.airiSDK initSDK:^(NSDictionary *result) {
                    NSLog(@"%@", result);
                } fail:^(NSDictionary *result) {
                    NSLog(@"%@", result);
                }];
                break;
            case 3:
                [self.airiSDK SDKQuickLogin:^(NSDictionary *result) {
                    NSLog(@"Quick::%@", result);
                } fail:^(NSDictionary *result) {
                    NSLog(@"Quick::%@", result);
                }];
                break;
            case 4:
                [self.airiSDK SDKTranscodeReq:^(NSDictionary *result) {
                    NSLog(@"TranscodeReq::%@", result);
                } fail:^(NSDictionary *result) {
                    NSLog(@"TranscodeReq::%@", result);
                }];
                break;
            case 13:
                [self.airiSDK SDKNewAccountLink:^(NSDictionary *result) {
                    NSLog(@"NewAccountLink::%@", result);
                } fail:^(NSDictionary *result) {
                    NSLog(@"NewAccountLink::%@", result);
                }];
                break;
            case 14:
            {
                NSString *imageStr = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"png"];
                NSData *data = [NSData dataWithContentsOfFile:imageStr];
                [self.airiSDK SDKSystemShare:@"sharing" shareImageData:data success:^(NSDictionary *result) {
                    
                } fail:^(NSDictionary *result) {
                    
                }];
            }
                break;
            case 15:
                [self.airiSDK SDKLogout:^(NSDictionary *result) {
                    NSLog(@"Logout::%@", result);
                }];
                break;
                
            default:
                break;
        }
    }
}

@end
