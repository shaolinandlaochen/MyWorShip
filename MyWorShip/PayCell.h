//
//  PayCell.h
//  MyWorShip
//
//  Created by 123 on 2017/6/22.
//  Copyright © 2017年 123. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayCell : UITableViewCell
@property(nonatomic,strong)UILabel *name;
@property(nonatomic,strong)UILabel *money;
@property(nonatomic,strong)UIImageView *rightIcon;
@property(nonatomic,copy)NSString *imgName;
@end
