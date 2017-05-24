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
@interface MyViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tablleView;
    PersonalDataView *_view;
}

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];//状态栏高度
    _tablleView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
    _tablleView.delegate=self;
    _tablleView.dataSource=self;
 //   _tablleView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _tablleView.separatorColor=[UIColor clearColor];
    _tablleView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_tablleView];
    _tablleView.sd_layout.leftSpaceToView(self.view, 0).topSpaceToView(self.view, -rectStatus.size.height).bottomSpaceToView(self.view, 0).rightSpaceToView(self.view, 94);

    // Do any additional setup after loading the view.
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 52;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 125;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
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
            cell.img.image=[UIImage imageNamed:@"icon_invite"];
            cell.name.text=@"邀请好友";
        }
            break;
        case 4:
        {
            cell.img.image=[UIImage imageNamed:@"icon_zhinan"];
            cell.name.text=@"使用指南";
        }
            break;
        case 5:
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
    _view.backgroundColor=[UIColor whiteColor];
    [_view.iconHead setBackgroundImage:[UIImage imageNamed:@"img_touxiang_home"] forState:UIControlStateNormal];
    _view.name.text=@"15738811111";
    _view.money.text=@"钱包余额:200.00";
    return _view;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=YES;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
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
