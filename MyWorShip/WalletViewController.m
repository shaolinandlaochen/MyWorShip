//
//  WalletViewController.m
//  MyWorShip
//
//  Created by 123 on 2017/5/26.
//  Copyright © 2017年 123. All rights reserved.
//

#import "WalletViewController.h"
#import "WalletMoneyCell.h"
#import "WalletOtherCell.h"
#import "TransactionDetailsViewController.h"
@interface WalletViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
}

@end

@implementation WalletViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"我的钱包";
    lfteItemAndColor
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _tableView.separatorColor=[self colorWithHexString:@"d7d7d7"];
    _tableView.backgroundColor=[self colorWithHexString:@"#f3f5f7"];
    [self.view addSubview:_tableView];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=NO;
}
CANCEL
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 139;
    }
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==0) {
        return 110;
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 0;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section==1&&indexPath.row==0) {//进入交易明细
        TransactionDetailsViewController *TransactionDetails=[[TransactionDetailsViewController alloc]init];
        [self.navigationController pushViewController:TransactionDetails animated:YES];
    }else if (indexPath.section==1&&indexPath.row==1){//优惠券
        PreferentialViewController *Preferential=[[PreferentialViewController alloc]init];
        [self.navigationController pushViewController:Preferential animated:YES];
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
 
    return nil;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=[self colorWithHexString:@"f3f5f7"];
    MyButton *btn=[[MyButton alloc]init];
    btn.backgroundColor=[self colorWithHexString:@"ff4c59"];
    btn.titleLabel.font=[UIFont systemFontOfSize:17];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.layer.cornerRadius=6;
    btn.layer.masksToBounds=6;
    [btn setTitle:@"充值" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(onAddMoneyClick) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
    btn.sd_layout.leftSpaceToView(view, 17.5).topSpaceToView(view, 31).bottomSpaceToView(view, 31).rightSpaceToView(view, 17.5);
    return view;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        WalletMoneyCell *cell=[[WalletMoneyCell alloc]init];
        return cell;
    }else{
        WalletOtherCell *cell=[[WalletOtherCell alloc]init];
        if (indexPath.row==0) {
            cell.name.text=@"交易明细";
        }else if (indexPath.row==1){
            cell.name.text=@"我的优惠券";
        }
        return cell;
    
    }
}
#pragma mark 充值
-(void)onAddMoneyClick{

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
