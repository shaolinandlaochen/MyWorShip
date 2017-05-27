//
//  TopUpAmountViewController.m
//  MyWorShip
//
//  Created by 123 on 2017/5/27.
//  Copyright © 2017年 123. All rights reserved.
//

#import "TopUpAmountViewController.h"
#import "TopUpResultsViewController.h"
@interface TopUpAmountViewController ()

@end

@implementation TopUpAmountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"充值";
    lfteItemAndColor
    self.view.backgroundColor=[UIColor whiteColor];

    [self CreatView];
    
    
    
    
    // Do any additional setup after loading the view.
}
#pragma mark 构建视图
-(void)CreatView{
    autoSize
    NAVHEIGHT
    RECTSTATUS
    
    //线
    UIView *lineA=[[UIView alloc]init];
    lineA.backgroundColor=[self colorWithHexString:@"d7d7d7"];
    [self.view addSubview:lineA];
    lineA.sd_layout.leftSpaceToView(self.view, 30*autoSizeScaleX).topSpaceToView(self.view, (139*autoSizeScaleY)+navheight+rectStatus.size.height).rightSpaceToView(self.view, 30*autoSizeScaleX).heightIs(0.5);
    
    UILabel *lblA=[[UILabel alloc]init];
    lblA.text=@"我的余额:60.00元";
    lblA.textColor=[self colorWithHexString:@"000000"];
    lblA.font=[UIFont systemFontOfSize:14];
    [self.view addSubview:lblA];
    lblA.sd_layout.leftEqualToView(lineA).rightEqualToView(lineA).bottomSpaceToView(lineA, 1).topSpaceToView(self.view, navheight+rectStatus.size.height);
    
    UILabel *lblB=[[UILabel alloc]init];
    lblB.text=@"充值金额";
    lblB.textColor=[self colorWithHexString:@"000000"];
    lblB.font=[UIFont systemFontOfSize:14];
    [self.view addSubview:lblB];
    lblB.sd_layout.leftEqualToView(lineA).rightEqualToView(lineA).topSpaceToView(lineA, 1).heightIs(139*autoSizeScaleY);
    
    for (int i=0; i<4; i++) {
        float x=30+(326+26)*(i%2);
        float y=0+(138+26)*(i/2);
        MyButton *btn=[MyButton buttonWithType:UIButtonTypeCustom];
      
        
        btn.layer.masksToBounds=10;
        btn.layer.cornerRadius=10;
        btn.tag=i+1;
        [btn addTarget:self action:@selector(onTopUpClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        btn.sd_layout.leftSpaceToView(self.view, x*autoSizeScaleX).topSpaceToView(lblB, y*autoSizeScaleY).widthIs(326*autoSizeScaleX).heightIs(138*autoSizeScaleY);
        
        
        UILabel *filling=[[UILabel alloc]init];
        filling.tag=i+10;
        filling.textAlignment=NSTextAlignmentCenter;
        filling.font=[UIFont systemFontOfSize:17];
        [btn addSubview:filling];
        filling.sd_layout.leftSpaceToView(btn, 0).rightSpaceToView(btn, 0).topSpaceToView(btn, 34*autoSizeScaleY).heightIs(34*autoSizeScaleY);
        
        
        UILabel *send=[[UILabel alloc]init];
        send.tag=i+20;
        send.textAlignment=NSTextAlignmentCenter;
        send.textColor=[self colorWithHexString:@"f1c40b"];
        send.font=[UIFont systemFontOfSize:14];
        [btn addSubview:send];
        send.sd_layout.leftSpaceToView(btn, 0).rightSpaceToView(btn, 0).topSpaceToView(filling, 0).bottomSpaceToView(btn, 0);
        
        
        
        
        if (i==0) {
            btn.backgroundColor=[self colorWithHexString:@"ff4c59"];
            filling.textColor=[self colorWithHexString:@"ffffff"];
        }else{
            btn.backgroundColor=[self colorWithHexString:@"f5f5f5"];
            filling.textColor=[self colorWithHexString:@"000000"];
        }
        switch (i) {
            case 0:
            {
                filling.text=@"充300元";
                send.text=@"送50元";
            }
                break;
            case 1:
            {
                filling.text=@"充200元";
                send.text=@"送20元";
            }
                break;
            case 2:
            {
                filling.text=@"充100元";
                send.text=@"送50元";
            }
                break;
            case 3:
            {
                filling.text=@"充50元";
                send.text=@"送5元";
            }
                break;
                
            default:
                break;
        }
        
        
        
    }
    
    
    
    UILabel *lblC=[[UILabel alloc]init];
    lblC.text=@"选择支付方式";
    lblC.textColor=[self colorWithHexString:@"000000"];
    lblC.font=[UIFont systemFontOfSize:14];
    [self.view addSubview:lblC];
    lblC.sd_layout.leftEqualToView(lineA).rightEqualToView(lineA).topSpaceToView(lblB, 306*autoSizeScaleY).heightIs(139*autoSizeScaleY);
    for (int i=0; i<2; i++) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag=i+100;
        [btn addTarget:self action:@selector(onPaymentOptionClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
        UIImageView *imgA=[[UIImageView alloc]init];
        [btn addSubview:imgA];
        
        UIImageView *imgB=[[UIImageView alloc]init];
        imgB.tag=i+300;
        [btn addSubview:imgB];
        
        UILabel *lblD=[[UILabel alloc]init];
        lblD.textColor=[self colorWithHexString:@"000000"];
        lblD.font=[UIFont systemFontOfSize:15];
        [btn addSubview:lblD];
        
        
        
        
        if (i==0) {
            btn.sd_layout.leftEqualToView(lineA).rightEqualToView(lineA).topSpaceToView(lblC, 0).heightIs(104*autoSizeScaleY);
            imgA.image=[UIImage imageNamed:@"icon_zhifubao"];
            imgA.sd_layout.leftSpaceToView(btn, 0).topSpaceToView(btn, 32*autoSizeScaleY).bottomSpaceToView(btn, 32*autoSizeScaleY).widthIs(40*autoSizeScaleX);
            imgB.image=[UIImage imageNamed:@"circle_selected"];
            imgB.sd_layout.rightSpaceToView(btn, 0).topSpaceToView(btn, 32*autoSizeScaleY).bottomSpaceToView(btn, 32*autoSizeScaleY).widthIs(40*autoSizeScaleX);
            lblD.text=@"支付宝支付";
        }else if (i==1){
            btn.sd_layout.leftEqualToView(lineA).rightEqualToView(lineA).topSpaceToView(lblC, 104*autoSizeScaleY).heightIs(104*autoSizeScaleY);
            imgA.image=[UIImage imageNamed:@"icon_weixinpay"];
            imgA.sd_layout.leftSpaceToView(btn, 0).topSpaceToView(btn, 32*autoSizeScaleY).bottomSpaceToView(btn, 32*autoSizeScaleY).widthIs(40*autoSizeScaleX);
            imgB.image=[UIImage imageNamed:@"circle_select"];
            imgB.sd_layout.rightSpaceToView(btn, 0).topSpaceToView(btn, 32*autoSizeScaleY).bottomSpaceToView(btn, 32*autoSizeScaleY).widthIs(40*autoSizeScaleX);
            lblD.text=@"微信支付";
        
        }
        lblD.sd_layout.leftSpaceToView(imgA, 17*autoSizeScaleX).rightSpaceToView(imgB, 17*autoSizeScaleX).bottomSpaceToView(btn, 0).topSpaceToView(btn, 0);
    }
    
    
    MyButton *PrepaidPhoneImmediatelyBtn=[[MyButton alloc]init];
    [PrepaidPhoneImmediatelyBtn setTitle:@"立即充值" forState:UIControlStateNormal];
    PrepaidPhoneImmediatelyBtn.titleLabel.font=[UIFont systemFontOfSize:17];
    [PrepaidPhoneImmediatelyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [PrepaidPhoneImmediatelyBtn addTarget:self action:@selector(onPrepaidPhoneImmediatelyClick) forControlEvents:UIControlEventTouchUpInside];
    PrepaidPhoneImmediatelyBtn.layer.masksToBounds=3;
    PrepaidPhoneImmediatelyBtn.layer.cornerRadius=3;
    PrepaidPhoneImmediatelyBtn.backgroundColor=[self colorWithHexString:@"ff4c59"];
    [self.view addSubview:PrepaidPhoneImmediatelyBtn];
    PrepaidPhoneImmediatelyBtn.sd_layout.leftEqualToView(lineA).rightEqualToView(lineA).bottomSpaceToView(self.view, 164*autoSizeScaleY).heightIs(96*autoSizeScaleY);
    
    
    NSMutableAttributedString *strString = [[NSMutableAttributedString alloc] initWithString:@"点击立即充值,即表示您同意<<充返活动协议>>"];
    [strString addAttribute:NSForegroundColorAttributeName value:[self colorWithHexString:@"3a3a3a"] range:NSMakeRange(0,13)];
    [strString addAttribute:NSForegroundColorAttributeName value:[self colorWithHexString:@"ff4c59"] range:NSMakeRange(13,10)];
    UIButton *termsBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [termsBtn setAttributedTitle:strString forState:UIControlStateNormal];
    termsBtn.titleLabel.font=[UIFont systemFontOfSize:13];
    [termsBtn addTarget:self action:@selector(onChargeBackToActiveProtocolClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:termsBtn];
    termsBtn.sd_layout.leftEqualToView(lineA).rightEqualToView(lineA).bottomSpaceToView(self.view, 100*autoSizeScaleY).heightIs(26);

}
#pragma  mark 点击充值面额执行该方法
-(void)onTopUpClick:(MyButton *)btn{

    for (int i=0; i<4; i++) {
        if (btn.tag-1==i) {
            ((MyButton *)[self.view viewWithTag:i+1]).backgroundColor=[self colorWithHexString:@"ff4c59"];
            ((UILabel *)[self.view viewWithTag:i+10]).textColor=[self colorWithHexString:@"ffffff"];
        }else{
            ((MyButton *)[self.view viewWithTag:i+1]).backgroundColor=[self colorWithHexString:@"f5f5f5"];
            ((UILabel *)[self.view viewWithTag:i+10]).textColor=[self colorWithHexString:@"000000"];
        }
        
       
        
    }
}
#pragma mark 付款选项
-(void)onPaymentOptionClick:(UIButton *)btn{
   
        if (btn.tag==100) {//支付宝
            ((UIImageView *)[self.view viewWithTag:300]).image=[UIImage imageNamed:@"circle_selected"];
            ((UIImageView *)[self.view viewWithTag:301]).image=[UIImage imageNamed:@"circle_select"];
        }else{//微信
            ((UIImageView *)[self.view viewWithTag:300]).image=[UIImage imageNamed:@"circle_select"];
            ((UIImageView *)[self.view viewWithTag:301]).image=[UIImage imageNamed:@"circle_selected"];
        }
    
}
#pragma mark 立即充值按钮
-(void)onPrepaidPhoneImmediatelyClick{
    
        TopUpResultsViewController *TopUpResults=[[TopUpResultsViewController alloc]init];
        [self.navigationController pushViewController:TopUpResults animated:YES];
}
#pragma mark 点击协议执行该方法
-(void)onChargeBackToActiveProtocolClick{

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
