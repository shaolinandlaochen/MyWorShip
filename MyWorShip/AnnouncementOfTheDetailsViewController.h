//
//  AnnouncementOfTheDetailsViewController.h
//  MyWorShip
//
//  Created by 123 on 2017/5/26.
//  Copyright © 2017年 123. All rights reserved.
//

#import "MyClass.h"
@protocol AnnouncementOfTheDetailsDelegate <NSObject>

@required//限定实现这个协议,就必须实现这个协议方法

//消息已读
-(void)TheMessageHasBeenRead;


@end
@interface AnnouncementOfTheDetailsViewController : MyClass
@property(nonatomic,copy)NSString *titleString;
@property(nonatomic,assign)id delegate;
@property(nonatomic,assign)NSInteger ID;
@property(nonatomic,strong)MyMessageListResultList *model;
@end
