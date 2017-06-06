//
//  MessageCell.h
//  MyWorShip
//
//  Created by 123 on 2017/5/25.
//  Copyright © 2017年 123. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageCell : UITableViewCell
@property(nonatomic,strong)UILabel *name;
@property(nonatomic,strong)UILabel *time;
@property(nonatomic,strong)UILabel *context;
@property(nonatomic,strong)UILabel *red;
@property(nonatomic,strong)MyMessageListResultList *model;
@end
