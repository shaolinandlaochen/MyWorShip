//
//  BuyRequest.m
//  MyWorShip
//
//  Created by 123 on 2017/6/23.
//  Copyright © 2017年 123. All rights reserved.
//

#import "BuyRequest.h"

@implementation BuyRequest
/*
 *商品下订单
 */
+(void)GoodsOrder_equipment_uuid:(NSString *)equipment_uuid pay_type:(NSString *)pay_type commodity_serial:(NSString *)commodity_serial coupon_id:(NSString *)coupon_id Block:(void(^)(NSDictionary *dic))block{
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
    [dic setObject:equipment_uuid forKey:@"equipment_uuid"];
    [dic setObject:pay_type forKey:@"pay_type"];
    [dic setObject:commodity_serial forKey:@"commodity_serial"];
    if ([coupon_id length]>0) {
        [dic setObject:coupon_id forKey:@"coupon_id"];
    }
    
    NSDictionary *dataDic=[MyClass ReceiveTheOriginalData:dic];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"pay" Dic:dataDic block:^(NSDictionary *dic) {
        NSLog(@"商品下订单:%@",dic);
        block(dic);
        
    }];
}/*
  *支付接口
  */
+(void)PaymentInterface_order_serial:(NSString *)order_serial Block:(void(^)(NSDictionary *dic))block{
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
    [dic setObject:order_serial forKey:@"order_serial"];
    
    NSDictionary *dataDic=[MyClass ReceiveTheOriginalData:dic];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"paybywallet" Dic:dataDic block:^(NSDictionary *dic) {
        NSLog(@"支付接口:%@",dic);
        block(dic);
        
    }];
}
/*
 *钱包支付信息查询
 */
+(void)TheWalletPaymentInformationQuery_commodity_serial:(NSString *)commodity_serial Block:(void(^)(NSDictionary *dic))block{
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
    [dic setObject:commodity_serial forKey:@"commodity_serial"];
    
    NSDictionary *dataDic=[MyClass ReceiveTheOriginalData:dic];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"querypayinfo" Dic:dataDic block:^(NSDictionary *dic) {
        NSLog(@"钱包支付信息查询:%@",dic);
        block(dic);
        
    }];
}
@end
