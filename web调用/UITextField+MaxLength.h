//
//  UITextField+MaxLength.h
//  web调用
//
//  Created by 郭朝顺 on 2018/7/30星期一.
//  Copyright © 2018年 乐乐. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^OverFlow)(void);
@interface UITextField (MaxLength)

@property (nonatomic, assign) IBInspectable NSUInteger maxLength;

- (void)setMaxLength:(NSUInteger)maxLength withOverflow:(OverFlow)overFlow ;

@end
