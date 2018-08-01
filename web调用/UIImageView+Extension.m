//
//  UIImageView+ALinGif.m
//  MiaowShow
//
//  Created by ALin on 16/6/16.
//  Copyright © 2016年 ALin. All rights reserved.
//

#import "UIImageView+Extension.h"
#import <ImageIO/ImageIO.h>
@implementation UIImageView (ALinGif)
// 播放GIF
- (void)playGifAnim:(NSString *)imageName
{
    
    
    NSURL *fileUrl = [[NSBundle mainBundle] URLForResource:imageName withExtension:@"gif"];
    
    CGImageSourceRef gifSource = CGImageSourceCreateWithURL((CFURLRef)fileUrl, NULL);
    size_t gifCount = CGImageSourceGetCount(gifSource);
    NSMutableArray *frames = [[NSMutableArray alloc]init];
    for (size_t i = 0; i< gifCount; i++) {
        CGImageRef imageRef = CGImageSourceCreateImageAtIndex(gifSource, i, NULL);
        UIImage *image = [UIImage imageWithCGImage:imageRef];
        [frames addObject:image];
        CGImageRelease(imageRef);
    }

    
    
    //动画图片数组
    self.animationImages = frames;
    //执行一次完整动画所需的时长
    self.animationDuration = frames.count * 0.15;
    //动画重复次数, 设置成0 就是无限循环
    self.animationRepeatCount = 10;
    [self startAnimating];
}
// 停止动画
- (void)stopGifAnim
{
    if (self.isAnimating) {
        [self stopAnimating];
    }
}
@end
