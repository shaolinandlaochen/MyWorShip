//
//  PreferentialView.h
//  MyWorShip
//
//  Created by 123 on 2017/5/25.
//  Copyright © 2017年 123. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PreferentiaDelegate <NSObject>

@required//限定实现这个协议,就必须实现这个协议方法

-(void)state:(NSInteger)idx;

@end
@interface PreferentialView : UIView
@property(nonatomic,assign)NSInteger idx;
@property(nonatomic,strong)NSArray *array;
@property(nonatomic,assign)id delegate;
@end
