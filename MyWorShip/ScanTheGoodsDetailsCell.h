//
//  ScanTheGoodsDetailsCell.h
//  MyWorShip
//
//  Created by 123 on 2017/6/6.
//  Copyright © 2017年 123. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScanTheGoodsDetailsCell : UITableViewCell
@property(nonatomic,strong)UIImageView *image;//商品名字
@property(nonatomic,strong)UITextView *name;//商品名称或者说是描述
@property(nonatomic,strong)UILabel *money;//商品价格
@property(nonatomic,strong)UILabel *VIPmoney;//vip商品价格
@property(nonatomic,strong)UILabel *context;//已售数量和剩余数量
@property(nonatomic,strong)MyButton *buyBtn;//立即购买按钮
@property(nonatomic,copy)EquipmentCommodityResultList *model;

@end
