//
//  BuyRequest.h
//  MyWorShip
//
//  Created by 123 on 2017/6/23.
//  Copyright © 2017年 123. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BuyRequest : NSObject
/*
 *商品下订单
 */
+(void)GoodsOrder_equipment_uuid:(NSString *)equipment_uuid pay_type:(NSString *)pay_type commodity_serial:(NSString *)commodity_serial coupon_id:(NSString *)coupon_id Block:(void(^)(NSDictionary *dic))block;
/*
 *支付接口
 */
+(void)PaymentInterface_order_serial:(NSString *)order_serial Block:(void(^)(NSDictionary *dic))block;
/*
 *钱包支付信息查询
 */
+(void)TheWalletPaymentInformationQuery_commodity_serial:(NSString *)commodity_serial Block:(void(^)(NSDictionary *dic))block;
@end
