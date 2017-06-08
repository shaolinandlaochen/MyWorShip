//
//  ScrollViewCell.h
//  MyWorShip
//
//  Created by 123 on 2017/6/8.
//  Copyright © 2017年 123. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ScrollViewCellDelegate <NSObject>

@required//限定实现这个协议,就必须实现这个协议方法

//点击图片执行该方法
-(void)cycleScrollView_didSelectItemAtIndex:(NSInteger)index;


@end
@interface ScrollViewCell : UITableViewCell<SDCycleScrollViewDelegate>
@property(nonatomic,strong)NSArray *imgUrlArray;
@property(nonatomic,strong)SDCycleScrollView *scrollView;
@property(nonatomic,assign)id delegate;
@end
