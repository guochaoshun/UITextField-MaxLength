//
//  ViewController.m
//  web调用
//
//  Created by 郭朝顺 on 2018/4/21星期六.
//  Copyright © 2018年 乐乐. All rights reserved.
//

#import "ViewController.h"
#import "UITextField+MaxLength.h"
#import "UIImageView+Extension.h"
#import "AutoScrollLabel.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 3种方式可以设置maxLength, xib中的没有回调
    // 方式1:xib/StoryBoard中设置
    

    // 方式2: 代码设置
//    self.textField.maxLength = 5 ;
    
//    // 方式3: 带回调的设置
//    [self.textField setMaxLength:6 withOverflow:^{
//        NSLog(@"自己设置提示的方式");
//    }];
    
    
}

- (IBAction)removeTextFiled:(id)sender {
    
    [self.textField removeFromSuperview];
    self.textField = nil ;
    
}





@end
