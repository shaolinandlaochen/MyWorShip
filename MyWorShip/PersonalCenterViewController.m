//
//  PersonalCenterViewController.m
//  MyWorShip
//
//  Created by 123 on 2017/6/7.
//  Copyright © 2017年 123. All rights reserved.
//

#import "PersonalCenterViewController.h"
#import "PersonalCenterCell.h"
#import "ModifyThNicknameViewController.h"
#import "MyRequest.h"
#import "VerifyTheMobilePhoneViewController.h"
@interface PersonalCenterViewController ()<UITableViewDelegate,UITableViewDataSource,ModifyThNicknameDelegate,SelectADateDelegate>
{
    UITableView *_tableView;
    UIImageView *img;
}

@end

@implementation PersonalCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(onPhoneClick:) name:@"phoneStringNotification" object:nil];
    
    [self CreatViews];
    // Do any additional setup after loading the view.
}
-(void)onPhoneClick:(NSNotification *)not{
    self.phone=(NSString *)not.object;
    [_tableView reloadData];
}
#pragma mark 创建视图
-(void)CreatViews{
    //背景
    img=[[UIImageView alloc]init];
    img.image=[UIImage imageNamed:@"bg_gerenxinxi"];
    img.userInteractionEnabled=YES;
    [self.view addSubview:img];
    img.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).topSpaceToView(self.view, 0).heightIs(305);
    //个人信息title
    UILabel *title=[[UILabel alloc]init];
    title.textColor=[UIColor whiteColor];
    title.font=[UIFont systemFontOfSize:17];
    title.textAlignment=NSTextAlignmentCenter;
    title.text=@"个人信息";
    [img addSubview:title];
    title.sd_layout.leftSpaceToView(img, 100).rightSpaceToView(img, 100).topSpaceToView(img, 34).autoHeightRatio(0);
    //头像
    UIImageView *imgHeadr=[[UIImageView alloc]init];
    imgHeadr.image=[UIImage imageNamed:@"img_touxiang_gerenxinxi"];
    [img addSubview:imgHeadr];
    imgHeadr.sd_layout.leftSpaceToView(img, (self.view.frame.size.width-86)/2).topSpaceToView(img, 98).rightSpaceToView(img, (self.view.frame.size.width-86)/2).heightIs(86);
    //返回按钮
    UIButton *CancelBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [CancelBtn setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateNormal];
    [CancelBtn addTarget:self action:@selector(onCancelBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [img addSubview:CancelBtn];
    CancelBtn.sd_layout.leftSpaceToView(img, 14).topSpaceToView(img, 30).widthIs(20).heightIs(34);
    
    //昵称
    UILabel *name=[[UILabel alloc]init];
    name.textAlignment=NSTextAlignmentCenter;
    name.textColor=[UIColor whiteColor];
    name.font=[UIFont systemFontOfSize:17];
    name.tag=789654;
    [img addSubview:name];
    name.text=self.nickname;
    CGSize nameSize=[MyClass StringHeight:name.text Lblfont:17 heightOfTheMinus:0];
    name.sd_layout.leftSpaceToView(img, (self.view.frame.size.width-nameSize.width)/2).rightSpaceToView(img, (self.view.frame.size.width-nameSize.width)/2).topSpaceToView(imgHeadr, 7).autoHeightRatio(0);
    
    UIImageView *vipImage=[[UIImageView alloc]init];
    
    [img addSubview:vipImage];
    vipImage.sd_layout.leftSpaceToView(name, 2).topSpaceToView(imgHeadr, 8).heightIs(16).widthIs(16);
    if (self.isVip==1) {
        vipImage.image=[UIImage imageNamed:@"img_vip"];
    }
    
    
    //退出登录按钮
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:view];
    view.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).bottomSpaceToView(self.view, 0).heightIs(70);
    
    UIButton *LogOutBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [LogOutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    [LogOutBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    LogOutBtn.titleLabel.font=[UIFont systemFontOfSize:17];
    LogOutBtn.layer.masksToBounds=5;
    LogOutBtn.layer.cornerRadius=5;
    LogOutBtn.backgroundColor=[MyClass colorWithHexString:@"ff4c59"];
    [LogOutBtn addTarget:self action:@selector(onLoginOutClick) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:LogOutBtn];
    LogOutBtn.sd_layout.leftSpaceToView(view, 12).rightSpaceToView(view, 12).bottomSpaceToView(view, 14).topSpaceToView(view, 14);
    
    
    
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.backgroundColor=[self colorWithHexString:@"f3f5f7"];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.scrollEnabled=NO;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _tableView.separatorColor=[self colorWithHexString:@"d7d7d7"];
    [self.view addSubview:_tableView];
    _tableView.sd_layout.leftEqualToView(img).rightEqualToView(img).topSpaceToView(img, 0).bottomSpaceToView(view, 0);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=YES;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 3;
    }
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 49;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==1) {
        return 12;
    }
    return 0;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section==0&&indexPath.row==0) {//修改昵称
        ModifyThNicknameViewController *ModifyThNickname=[[ModifyThNicknameViewController alloc]init];
        ModifyThNickname.delegate=self;
        [self.navigationController pushViewController:ModifyThNickname animated:YES];
    }else if (indexPath.section==0&&indexPath.row==1){
        [self SetUpTheSet];//设置性别
    }else if (indexPath.section==0&&indexPath.row==2){//选择姨妈时间
        SelectADateViewController *SelectADate=[[SelectADateViewController alloc]init];
        SelectADate.delegate=self;
        SelectADate.modalPresentationStyle = UIModalPresentationOverFullScreen;
        [self presentViewController:SelectADate animated:YES completion:^{
            SelectADate.view.backgroundColor = [[UIColor clearColor] colorWithAlphaComponent:0.5];
        }];
    }else if (indexPath.section==1){//更换手机号码
    
        VerifyTheMobilePhoneViewController *VerifyTheMobilePhone=[[VerifyTheMobilePhoneViewController alloc]init];
        VerifyTheMobilePhone.phoneString=self.phone;
        [self.navigationController pushViewController:VerifyTheMobilePhone animated:YES];
        
    }
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=[self colorWithHexString:@"f3f5f7"];
    return view;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *string=@"indexpath";
    PersonalCenterCell *cell=[tableView dequeueReusableCellWithIdentifier:string];
    if (!cell) {
        cell=[[PersonalCenterCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
    }
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            cell.name.text=@"昵称";
            if (self.nickname!=nil) {
                cell.context.text=self.nickname;
            }else{
                cell.context.text=@"未设置";
            }
            
        }else if (indexPath.row==1){
            cell.name.text=@"性别";
            if (self.gender!=nil) {
                cell.context.text=self.gender;
            }else{
                cell.context.text=@"未设置";
            }
        }else if (indexPath.row==2){
            cell.name.text=@"特殊日";
            if (self.time!=nil) {
                cell.context.text=self.time;
            }else{
                cell.context.text=@"未设置";
            }
        }
        
    }else{
        cell.name.text=@"绑定的手机号";
        if (self.phone!=nil) {
            cell.context.text=self.phone;
        }else{
            cell.context.text=@"未绑定";
        }
    }
    return cell;
}
#pragma mark 返回
-(void)onCancelBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark 退出登录
-(void)onLoginOutClick{

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"" forKey:@"token"];
    //同步数据
    [defaults synchronize];
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark 修改昵称成功
-(void)ModifyTheNicknameSuccess:(NSString *)nickName{
    ((UILabel *)[img viewWithTag:789654]).text=nickName;
    self.nickname=nickName;
    [_tableView reloadData];
}
#pragma mark 选择生理期时间完毕的代理通知
-(void)selectTime:(NSString *)timeString{
    
    [SVProgressHUD showWithStatus:loading];
    [MyRequest PhysiologicalPeriodOfTime:timeString BLOCK:^(NSDictionary *dic) {
        LoginsIsBaseClass *class=[[LoginsIsBaseClass alloc]initWithDictionary:[self deleteEmpty:dic]];
        if ([stringFormat(class.code) isEqualToString:@"5"]) {
            self.time=timeString;
            [SVProgressHUD showSuccessWithStatus:class.msg];
            [_tableView reloadData];
        }else{
            [SVProgressHUD showErrorWithStatus:class.msg];
        }
    }];
}
#pragma mark 设置性别
-(void)SetUpTheSet{
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"温馨提示" message:@"请选择您的性别" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action1=[UIAlertAction actionWithTitle:@"男" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [SVProgressHUD showWithStatus:@"正在加载"];
        [MyRequest setSex_base_sex:0 BLOCK:^(NSDictionary *dic) {
            LoginsIsBaseClass *class=[[LoginsIsBaseClass alloc]initWithDictionary:[self deleteEmpty:dic]];
            if ([stringFormat(class.code) isEqualToString:@"5"]) {
                self.gender=@"男";
                [SVProgressHUD showSuccessWithStatus:class.msg];
                [_tableView reloadData];
            }else{
                [SVProgressHUD showErrorWithStatus:class.msg];
            }
            
        }];
    }];
    UIAlertAction *action2=[UIAlertAction actionWithTitle:@"女" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [SVProgressHUD showWithStatus:@"正在加载"];
        [MyRequest setSex_base_sex:1 BLOCK:^(NSDictionary *dic) {
            LoginsIsBaseClass *class=[[LoginsIsBaseClass alloc]initWithDictionary:[self deleteEmpty:dic]];
            if ([stringFormat(class.code) isEqualToString:@"5"]) {
                self.gender=@"女";
                [SVProgressHUD showSuccessWithStatus:class.msg];
                 [_tableView reloadData];
            }else{
                [SVProgressHUD showErrorWithStatus:class.msg];
            }
        }];
    }];
    UIAlertAction *action3=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:action1];
    [alert addAction:action2];
    [alert addAction:action3];
    [self presentViewController:alert animated:YES completion:nil];
    
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
