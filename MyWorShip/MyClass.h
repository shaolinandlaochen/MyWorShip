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
+(UIColor *)colorWithHexString:(NSString *)color;
//文本自适应返回size
+(CGSize)StringHeight:(NSString *)stringStr Lblfont:(float)font heightOfTheMinus:(float)height;

//切换语言
+(void)languaggeSwitch;

//登录
+(void)theLogin;
#pragma mark - 32位 小写
+(NSString *)MD5ForLower32Bate:(NSString *)str;
#pragma mark - 签名键值对排序
+(NSString *)TheKeyValueSequence:(NSDictionary *)dic;
#pragma mark - 单纯的排序
+(NSString *)SimpleSorting:(NSDictionary *)dataDic;
//获取时间戳
+(NSInteger)timeStamp;
////传入字典添加数据返回完整的数据
+(NSDictionary *)ReceiveTheOriginalData:(NSDictionary *)dic;
//需要重新登录
+(void)YouNeedToLogIn:(NSString *)message;
//检测网络
+(BOOL)DoYouHaveAnyNetwork;


@end
