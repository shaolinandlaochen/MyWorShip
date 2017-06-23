//
//  GoodsDetailsViewController.h
//  MyWorShip
//
//  Created by 123 on 2017/6/8.
//  Copyright © 2017年 123. All rights reserved.
//

#import "MyClass.h"

@interface GoodsDetailsViewController : MyClass
@property(nonatomic,copy)NSString *goodsID;
@property(nonatomic,copy)NSString *why;
@property(nonatomic,strong)NSDictionary *dataDic;//接收数据
@property(nonatomic,copy)NSString *equipment_uuid;
@end
