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
    textView.text=@"1 活动内容\n"
    "(1)月拜用户，通过活动发出链接邀请好友加入月拜;\n"
    "(2)受邀者通过链接注册、认证并成功使用一次，双方各获得 10张优惠劵;\n"
    "(3)若您邀请的好友再成功邀请一位新用户，您将再得 10张优惠劵，上不封顶;\n"
    "2 参与方式\n"
    "(1)用户通过此次活动邀请好友注册，受邀者在邀请链接中输入注册手机号并提交，成功是使用一次，即算邀请成功，双方各得 1010张优惠劵;\n"
    "(2) 每位用户的邀请次数无上限。\n"
    "3 注意事项\n"
    "(1)每位用户的邀请次数无上限;\n"
    "(2)受邀者需从未注册过 月拜，每位新用户只能被邀请一次;\n"
    "(3)邀请关系以受邀者第一次提交注册手机号信息为准，\n"
    "(4)拥有相同账户、手机号及设备的用户视为同一用户，该规则适用于邀请者与被邀请者;\n"
    "(5)通过此次活动获得的张优惠劵可直接在支付中优惠价格；\n"
    "\n"
    "4 特别声明\n"
    "我们包含邀请注册在内的所有优惠推广活动仅向正当、合法使用我们服务/月拜的用户。每位参与者(含邀请 人及被邀请人)的 月拜帐号、手机号及其他身份信息必须是唯一的，任何信息与其他用户重合都不能参加 该活动。活动中，一旦发现您存在利用我们的规则漏洞进行任何形式的作弊行为(包括但不限于通过我们的活动获得不正当的经济利益)，我们有权取消与作弊行为相关账户的奖励、追回您作弊所得的不正当经济利益、关闭作弊账户或与您相关的所有账户，并保留取消您后续使用我们服务/月拜的权利，必要时会依据严重程度 追究您的法律责任。";
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
