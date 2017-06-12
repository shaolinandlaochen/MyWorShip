//
//  GoodsDetailsCell.h
//  MyWorShip
//
//  Created by 123 on 2017/6/8.
//  Copyright © 2017年 123. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol HTMLContextDelegate<NSObject>
-(void)htmlHeight:(float)height;
-(void)ReviewImagesUrl:(NSString *)url;
@end
@interface GoodsDetailsCell : UITableViewCell<UIWebViewDelegate>
@property(nonatomic,copy)NSString *commodity_desc;
@property(nonatomic,strong)UIWebView *webView;
@property(nonatomic,assign)id delegate;
@property(nonatomic,strong)NSMutableArray *imageUrl;
@end
