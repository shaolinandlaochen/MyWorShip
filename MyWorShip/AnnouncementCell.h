//
//  AnnouncementCell.h
//  MyWorShip
//
//  Created by 123 on 2017/5/25.
//  Copyright © 2017年 123. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnnouncementCell : UITableViewCell
@property(nonatomic,strong)UILabel *name;
@property(nonatomic,strong)UILabel *context;
@property(nonatomic,copy)NSString *nameString;
@property(nonatomic,copy)NSString *contextString;
@property(nonatomic,strong)AnnouncementListResultList *model;
@end
