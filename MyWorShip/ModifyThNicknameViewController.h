//
//  ModifyThNicknameViewController.h
//  MyWorShip
//
//  Created by 123 on 2017/6/7.
//  Copyright © 2017年 123. All rights reserved.
//

#import "MyClass.h"
@protocol ModifyThNicknameDelegate <NSObject>

@required//限定实现这个协议,就必须实现这个协议方法

//修改昵称成功
-(void)ModifyTheNicknameSuccess:(NSString *)nickName;


@end
@interface ModifyThNicknameViewController : MyClass
@property(nonatomic,assign)id delegate;
@end
