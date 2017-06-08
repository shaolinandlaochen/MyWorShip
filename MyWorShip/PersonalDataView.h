//
//  PersonalDataView.h
//  MyWorShip
//
//  Created by 123 on 2017/5/24.
//  Copyright © 2017年 123. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalDataView : UIView
@property(nonatomic,strong)MyButton *iconHead;//头像
@property(nonatomic,strong)UILabel *name;//用户名
@property(nonatomic,strong)UILabel *money;//账户余额
@property(nonatomic,strong)UIImageView *vipImage;//是否是VIP
@property(nonatomic,copy)NSString *title;
@end
