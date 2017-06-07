//
//  SelectADateViewController.h
//  MyWorShip
//
//  Created by 123 on 2017/6/7.
//  Copyright © 2017年 123. All rights reserved.
//

#import "MyClass.h"
@protocol SelectADateDelegate <NSObject>

@required//限定实现这个协议,就必须实现这个协议方法

#define mark 选择时间完毕的代理通知
-(void)selectTime:(NSString *)timeString;


@end
@interface SelectADateViewController : MyClass
@property(nonatomic,assign)id delegate;
@end
