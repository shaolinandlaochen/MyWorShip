//
//  LoginViewController.h
//  MyWorShip
//
//  Created by 123 on 2017/5/27.
//  Copyright © 2017年 123. All rights reserved.
//

#import "MyClass.h"
@protocol LoginDelegate <NSObject>

@required//限定实现这个协议,就必须实现这个协议方法

//登陆成功
-(void)LoginSuccessful;


@end
@interface LoginViewController : MyClass
@property(nonatomic,assign)id delegate;
@end
