//
//  CommentsCell.h
//  MyWorShip
//
//  Created by 123 on 2017/6/8.
//  Copyright © 2017年 123. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentsCell : UITableViewCell
@property(nonatomic,strong)UILabel *name;
@property(nonatomic,strong)UILabel *time;
@property(nonatomic,strong)UILabel *context;
@property(nonatomic,assign)NSInteger xingIdex;
@property(nonatomic,strong)MyMessageListResultList *model;

@end
