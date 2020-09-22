//
//  LogViewController.m
//  SDK_Native
//
//  Created by Yostar on 2020/9/7.
//

#import "LogViewController.h"

@interface LogViewController ()<UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *tv;
@property (nonatomic, strong) NSMutableString *appendString;

@end

@implementation LogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _tv.delegate = (id)self;
    if (self.content != nil) {
        NSMutableString *muStr = @"".mutableCopy;
        NSData *data = [self.content dataUsingEncoding:NSUTF8StringEncoding];
        id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments
                                                    error:nil];
        if ([json isKindOfClass:[NSDictionary class]]) {
            NSDictionary *jsonDic = (NSDictionary *)json;
            for (NSString *key in jsonDic.allKeys) {
            
                [muStr appendFormat:@"%@  :  %@\n",key,jsonDic[key]];
                
            }
        } else {
            muStr = self.content.mutableCopy;
        }
        
        _tv.text = muStr;
    } else {
        _tv.text = @"nil";
    }
    
}

- (void)setContent:(NSString *)content
{
    NSLog(@"%@",content);
    _content = content;
    
    if (_content != nil) {
        NSMutableString *muStr = @"".mutableCopy;
        NSData *data = [_content dataUsingEncoding:NSUTF8StringEncoding];
        id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments
                                                    error:nil];
        if ([json isKindOfClass:[NSDictionary class]]) {
            NSDictionary *jsonDic = (NSDictionary *)json;
            for (NSString *key in jsonDic.allKeys) {
            
                [muStr appendFormat:@"%@  :  %@\n",key,jsonDic[key]];
                
            }
        } else {
            muStr = _content.mutableCopy;
        }
        
        _tv.text = muStr;
    } else {
        _tv.text = @"nil";
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
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
