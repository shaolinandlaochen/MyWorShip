//
//  MyClass.h
//  MyWorShip
//
//  Created by 123 on 2017/5/23.
//  Copyright © 2017年 123. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyClass : UIViewController
//获取颜色值公用方法
-(UIColor *)colorWithHexString:(NSString *)color;
//文本自适应返回size
-(CGSize)StringHeight:(NSString *)stringStr Lblfont:(float)font heightOfTheMinus:(float)height;
//检测网络
-(BOOL)DoYouHaveAnyNetwork;
@end
