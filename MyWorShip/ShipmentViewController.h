//
//  ShipmentViewController.h
//  MyWorShip
//
//  Created by 123 on 2017/6/13.
//  Copyright © 2017年 123. All rights reserved.
//

#import "MyClass.h"

@interface ShipmentViewController : MyClass
@property(nonatomic,strong)PayForResultsBaseClass *model;
@property(nonatomic,copy)NSString *nameString;
@property(nonatomic,copy)NSString *imgUrl;
@property(nonatomic,copy)NSString *money;
@property(nonatomic,strong)NSString *serial;//订单号
@property(nonatomic,strong)NSString *commodity_serial;//商品编号
@end
