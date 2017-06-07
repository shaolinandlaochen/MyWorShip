//
//  VerifyTheMobilePhoneViewController.m
//  MyWorShip
//
//  Created by 123 on 2017/6/7.
//  Copyright © 2017年 123. All rights reserved.
//

#import "VerifyTheMobilePhoneViewController.h"
#import "MyRequest.h"
#import "ChangeAPhoneNumberViewController.h"
@interface VerifyTheMobilePhoneViewController ()<UITextFieldDelegate>

{
    UITextField *_tfphone;//手机号
    UITextField *_tfcode;//验证码
    NSTimer *timer;
    NSInteger index;
    UIButton *codeBtn;
}
@end

@implementation VerifyTheMobilePhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"验证手机";
    lfteItemAndColor
    NAVHEIGHT
    RECTSTATUS
    
    
    UIView *view1=[[UIView alloc]init];
    view1.backgroundColor=[UIColor whiteColor];
    view1.layer.masksToBounds=5;
    view1.layer.cornerRadius=5;
    [self.view addSubview:view1];
    view1.sd_layout.leftSpaceToView(self.view, 21).topSpaceToView(self.view, 35+navheight+rectStatus.size.height).rightSpaceToView(self.view, 21).heightIs(45);
    
    _tfphone=[[UITextField alloc]init];
    _tfphone.text=self.phoneString;
    _tfphone.textColor=[MyClass colorWithHexString:@"a3a3a3"];
    _tfphone.font=[UIFont systemFontOfSize:16];
    _tfphone.delegate=self;
    [view1 addSubview:_tfphone];
    _tfphone.sd_layout.leftSpaceToView(view1, 11).topSpaceToView(view1, 10).widthIs(200).bottomSpaceToView(view1, 10);
    
    
    codeBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"点击获取验证码"];
    NSRange strRange = {0,[str length]};
    [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:strRange];
    [str addAttribute:NSForegroundColorAttributeName value:[self colorWithHexString:@"a3a3a3"] range:NSMakeRange(0,[str length])];
    
    [codeBtn setAttributedTitle:str forState:UIControlStateNormal];
    codeBtn.titleLabel.font=[UIFont systemFontOfSize:12];
    [codeBtn addTarget:self action:@selector(onCodeCkick) forControlEvents:UIControlEventTouchUpInside];
    [view1 addSubview:codeBtn];
    codeBtn.sd_layout.rightSpaceToView(view1, 12.5).topSpaceToView(view1, 10).widthIs(100).bottomSpaceToView(view1, 10);
    
    
    
    UIView *view2=[[UIView alloc]init];
    view2.backgroundColor=[UIColor whiteColor];
    view2.layer.masksToBounds=5;
    view2.layer.cornerRadius=5;
    [self.view addSubview:view2];
    view2.sd_layout.leftSpaceToView(self.view, 21).topSpaceToView(view1, 15).rightSpaceToView(self.view, 21).heightIs(45);
    
    
    _tfcode=[[UITextField alloc]init];
    _tfcode.textColor=[MyClass colorWithHexString:@"a3a3a3"];
    _tfcode.placeholder=@"请输入验证码";
    _tfcode.font=[UIFont systemFontOfSize:16];
    _tfcode.delegate=self;
    [view2 addSubview:_tfcode];
    _tfcode.sd_layout.leftSpaceToView(view2, 11).topSpaceToView(view2, 10).widthIs(300).bottomSpaceToView(view2, 10);
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"验证" forState:UIControlStateNormal];
    btn.layer.masksToBounds=5;
    btn.layer.cornerRadius=5;
    [btn addTarget:self action:@selector(onValidation) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font=[UIFont systemFontOfSize:17];
    btn.backgroundColor=[MyClass colorWithHexString:@"ff4c59"];
    [self.view addSubview:btn];
    btn.sd_layout.leftSpaceToView(self.view, 21).topSpaceToView(view2, 15).rightSpaceToView(self.view, 21).heightIs(45);
    
    // Do any additional setup after loading the view.
}
CANCEL
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=NO;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (textField==_tfcode) {
        return YES;
    }
    return NO;
}
#pragma mark 获取验证码
-(void)onCodeCkick{
    
    [SVProgressHUD showWithStatus:loading];
   
    [MyRequest SendTheOldPhoneVerificationCodeBLOCK:^(NSDictionary *dic) {
        CodeIsBaseClass *class=[[CodeIsBaseClass alloc]initWithDictionary:[self deleteEmpty:dic]];
        if ([stringFormat(class.code) isEqualToString:@"1"]) {
            //获取验证码成功
                [timer invalidate];
                timer = nil;
                index=class.time;
                timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(onTimes) userInfo:nil repeats:YES];
            
            [SVProgressHUD showSuccessWithStatus:class.msg];
        }else{
            [SVProgressHUD showErrorWithStatus:class.msg];
        }
    }];

}
#pragma mark 定时器执行方法
-(void)onTimes{
    if (index>0) {
        index-=1;
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%lds",index]];
        [codeBtn setAttributedTitle:str forState:UIControlStateNormal];
    }else{
        index=0;
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"点击获取验证码"];
        NSRange strRange = {0,[str length]};
        [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:strRange];
        [str addAttribute:NSForegroundColorAttributeName value:[self colorWithHexString:@"a3a3a3"] range:NSMakeRange(0,[str length])];
        [codeBtn setAttributedTitle:str forState:UIControlStateNormal];
        
        [timer invalidate];
        timer = nil;
    }
}
#pragma mark 验证
-(void)onValidation{
    ChangeAPhoneNumberViewController *ChangeAPhoneNumber=[[ChangeAPhoneNumberViewController alloc]init];
    [self.navigationController pushViewController:ChangeAPhoneNumber animated:YES];
//    if ([_tfcode.text length]>0) {
//        [MyRequest VerifyTheOldCellPhoneVerificationCode:_tfcode.text BLOCK:^(NSDictionary *dic) {
//            CodeIsBaseClass *class=[[CodeIsBaseClass alloc]initWithDictionary:[self deleteEmpty:dic]];
//            if ([stringFormat(class.code) isEqualToString:@"6"]) {
//                ChangeAPhoneNumberViewController *ChangeAPhoneNumber=[[ChangeAPhoneNumberViewController alloc]init];
//                [self.navigationController pushViewController:ChangeAPhoneNumber animated:YES];
//            }else{
//                [SVProgressHUD showErrorWithStatus:class.msg];
//            }
//        }];
//        
//    }else{
//        [SVProgressHUD showInfoWithStatus:@"请填写验证码"];
//    }
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
