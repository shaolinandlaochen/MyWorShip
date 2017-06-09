//
//  GoodsCell.h
//  MyWorShip
//
//  Created by 123 on 2017/5/27.
//  Copyright © 2017年 123. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodsCell : UITableViewCell
@property(nonatomic,strong)UILabel *name;//商品名称
@property(nonatomic,strong)UILabel *money;//商品价格
@property(nonatomic,strong)UILabel *listMoney;//市场价格
@property(nonatomic,strong)UIImageView *img;//商品图片
@property(nonatomic,strong)MonthsThanksGoodsCommodityall *model;
@end
