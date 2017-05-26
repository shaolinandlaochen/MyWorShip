//
//  MessageForDetailsViewController.m
//  MyWorShip
//
//  Created by 123 on 2017/5/26.
//  Copyright © 2017年 123. All rights reserved.
//

#import "MessageForDetailsViewController.h"

@interface MessageForDetailsViewController ()
{
    UIScrollView *_scrollView;
}
@end

@implementation MessageForDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"消息";
    lfteItemAndColor
    _scrollView=[[UIScrollView alloc]initWithFrame:self.view.bounds];
    _scrollView.backgroundColor=[self colorWithHexString:@"f3f5f7"];
    [self.view addSubview:_scrollView];
    
    [self CreatAView];
    // Do any additional setup after loading the view.
}
CANCEL
#pragma mark 创建视图
-(void)CreatAView{

    UILabel *hello=[[UILabel alloc]init];
    hello.text=@"用户你好";
    hello.textColor=[self colorWithHexString:@"000000"];
    hello.font=[UIFont systemFontOfSize:17];
    [_scrollView addSubview:hello];
    hello.sd_layout.leftSpaceToView(_scrollView, 18).topSpaceToView(_scrollView, 29).widthIs(200).autoHeightRatio(0);
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
