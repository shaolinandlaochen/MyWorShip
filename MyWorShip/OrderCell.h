//
//  OrderCell.h
//  MyWorShip
//
//  Created by 123 on 2017/5/26.
//  Copyright © 2017年 123. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderCell : UITableViewCell
@property(nonatomic,strong)UILabel *time;
@property(nonatomic,strong)UILabel *money;
@property(nonatomic,strong)UILabel *location;
@property(nonatomic,strong)UILabel *name;
@property(nonatomic,strong)MyButton *stateBtn;
@end
