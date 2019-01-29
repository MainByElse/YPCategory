//
//  UIImage+YPGradientImage.h
//  WKWebView交互
//
//  Created by Else丶 on 2019/1/8.
//  Copyright © 2019 xuanhe. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (YPGradientImage)

/**
 * 渐变色Image
 * @param gradientType 0:纵向渐变 1:横向渐变
 */
+ (UIImage *)gradientImageWithBounds:(CGRect)bounds andColors:(NSArray*)colors andGradientType:(int)gradientType;

@end

NS_ASSUME_NONNULL_END
