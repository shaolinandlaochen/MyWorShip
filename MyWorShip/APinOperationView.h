//
//  APinOperationView.h
//  MyWorShip
//
//  Created by 123 on 2017/6/15.
//  Copyright © 2017年 123. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol APinOperationDelegate <NSObject>

@required//限定实现这个协议,就必须实现这个协议方法
//点击步行,驾车,公交执行该方法
-(void)ClickOnTheLine:(MAAnnotationView *)manontation myBtn:(MyButton*)btn;

@end
@interface APinOperationView : UIView
@property(nonatomic,strong)MAAnnotationView *maannotations;
@property(nonatomic,assign)id delegate;
@property(nonatomic,assign)NSInteger index;//路线类型
@property(nonatomic,assign)BOOL state;//是否展示路线
@property(nonatomic,strong)UILabel *address;
@property(nonatomic,assign)id nulls;
@end
