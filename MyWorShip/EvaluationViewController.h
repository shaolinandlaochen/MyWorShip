//
//  EvaluationViewController.h
//  MyWorShip
//
//  Created by 123 on 2017/6/13.
//  Copyright © 2017年 123. All rights reserved.
//

#import "MyClass.h"
@protocol EvaluationDelegate<NSObject>
//评论完毕
-(void)EvaluationAfterEvaluation;
@end
@interface EvaluationViewController : MyClass
@property(nonatomic,copy)NSString *name;//商品名称
@property(nonatomic,copy)NSString *money;//商品价格
@property(nonatomic,copy)NSString *imgUrl;//商品图片地址
@property(nonatomic,copy)NSString *commodity_serial;//商品编号
@property(nonatomic,copy)NSString *order_serial;//订单编号
@property(nonatomic,assign)id delegate;
@end
/*
 @protocol HTMLContextDelegate<NSObject>
 -(void)htmlHeight:(float)height;
 -(void)ReviewImagesUrl:(NSString *)url;
 @end
 */
