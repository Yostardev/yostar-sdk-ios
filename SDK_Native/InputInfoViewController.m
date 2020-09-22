//
//  InputInfoViewController.m
//  SDK_Native
//
//  Created by Yostar on 2020/9/1.
//

#import "InputInfoViewController.h"

@interface InputInfoViewController ()
@property (weak, nonatomic) IBOutlet UITextField *emailTF;
@property (weak, nonatomic) IBOutlet UITextField *verCodeTF;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (copy, nonatomic) NSString *birthStr;
@end

@implementation InputInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
        self.verCodeTF.hidden = !self.showVerCode;
    self.emailTF.hidden = !self.showEmail;
    self.datePicker.hidden = !self.showDatePicker;
    if (self.showDatePicker) {
        [self.datePicker addTarget:self action:@selector(datePickerChange:) forControlEvents:UIControlEventValueChanged];
    }
}

- (void)datePickerChange:(UIDatePicker *)dp{
    NSLog(@"%@",dp.date);
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyyMMdd";
    _birthStr = [dateFormatter stringFromDate:dp.date];
    
}

- (IBAction)okAction:(UIButton *)sender {
    if (self.showEmail && (_emailTF.text.length <= 0)) {
        NSLog(@"输入email");
        return;
    }
    if (self.showVerCode && (_verCodeTF.text.length <= 0)) {
        NSLog(@"输入验证码");
        return;;
    }
    
    if (self.showDatePicker && _birthStr.length <= 0) {
        NSLog(@"请选择生日");
        return;
    }
    
    !self.inputBlock ?: self.inputBlock(_emailTF.text, _verCodeTF.text, _birthStr);
    [self dismissViewControllerAnimated:true completion:^{
        
    }];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:true];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
