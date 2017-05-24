//
//  SGQRCodeScanningVC.h
//  SGQRCodeExample
//
//  Created by apple on 17/3/20.
//  Copyright © 2017年 Sorgle. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SGQRCodeScanningVCDelegate <NSObject>

@required//限定实现这个协议,就必须实现这个协议方法

//扫描结果
-(void)ScanResults:(NSString *)context;


@end
@interface SGQRCodeScanningVC : UIViewController
@property(nonatomic,assign)id delegate;
@end
