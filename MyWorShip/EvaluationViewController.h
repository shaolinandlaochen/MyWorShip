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
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *money;
@property(nonatomic,copy)NSString *imgUrl;
@property(nonatomic,copy)NSString *commodity_serial;
@property(nonatomic,copy)NSString *order_serial;
@property(nonatomic,assign)id delegate;
@end
/*
 @protocol HTMLContextDelegate<NSObject>
 -(void)htmlHeight:(float)height;
 -(void)ReviewImagesUrl:(NSString *)url;
 @end
 */
