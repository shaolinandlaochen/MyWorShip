//
//  MyClass.m
//  MyWorShip
//
//  Created by 123 on 2017/5/23.
//  Copyright © 2017年 123. All rights reserved.
//

#import "MyClass.h"

@interface MyClass ()

@end

@implementation MyClass

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
#pragma mark -颜色值
-(UIColor *)colorWithHexString:(NSString *)color{
    
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor clearColor];
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}
#pragma mark -文本自适应返回size
-(CGSize)StringHeight:(NSString *)stringStr Lblfont:(float)font heightOfTheMinus:(float)height{
    
    CGSize lblSize = [stringStr boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - height, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil].size;
    return lblSize;
}

#pragma mark 检测网络
-(BOOL)DoYouHaveAnyNetwork{
    NSString *State=@"没有网";
    UIApplication *app = [UIApplication sharedApplication];
    NSArray *children = [[[app valueForKeyPath:@"statusBar"]valueForKeyPath:@"foregroundView"]subviews];
    int netType = 0;
    for (id child in children){
        if ([child isKindOfClass:NSClassFromString(@"UIStatusBarDataNetworkItemView")]){
            netType = [[child valueForKeyPath:@"dataNetworkType"]intValue];
            switch (netType) {
                case 0:
                    NSLog(@"........无网络");
                    break;
                case 1:
                    NSLog(@"......2G");
                    State=@"2G";
                    break;
                case 2:
                    NSLog(@".......3G.");
                    State=@"3G";
                    break;
                case 3:
                    NSLog(@"......4G");
                    State=@"4G";
                    break;
                case 5:{
                    NSLog(@".......wifi");
                    State=@"wifi";
                }break;
                default:
                    break;
            }
        }
    }
    if ([State isEqualToString:@"没有网"]) {
        return NO;
    }else{
        return YES;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
