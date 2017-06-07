//
//  PersonalCenterViewController.m
//  MyWorShip
//
//  Created by 123 on 2017/6/7.
//  Copyright © 2017年 123. All rights reserved.
//

#import "PersonalCenterViewController.h"
#import "PersonalCenterCell.h"
@interface PersonalCenterViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
}

@end

@implementation PersonalCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    
    [self CreatViews];
    // Do any additional setup after loading the view.
}
#pragma mark 创建视图
-(void)CreatViews{
    //背景
    UIImageView *img=[[UIImageView alloc]init];
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
    [img addSubview:name];
    name.text=self.nickname;
    name.sd_layout.leftSpaceToView(img, 10).rightSpaceToView(img, 10).topSpaceToView(imgHeadr, 7).autoHeightRatio(0);
    
    
    
    
    
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
            cell.name.text=@"姓名";
            if (self.name!=nil) {
                cell.context.text=self.name;
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
