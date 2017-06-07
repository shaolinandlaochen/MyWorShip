//
//  MyClass.m
//  MyWorShip
//
//  Created by 123 on 2017/5/23.
//  Copyright © 2017年 123. All rights reserved.
//

#import "MyClass.h"
#import <CommonCrypto/CommonCrypto.h>
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
#pragma mark -颜色值
+(UIColor *)colorWithHexString:(NSString *)color{
    
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
+(CGSize)StringHeight:(NSString *)stringStr Lblfont:(float)font heightOfTheMinus:(float)height{
    
    CGSize lblSize = [stringStr boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - height, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil].size;
    return lblSize;
}

#pragma mark 检测网络
+(BOOL)DoYouHaveAnyNetwork{
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
#pragma mark -登录
+(void)theLogin{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"MonitorTheLoginNotifications" object:nil];
    
}

//下面是MD5加密

#pragma mark - 32位 小写
+(NSString *)MD5ForLower32Bate:(NSString *)str{
    
    //要进行UTF8的转码
    const char* input = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02x", result[i]];
    }
    
    return digest;
}


#pragma mark - 签名键值对排序
+(NSString *)TheKeyValueSequence:(NSDictionary *)dic{
    
    NSArray *keysArray = [dic allKeys];//获取所有键存到数组
    NSArray *sortedArray = [keysArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2){
        return [obj1 compare:obj2 options:NSNumericSearch];
    }];//由于allKeys返回的是无序数组，这里我们要排列它们的顺序
    NSMutableArray *keysNameArray=[NSMutableArray arrayWithCapacity:0];
    for (NSString *key in sortedArray) {
        // NSString *value = [dic objectForKey: key];
        // NSLog(@"排列的值:%@",value);
        [keysNameArray addObject:key];
    }
    
    NSString *url;
    for (int i=0; i<keysNameArray.count; i++) {
        NSString *keys=keysNameArray[i];
        
        if (i==0) {
            url=[NSString stringWithFormat:@"%@=%@",keys,[dic objectForKey:keys]];
        }else{
            url=[NSString stringWithFormat:@"%@&%@=%@",url,keys,[dic objectForKey:keys]];
        }
    }
    
    NSString *stringSurl=[NSString stringWithFormat:@"%@*SHOP*",url];
    NSLog(@"拼接好的字符串%@",stringSurl);
    return stringSurl;
}
#pragma mark - //获取时间戳
+(NSInteger)timeStamp{
    //时间戳
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970]*1000;
    NSString *timeString = [NSString stringWithFormat:@"%f", a];
    
    return [timeString integerValue];
}
#pragma mark - 传入字典添加数据返回完整的数据
+(NSDictionary *)ReceiveTheOriginalData:(NSDictionary *)dic{
     
    NSArray *keysArray = [dic allKeys];
    NSMutableDictionary *dataDic=[[NSMutableDictionary alloc]init];
    if ([MyClass DoYouHaveAnyNetwork]) {//检测一下网络
        [dataDic setObject:@([MyClass timeStamp]) forKey:@"timestamp"];//添加时间戳
        if ([tokenString length]>0) {
            [dataDic setObject:tokenString forKey:@"token"];
        }
        for (int i=0; i<keysArray.count; i++) {
            NSString *key=[NSString stringWithFormat:@"%@",keysArray[i]];
            [dataDic setObject:[dic objectForKey:key] forKey:key];
        }
        
        NSString *string=[MyClass TheKeyValueSequence:dataDic];//去排序
        NSString *sign=[MyClass MD5ForLower32Bate:string];//签名
        [dataDic setObject:sign forKey:@"sign"];
        

    }else{
        [SVProgressHUD dismiss];
        [SVProgressHUD showErrorWithStatus:@"网络连接错误"];
    }
    return dataDic;//返回添加完毕数据也签名完毕的数据
    
}
#pragma mark 单纯的排序
+(NSString *)SimpleSorting:(NSDictionary *)dataDic{
    
    NSArray *keysArray = [dataDic allKeys];//获取所有键存到数组
    NSArray *sortedArray = [keysArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2){
        return [obj1 compare:obj2 options:NSNumericSearch];
    }];//由于allKeys返回的是无序数组，这里我们要排列它们的顺序
    NSMutableArray *keysNameArray=[NSMutableArray arrayWithCapacity:0];
    for (NSString *key in sortedArray) {
        // NSString *value = [dic objectForKey: key];
        // NSLog(@"排列的值:%@",value);
        [keysNameArray addObject:key];
    }
    
    NSString *url;
    for (int i=0; i<keysNameArray.count; i++) {
        NSString *keys=keysNameArray[i];
        
        if (i==0) {
            url=[NSString stringWithFormat:@"%@=%@",keys,[dataDic objectForKey:keys]];
        }else{
            url=[NSString stringWithFormat:@"%@&%@=%@",url,keys,[dataDic objectForKey:keys]];
        }
    }
    
    
    return url;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//需要重新登录
+(void)YouNeedToLogIn:(NSString *)message{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"" forKey:@"token"];
    //同步数据
    [defaults synchronize];
    [SVProgressHUD showErrorWithStatus:@"请您先去登录"];
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
