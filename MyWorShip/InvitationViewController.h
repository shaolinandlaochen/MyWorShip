//
//  InvitationViewController.h
//  MyWorShip
//
//  Created by 123 on 2017/5/26.
//  Copyright © 2017年 123. All rights reserved.
//

#import "MyClass.h"
@protocol InvitationDelegate <NSObject>

@required//限定实现这个协议,就必须实现这个协议方法

-(void)dismiss;

@end
@interface InvitationViewController : MyClass
@property(nonatomic,assign)id delegate;
@end
