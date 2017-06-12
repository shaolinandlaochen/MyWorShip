//
//  HomeViewController.h
//  MyWorShip
//
//  Created by 123 on 2017/5/23.
//  Copyright © 2017年 123. All rights reserved.
//

#import "MyClass.h"
#import <AMapNaviKit/AMapNaviKit.h>//步行导航
@interface HomeViewController : MyClass
@property (nonatomic, strong) AMapNaviWalkManager *walkManager;
@property (nonatomic, strong) AMapNaviPoint *startPoint;//步行路线规划起点
@property (nonatomic, strong) AMapNaviPoint *endPoint;//步行路线规划终点
@property (nonatomic, strong) AMapNaviPoint *myCenterPoint;//用户当前经纬度
@property (nonatomic, strong) NSMutableArray *routeIndicatorInfoArray;
@end
