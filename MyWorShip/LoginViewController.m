//
//  LoginViewController.m
//  MyWorShip
//
//  Created by 123 on 2017/5/27.
//  Copyright © 2017年 123. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
{
    UITextField *_phoneNmuber;//手机号码
    UITextField *_codeNmuber;//验证码
    MyButton *_codeButton;//获取验证码
    MyButton *_GoLoginBtn;//登录按钮
    NSTimer *timer;
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    autoSize
    self.view.backgroundColor=[self colorWithHexString:@"ffffff"];

    
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=[self colorWithHexString:@"ff5763"];
    [self.view addSubview:view];
    view.sd_layout.leftSpaceToView(self.view, 0).topSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).bottomSpaceToView(self.view, 605*autoSizeScaleY);
    
    UILabel *lblTitle=[[UILabel alloc]init];
    lblTitle.textColor=[UIColor whiteColor];
    lblTitle.text=@"登录";
    lblTitle.textAlignment=NSTextAlignmentCenter;
    lblTitle.font=[UIFont systemFontOfSize:17];
    [self.view addSubview:lblTitle];
    lblTitle.sd_layout.leftSpaceToView(self.view, 0).topSpaceToView(self.view, 69*autoSizeScaleY).rightSpaceToView(self.view, 0).heightIs(32*autoSizeScaleY);
    
    UIImageView *imgA=[[UIImageView alloc]init];
    imgA.image=[UIImage imageNamed:@"logo_login"];
    [self.view addSubview:imgA];
    imgA.sd_layout.leftSpaceToView(self.view, 248*autoSizeScaleX).topSpaceToView(lblTitle, 80*autoSizeScaleY).rightSpaceToView(self.view, 248*autoSizeScaleX).heightIs(192*autoSizeScaleY);
    
    UIImageView *imgB=[[UIImageView alloc]init];
    imgB.image=[UIImage imageNamed:@"img_login"];
    [self.view addSubview:imgB];
    imgB.sd_layout.leftSpaceToView(self.view, (WIDTH-151)/2).bottomSpaceToView(self.view, 603*autoSizeScaleY).rightSpaceToView(self.view, (WIDTH-151)/2).heightIs(151);
    
    UIImageView *imgC=[[UIImageView alloc]init];
    imgC.image=[UIImage imageNamed:@"kk_login"];
    imgC.userInteractionEnabled=YES;
    [self.view addSubview:imgC];
    imgC.sd_layout.leftSpaceToView(self.view, 30.5).topSpaceToView(imgB, 61*autoSizeScaleY).rightSpaceToView(self.view, 30.5).heightIs(112);
    
    _phoneNmuber=[[UITextField alloc]init];
    _phoneNmuber.textColor=[self colorWithHexString:@"000000"];
    _phoneNmuber.font=[UIFont systemFontOfSize:12];
    _phoneNmuber.keyboardType=UIKeyboardTypeNumberPad;
    _phoneNmuber.placeholder=@"请输入电话号码";
    _phoneNmuber.tag=137;
    [_phoneNmuber addTarget:self action:@selector(textChange:) forControlEvents:
     UIControlEventEditingChanged];
    [imgC addSubview:_phoneNmuber];
    _phoneNmuber.sd_layout.leftSpaceToView(imgC, 22).topSpaceToView(imgC, 15).rightSpaceToView(imgC, 22).heightIs(40);
    
    _codeNmuber=[[UITextField alloc]init];
    _codeNmuber.textColor=[self colorWithHexString:@"000000"];
    _codeNmuber.font=[UIFont systemFontOfSize:12];
    _codeNmuber.keyboardType=UIKeyboardTypeNumberPad;
    _codeNmuber.placeholder=@"验证码";
    _codeNmuber.tag=157;
    [_codeNmuber addTarget:self action:@selector(textChange:) forControlEvents:
     UIControlEventEditingChanged];
    [imgC addSubview:_codeNmuber];
    _codeNmuber.sd_layout.leftSpaceToView(imgC, 22).bottomSpaceToView(imgC, 15).rightSpaceToView(imgC, 121).heightIs(40);
    
    UIView *line=[[UIView alloc]init];
    line.backgroundColor=[self colorWithHexString:@"d7d7d7"];
    [imgC addSubview:line];
    line.sd_layout.leftSpaceToView(imgC, 21.5).rightSpaceToView(imgC, 21.5).topSpaceToView(imgC, 55.5).heightIs(0.5);
    
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"点击获取验证码"];
    NSRange strRange = {0,[str length]};
    [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:strRange];
    [str addAttribute:NSForegroundColorAttributeName value:[self colorWithHexString:@"a3a3a3"] range:NSMakeRange(0,[str length])];
  
    _codeButton=[MyButton buttonWithType:UIButtonTypeCustom];
    [_codeButton setAttributedTitle:str forState:UIControlStateNormal];
    _codeButton.titleLabel.font=[UIFont systemFontOfSize:12];
    [_codeButton addTarget:self action:@selector(onCodeCkick) forControlEvents:UIControlEventTouchUpInside];
    [imgC addSubview:_codeButton];
    _codeButton.sd_layout.rightSpaceToView(imgC, 20).leftSpaceToView(_codeNmuber, 0).topSpaceToView(line, 13).heightIs(14);
    
    _GoLoginBtn=[MyButton buttonWithType:UIButtonTypeCustom];
    [_GoLoginBtn setTitle:@"开始" forState:UIControlStateNormal];
    [_GoLoginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _GoLoginBtn.titleLabel.font=[UIFont systemFontOfSize:17];
    _GoLoginBtn.layer.masksToBounds=22;
    _GoLoginBtn.layer.cornerRadius=22;
    _GoLoginBtn.backgroundColor=[self colorWithHexString:@"d8d8d8"];
    [_GoLoginBtn addTarget:self action:@selector(onLoginClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_GoLoginBtn];
    _GoLoginBtn.sd_layout.leftSpaceToView(self.view, 30).topSpaceToView(imgC, 67*autoSizeScaleY).rightSpaceToView(self.view, 30).heightIs(45);
    
    
    NSMutableAttributedString *strString = [[NSMutableAttributedString alloc] initWithString:@"点击开始即表示您同意<<奇拜使用条款>>"];
     [strString addAttribute:NSForegroundColorAttributeName value:[self colorWithHexString:@"3a3a3a"] range:NSMakeRange(0,10)];
     [strString addAttribute:NSForegroundColorAttributeName value:[self colorWithHexString:@"ff4c59"] range:NSMakeRange(10,10)];
    UIButton *termsBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [termsBtn setAttributedTitle:strString forState:UIControlStateNormal];
    termsBtn.titleLabel.font=[UIFont systemFontOfSize:13];
    [termsBtn addTarget:self action:@selector(onTermsClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:termsBtn];
    termsBtn.sd_layout.leftSpaceToView(self.view, 20).rightSpaceToView(self.view, 20).topSpaceToView(_GoLoginBtn, 11).heightIs(15);
    
    
    // Do any additional setup after loading the view.
}
#pragma mark 获取短信验证码
-(void)onCodeCkick{
    
    //获取验证码成功
    [timer invalidate];
    timer = nil;
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(action) userInfo:nil repeats:YES];
}
#pragma mark 定时器方法
-(void)action{
    NSLog(@"sssssss");
    static int i=60;
    if (i>0) {
        i-=1;
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%ds",i]];
        [_codeButton setAttributedTitle:str forState:UIControlStateNormal];
    }else{
        i=60;
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"点击获取验证码"];
        NSRange strRange = {0,[str length]};
        [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:strRange];
        [str addAttribute:NSForegroundColorAttributeName value:[self colorWithHexString:@"a3a3a3"] range:NSMakeRange(0,[str length])];
        [_codeButton setAttributedTitle:str forState:UIControlStateNormal];
        
        [timer invalidate];
        timer = nil;
    }
}
#pragma mark 登录
-(void)onLoginClick{
[self dismissViewControllerAnimated:YES completion:^{
    
}];
}
#pragma mark 捕捉输入框输入内容
-(void)textChange:(UITextField *)tf{

    if ([_codeNmuber.text length]>0&&[_phoneNmuber.text length]==11) {
        _GoLoginBtn.backgroundColor=[self colorWithHexString:@"ff5763"];
    }else{
    _GoLoginBtn.backgroundColor=[self colorWithHexString:@"d8d8d8"];
    }
    
}
#pragma  mark 点击条款执行该方法
-(void)onTermsClick{

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
[self dismissViewControllerAnimated:YES completion:^{
    
}];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [timer invalidate];
    timer = nil;
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
