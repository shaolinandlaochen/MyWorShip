//
//  MyViewController.h
//  MyWorShip
//
//  Created by 123 on 2017/5/24.
//  Copyright © 2017年 123. All rights reserved.
//

#import "MyClass.h"
@protocol MyViewControllerDelegate <NSObject>

@required//限定实现这个协议,就必须实现这个协议方法

//视图伸缩
-(void)scaling:(BOOL)isScaling;


@end
@interface MyViewController : MyClass
@property(nonatomic,assign)id delegate;
@property(nonatomic,strong)NSDictionary *dataDic;
@end
