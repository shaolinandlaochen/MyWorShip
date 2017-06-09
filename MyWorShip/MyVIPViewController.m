//
//  MyVIPViewController.m
//  MyWorShip
//
//  Created by 123 on 2017/6/9.
//  Copyright © 2017年 123. All rights reserved.
//

#import "MyVIPViewController.h"
#import "VIPCustomerInformationCell.h"
#import "VIPConsumptionCell.h"
#import "GoodsCell.h"
#import "VIPView.h"
#import "TransactionDetailsViewController.h"
#import "OpenTheVIPViewController.h"
@interface MyVIPViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
}


@end

@implementation MyVIPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"我的VIP";
    lfteItemAndColor
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.backgroundColor=[self colorWithHexString:@"f3f5f7"];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _tableView.separatorColor=[self colorWithHexString:@"d7d7d7"];
    [self.view addSubview:_tableView];
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithTitle:@"VIP特权" style:UIBarButtonItemStylePlain target:self action:@selector(onClickedOKbtn)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];//导航栏左右两边按钮颜色
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:14],NSFontAttributeName, nil] forState:UIControlStateNormal];
    // Do any additional setup after loading the view.
}
CANCEL
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section!=2) {
        return 1;
    }
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 265;
    }else if (indexPath.section==1){
        return 72;
    }
    return 110;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section!=0) {
        return 45;
    }
    return 0;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    VIPView *view=[[VIPView alloc]init];
    view.backgroundColor=[self colorWithHexString:@"ffffff"];
    if (section==1) {
        view.name.text=@"我的消费";
        [view.button setTitle:@"查看明细" forState:UIControlStateNormal];
        [view.button addTarget:self action:@selector(onStatementClick) forControlEvents:UIControlEventTouchUpInside];
    }else if (section==2){
        view.name.text=@"我的特权";
    }
    return view;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=[self colorWithHexString:@"f3f5f7"];
    return view;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        static NSString *string1=@"shting";
        VIPCustomerInformationCell *cell=[tableView dequeueReusableCellWithIdentifier:string1];
        if (!cell) {
            cell=[[VIPCustomerInformationCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string1];
        }
        return cell;
    }else if (indexPath.section==1){
        static NSString *string1=@"shting2";
        VIPConsumptionCell *cell=[tableView dequeueReusableCellWithIdentifier:string1];
        if (!cell) {
            cell=[[VIPConsumptionCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string1];
        }
        cell.number=0;
        return cell;
    }else{
        static NSString *string1=@"shting3";
        GoodsCell *cell=[tableView dequeueReusableCellWithIdentifier:string1];
        if (!cell) {
            cell=[[GoodsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string1];
        }
        
        return cell;
    
    }
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=NO;
}
#pragma mark VIP特权
-(void)onClickedOKbtn{
    OpenTheVIPViewController *OpenTheVIP=[[OpenTheVIPViewController alloc]init];
    OpenTheVIP.isvip=1;
    [self.navigationController pushViewController:OpenTheVIP animated:YES];

}
#pragma mark 消费明细
-(void)onStatementClick{
    TransactionDetailsViewController *TransactionDetails=[[TransactionDetailsViewController alloc]init];
    [self.navigationController pushViewController:TransactionDetails animated:YES];
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
