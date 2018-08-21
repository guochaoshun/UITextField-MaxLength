//
//  UITextField+MaxLength.m
//  web调用
//
//  Created by 郭朝顺 on 2018/7/30星期一.
//  Copyright © 2018年 乐乐. All rights reserved.
//

#import "UITextField+MaxLength.h"
#import <objc/message.h>
#import <objc/runtime.h>

@interface UITextField ()

@property (nonatomic,copy) OverFlow overFlow ;

@end


@implementation UITextField (MaxLength)

- (void)setMaxLength:(NSUInteger)maxLength {
    objc_setAssociatedObject(self, @"maxLength", @(maxLength) , OBJC_ASSOCIATION_RETAIN_NONATOMIC) ;
    
    [self addTarget:self action:@selector(gcs_textMaxLength) forControlEvents:UIControlEventEditingChanged];
    
}
- (NSUInteger)maxLength {
    NSNumber * maxLength = objc_getAssociatedObject(self, @"maxLength") ;
    return [maxLength unsignedIntegerValue] ;
}

- (void)setOverFlow:(OverFlow)overFlow {
    objc_setAssociatedObject(self, @"overFlow",  overFlow, OBJC_ASSOCIATION_COPY_NONATOMIC) ;

}
- (OverFlow)overFlow {
    return objc_getAssociatedObject(self, @"overFlow") ;
}


- (void)setMaxLength:(NSUInteger)maxLength withOverflow:(void (^)(void))overFlow {
    self.maxLength = maxLength ;
    self.overFlow = overFlow ;
}



-(void)gcs_textMaxLength {
    // 没有设置过maxLength,不做监听
    if (self.maxLength == 0) {
        return ;
    }
    
    
    if (self.text.length > self.maxLength) {
        
        [self endEditing:YES];
        self.text = [self.text substringToIndex:self.maxLength];
 
        if (self.overFlow) {
            self.overFlow() ;
        } else {
            [self defaultOverFlow];
        }
        
    }
    
}

- (void)defaultOverFlow {
    NSString * message = [NSString stringWithFormat:@"最多可输入%lu字",self.maxLength];
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    // 此处不会有循环应用,没毛病的,可以点击那个button试试,是因为UIAlertAction是一个局部变量
    UIAlertAction *confirmAction=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self becomeFirstResponder];
    }];
    
    [alertController addAction:confirmAction];
    
    [UIApplication.sharedApplication.keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
}

- (void)dealloc {
    NSLog(@"dealloc %p, 并没有循环引用",self);
}

@end
