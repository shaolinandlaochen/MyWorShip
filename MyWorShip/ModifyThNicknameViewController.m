//
//  ModifyThNicknameViewController.m
//  MyWorShip
//
//  Created by 123 on 2017/6/7.
//  Copyright © 2017年 123. All rights reserved.
//

#import "ModifyThNicknameViewController.h"
#import "MyRequest.h"
@interface ModifyThNicknameViewController ()
{
    UITextField *textFied;
}
@end

@implementation ModifyThNicknameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"修改昵称";
    lfteItemAndColor
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(onClickedOKbtn)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];//导航栏左右两边按钮颜色
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:14],NSFontAttributeName, nil] forState:UIControlStateNormal];
    


    NAVHEIGHT
    RECTSTATUS
    
    textFied=[[UITextField alloc]init];
    textFied.borderStyle = UITextBorderStyleRoundedRect;
    textFied.placeholder=@"   请输入您的新昵称";
    textFied.textColor=[MyClass colorWithHexString:@"000000"];
    textFied.font=[UIFont systemFontOfSize:15];
    [self.view addSubview:textFied];
    textFied.sd_layout.leftSpaceToView(self.view, 3).topSpaceToView(self.view, navheight+20+rectStatus.size.height).rightSpaceToView(self.view, 3).heightIs(48);
    // Do any additional setup after loading the view.
}
CANCEL
#pragma mark 保存
-(void)onClickedOKbtn{
    if ([textFied.text length]>0) {
        [SVProgressHUD showWithStatus:@"正在加载"];
        [MyRequest NicknameChange_base_is_nickname:textFied.text BLOCK:^(NSDictionary *dic) {
            LoginsIsBaseClass *class=[[LoginsIsBaseClass alloc]initWithDictionary:[self deleteEmpty:dic]];
            if ([stringFormat(class.code) isEqualToString:@"5"]) {
                [_delegate ModifyTheNicknameSuccess:textFied.text];
                [self.navigationController popViewControllerAnimated:YES];
                 [SVProgressHUD showSuccessWithStatus:class.msg];
            }else{
             [SVProgressHUD showInfoWithStatus:class.msg];
            }
           
           
        }];
    }else{
        [SVProgressHUD showErrorWithStatus:@"请填写昵称"];
    }
    

}
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
