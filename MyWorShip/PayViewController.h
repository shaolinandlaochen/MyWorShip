//
//  PayViewController.h
//  MyWorShip
//
//  Created by 123 on 2017/6/13.
//  Copyright © 2017年 123. All rights reserved.
//

#import "MyClass.h"

@interface PayViewController : MyClass
@property(nonatomic,strong)EquipmentCommodityResultList *ResultList;
@property(nonatomic,strong)NSDictionary *dataDic;
@property(nonatomic,assign)double ActualConsumptionAmount;
@property(nonatomic,assign)double DiscountAmount;
@property(nonatomic,copy)NSString *coupon_id;
@property(nonatomic,copy)NSString *equipment_uuid;
@property(nonatomic,copy)NSString *commodity_serial;
@property(nonatomic,copy)NSString *imgUrl;
@property(nonatomic,strong)GoodsDetilBaseClass *model;
@end
