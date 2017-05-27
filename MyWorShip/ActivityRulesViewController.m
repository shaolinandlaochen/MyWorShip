//
//  ActivityRulesViewController.m
//  MyWorShip
//
//  Created by 123 on 2017/5/26.
//  Copyright © 2017年 123. All rights reserved.
//

#import "ActivityRulesViewController.h"

@interface ActivityRulesViewController ()

@end

@implementation ActivityRulesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *_scrollView=[[UIScrollView alloc]init];
    _scrollView.backgroundColor=[UIColor  whiteColor];
    _scrollView.layer.masksToBounds=10;
    _scrollView.layer.cornerRadius=10;
    [self.view addSubview:_scrollView];
    _scrollView.sd_layout.leftSpaceToView(self.view, 19).topSpaceToView(self.view, 104).rightSpaceToView(self.view, 19).bottomSpaceToView(self.view, 39);
    UILabel *title=[[UILabel alloc]init];
    title.text=@"活动规则";
    title.textAlignment=NSTextAlignmentCenter;
    title.textColor=[self colorWithHexString:@"000000"];
    title.font=[UIFont systemFontOfSize:15];
    [_scrollView addSubview:title];
    title.sd_layout.leftSpaceToView(_scrollView, 0).rightSpaceToView(_scrollView, 0).topSpaceToView(_scrollView, 19.5).autoHeightRatio(0);
    
    UITextView *textView=[[UITextView alloc]init];
    [textView setEditable:NO];
    textView.text=@"手机发布救死扶伤快捷方式立刻返回时空裂缝还是看了很多事是开发商开发上课了方式来看分手快乐经济法开始拒绝垃圾罚款吉林省分克里斯是否合适开发还是咖啡还是咖啡还是咖啡还是客户付款是否开始了恢复了首付款是否塑料颗粒凤凰网我回复日无法hi看风景还是开发是否合适开放后是否会时刻发挥十分看好时刻发挥双方还是立刻喝咖啡首付款还是咖啡还是咖啡还是流量费收款方还是咖啡还是咖啡还是时返回收款方还是咖啡还是咖啡还是开发和克里斯机发布救死扶伤快捷方式立刻返回时空裂缝还是看了很多事是开发商开发上课了方式来看分手快乐经济法开始拒绝垃圾罚款吉林省分克里斯是否合适开发还是咖啡还是咖啡还是咖啡还是客户付款是否开始了恢复了首付款是否塑料颗粒凤凰网我回复日无法hi看风景还是开发是否合适开放后是否会时刻发挥十分看好时刻发挥双方还是立刻喝咖啡首付款还是咖啡还是咖啡还是流量费收款方还是咖啡还是咖啡还是时返回收款方还是咖啡还是咖啡还是开发和克里斯机发布救死扶伤快捷方式立刻返回时空裂缝还是看了很多事是开发商开发上课了方式来看分手快乐经济法开始拒绝垃圾罚款吉林省分克里斯是否合适开发还是咖啡还是咖啡还是咖啡还是客户付款是否开始了恢复了首付款是否塑料颗粒凤凰网我回复日无法hi看风景还是开发是否合适开放后是否会时刻发挥十分看好时刻发挥双方还是立刻喝咖啡首付款还是咖啡还是咖啡还是流量费收款方还是咖啡还是咖啡还是时返回收款方还是咖啡还是咖啡还是开发和克里斯机发布救死扶伤快捷方式立刻返回时空裂缝还是看了很多事是开发商开发上课了方式来看分手快乐经济法开始拒绝垃圾罚款吉林省分克里斯是否合适开发还是咖啡还是咖啡还是咖啡还是客户付款是否开始了恢复了首付款是否塑料颗粒凤凰网我回复日无法hi看风景还是开发是否合适开放后是否会时刻发挥十分看好时刻发挥双方还是立刻喝咖啡首付款还是咖啡还是咖啡还是流量费收款方还是咖啡还是咖啡还是时返回收款方还是咖啡还是咖啡还是开发和克里斯机发布救死扶伤快捷方式立刻返回时空裂缝还是看了很多事是开发商开发上课了方式来看分手快乐经济法开始拒绝垃圾罚款吉林省分克里斯是否合适开发还是咖啡还是咖啡还是咖啡还是客户付款是否开始了恢复了首付款是否塑料颗粒凤凰网我回复日无法hi看风景还是开发是否合适开放后是否会时刻发挥十分看好时刻发挥双方还是立刻喝咖啡首付款还是咖啡还是咖啡还是流量费收款方还是咖啡还是咖啡还是时返回收款方还是咖啡还是咖啡还是开发和克里斯机发布救死扶伤快捷方式立刻返回时空裂缝还是看了很多事是开发商开发上课了方式来看分手快乐经济法开始拒绝垃圾罚款吉林省分克里斯是否合适开发还是咖啡还是咖啡还是咖啡还是客户付款是否开始了恢复了首付款是否塑料颗粒凤凰网我回复日无法hi看风景还是开发是否合适开放后是否会时刻发挥十分看好时刻发挥双方还是立刻喝咖啡首付款还是咖啡还是咖啡还是流量费收款方还是咖啡还是咖啡还是时返回收款方还是咖啡还是咖啡还是开发和克里斯";
    textView.textColor=[self colorWithHexString:@"000000"];
    textView.font=[UIFont systemFontOfSize:13];
    [_scrollView addSubview:textView];
    textView.sd_layout.leftSpaceToView(_scrollView, 12).topSpaceToView(title, 22).bottomSpaceToView(_scrollView, 22).rightSpaceToView(_scrollView, 12);
    
    UIButton *cancelBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [cancelBtn setBackgroundImage:[UIImage imageNamed:@"icon_close"] forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(onCancelClick) forControlEvents:UIControlEventTouchUpInside];
    [_scrollView addSubview:cancelBtn];
    cancelBtn.sd_layout.rightSpaceToView(_scrollView, 12).topSpaceToView(_scrollView, 9).widthIs(22).heightIs(22);
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
-(void)onCancelClick{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];

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
