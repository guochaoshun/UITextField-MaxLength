//
//  AutoScrollLabel.h
//  web调用
//
//  Created by 郭朝顺 on 2018/7/17星期二.
//  Copyright © 2018年 乐乐. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AutoScrollLabel : UIScrollView<UIScrollViewDelegate>

/// 每秒移动多少像素
@property(nonatomic) float scrollSpeed;
/// 滚动到结束时,暂停多长时间
@property(nonatomic) NSTimeInterval pauseInterval;
@property (nonatomic,strong) UILabel * textLabel ;
/// 设置完textLabel.text调用
- (void)startScrollIfNeed ;

@end
