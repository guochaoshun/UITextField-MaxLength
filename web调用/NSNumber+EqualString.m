//
//  NSNumber+EqualString.m
//  web调用
//
//  Created by 郭朝顺 on 2018/5/4星期五.
//  Copyright © 2018年 乐乐. All rights reserved.
//

#import "NSNumber+EqualString.h"

@implementation NSNumber (EqualString)

- (BOOL)isEqualToString:(NSString *)aString {

    return [self.description isEqualToString:aString];
}

@end
