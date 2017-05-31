//
//  MyViewController.m
//  MyWorShip
//
//  Created by 123 on 2017/5/24.
//  Copyright © 2017年 123. All rights reserved.
//

#import "MyViewController.h"
#import "MyCell.h"
#import "PersonalDataView.h"
@interface MyViewController ()<UITableViewDelegate,UITableViewDataSource,InvitationDelegate,LoginDelegate>
{
    UITableView *_tablleView;
    PersonalDataView *_view;
}

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   //  CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];//状态栏高度
    _tablleView=[[UITableView alloc]initWithFrame:CGRectMake(-(self.view.frame.size.width-94), 0, self.view.frame.size.width-94, self.view.frame.size.height) style:UITableViewStylePlain];
    _tablleView.delegate=self;
    _tablleView.dataSource=self;
    _tablleView.scrollEnabled=NO;
 //   _tablleView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _tablleView.separatorColor=[UIColor clearColor];
    _tablleView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_tablleView];
    [self AnimationDisplay];
    // Do any additional setup after loading the view.
}
#pragma mark 动画
-(void)AnimationDisplay{
[UIView animateWithDuration:0.3 animations:^{
    _tablleView.frame=CGRectMake(0, 0, self.view.frame.size.width-94, self.view.frame.size.height);
    self.view.backgroundColor=[[UIColor clearColor]colorWithAlphaComponent:0.5];
}];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
        {//我的消息
            MessageListViewController *MessageList=[[MessageListViewController alloc]init];
            [self.navigationController pushViewController:MessageList animated:YES];
        }
            break;
        case 1:
        {//我的钱包
            WalletViewController *Wallet=[[WalletViewController alloc]init];
            [self.navigationController pushViewController:Wallet animated:YES];
        }
            break;
        case 2:
        {//我的订单
            MyOrderViewController *MyOrder=[[MyOrderViewController alloc]init];
            [self.navigationController pushViewController:MyOrder animated:YES];
        }
            break;
        case 3:
        {//奇拜商品
            GoodsViewController *Goods=[[GoodsViewController alloc]init];
            [self.navigationController pushViewController:Goods animated:YES];

        }
            break;
        case 4:
        {//邀请好友
            InvitationViewController *Invitation=[[InvitationViewController  alloc]init];
            Invitation.delegate=self;
            [self.navigationController pushViewController:Invitation animated:YES];
        }
            break;
        case 5:
        {//使用指南
            UseGuideViewController *UseGuide=[[UseGuideViewController alloc]init];
            [self.navigationController pushViewController:UseGuide animated:YES];

        }
            break;
        case 6:
        {//关于我们
            AboutUsViewController *AboutUs=[[AboutUsViewController alloc]init];
            [self.navigationController pushViewController:AboutUs animated:YES];
        }
            break;

            
            
        default:
            break;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 52;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==0) {
         return 17;
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 125;
    }
    return 0;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==1) {
         return 7;
    }
    return 0;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyCell *cell=[[MyCell alloc]init];
    cell.name.textColor=[self colorWithHexString:@"000000"];
    switch (indexPath.row) {
        case 0:
        {
            cell.img.image=[UIImage imageNamed:@"icon_news"];
            cell.name.text=@"我的消息";
            cell.view.backgroundColor=[UIColor redColor];
        }
            break;
        case 1:
        {
            cell.img.image=[UIImage imageNamed:@"icon_wallet"];
            cell.name.text=@"我的钱包";
        }
            break;
        case 2:
        {
            cell.img.image=[UIImage imageNamed:@"icon_order"];
            cell.name.text=@"我的订单";
        }
            break;
        case 3:
        {
            cell.img.image=[UIImage imageNamed:@"icon_goods"];
            cell.name.text=@"奇拜商品";
        }
            break;
        case 4:
        {
            cell.img.image=[UIImage imageNamed:@"icon_invite"];
            cell.name.text=@"邀请好友";
        }
            break;
        case 5:
        {
            cell.img.image=[UIImage imageNamed:@"icon_zhinan"];
            cell.name.text=@"使用指南";
        }
            break;
        case 6:
        {
            cell.img.image=[UIImage imageNamed:@"icon_guanyu"];
            cell.name.text=@"关于我们";
        }
            break;
            
            
        default:
            break;
    }
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    _view=[[PersonalDataView alloc]init];
    if (section==0) {
        _view.backgroundColor=[UIColor whiteColor];
        [_view.iconHead setBackgroundImage:[UIImage imageNamed:@"img_touxiang_home"] forState:UIControlStateNormal];
        [_view.iconHead addTarget:self action:@selector(onGoLoginClick) forControlEvents:UIControlEventTouchUpInside];
        _view.name.text=@"15738811111";
        _view.money.text=@"钱包余额:200.00";
    }

    return _view;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=[UIColor whiteColor];
    return view;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=YES;
}
#pragma mark 接收代理方法通知回到首页
-(void)dismiss{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [UIView animateWithDuration:0.3 animations:^{
        _tablleView.frame=CGRectMake(-(self.view.frame.size.width-94), 0, self.view.frame.size.width-94, self.view.frame.size.height);
        self.view.backgroundColor=[[UIColor clearColor]colorWithAlphaComponent:0];
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }];

}
#pragma mark 登录 (点击头像执行该方法)
-(void)onGoLoginClick{
    LoginViewController *Login =[[LoginViewController alloc]init];
    Login.delegate=self;
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:Login];
    [self presentViewController:nav animated:YES completion:^{
        //nav.view.backgroundColor = [[UIColor clearColor] colorWithAlphaComponent:0.5];
    }];
}
#pragma mark 登陆成功代理
-(void)LoginSuccessful{

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
