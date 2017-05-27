//
//  GuideTheContentViewController.m
//  MyWorShip
//
//  Created by 123 on 2017/5/27.
//  Copyright © 2017年 123. All rights reserved.
//

#import "GuideTheContentViewController.h"

@interface GuideTheContentViewController ()

@end

@implementation GuideTheContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.title=self.stringName;
    lfteItemAndColor
   
    UITextView *textView=[[UITextView alloc]init];;
     [textView setEditable:NO];
    textView.textColor=[self colorWithHexString:@"000000"];
    textView.backgroundColor=[self colorWithHexString:@"f3f5f7"];
    textView.font=[UIFont systemFontOfSize:14];
    [self.view addSubview:textView];
    textView.sd_layout.leftSpaceToView(self.view, 15.5).topSpaceToView(self.view, 16.5).rightSpaceToView(self.view, 15.5).bottomSpaceToView(self.view, 16.5);
    if ([self.stringName isEqualToString:@"注册"]) {
        textView.text=@" 1、下载“奇拜”app。\n 2、输入手机号，获取手机验证码。\n 3、输入手机验证码登录进入APP。";
    }else if ([self.stringName isEqualToString:@"邀请好友"]){
        textView.text=@"如何邀请好友：\n通过微信，朋友圈，qq，QQ空间分享给好友.";
    }else if ([self.stringName isEqualToString:@"优惠券问题"]){
        textView.text=@"邀请好友后，为何没有获得优惠劵：\n请按如下顺序检查：\n1. 请确保邀请者与受邀者未使用同一设备；\n2. 请确定受邀者通过您发给对方的链接进行注册，或正确输入了您的优惠码；\n3. 如果您按照正常的邀请流程和规则邀请后，仍未获得优惠劵，可以联系客服进行查实。";
    }else if ([self.stringName isEqualToString:@"联系我们"]){
        textView.text=@"如何与客服人员联系：\n1. 拨打客服电话 12345-2345\n公共事务：\n公共事务咨询及合作，请发邮件http://www.奇拜.so/";
    }else if ([self.stringName isEqualToString:@"关于我们"]){
        textView.text=@"奇拜共享是全球第一个共享厕所平台，首创“厕所共享”模式，用户只需在微信服务号或者APP搜索，即可导航至厕所。";
    }else if ([self.stringName isEqualToString:@"用户协议"]){
        textView.text=@"";
    }
    
    // Do any additional setup after loading the view.
}
CANCEL
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=NO;
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
