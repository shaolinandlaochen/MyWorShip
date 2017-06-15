//
//  VIPConsumptionRecordCell.h
//  MyWorShip
//
//  Created by 123 on 2017/6/15.
//  Copyright © 2017年 123. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VIPConsumptionRecordCell : UITableViewCell
@property(nonatomic,assign)NSIndexPath *indexPath;
@property(nonatomic,strong)UIView *dian;//小圆点
@property(nonatomic,strong)UIView *line;//线
@property(nonatomic,strong)UILabel *timeBig;//年月日
@property(nonatomic,strong)UILabel *timeSmall;//时分秒
@property(nonatomic,strong)UILabel *number;//消费次数
@property(nonatomic,strong)UILabel *context;//消费次数
@property(nonatomic,strong)UILabel *message;//消费次数
@property(nonatomic,strong)VIPRecordsResultList *model;
@property(nonatomic,assign)NSInteger count;
@end
