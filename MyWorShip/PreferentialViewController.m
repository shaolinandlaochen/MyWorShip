//
//  PreferentialViewController.m
//  MyWorShip
//
//  Created by 123 on 2017/5/25.
//  Copyright © 2017年 123. All rights reserved.
//

#import "PreferentialViewController.h"
#import "PreferentialCell.h"
#import "PreferentialView.h"
#import "CouponsRequest.h"
@interface PreferentialViewController ()<UITableViewDelegate,UITableViewDataSource,PreferentiaDelegate>
{
    UITableView *_tableView;
    NSInteger index;
}

@end

@implementation PreferentialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"我的优惠券";
    index=0;//默认有效的
    self.view.backgroundColor=[self colorWithHexString:@"f3f5f7"];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:[self colorWithHexString:@"ffffff"]}];
    [self.navigationController.navigationBar setBarTintColor:[[UIColor blackColor]colorWithAlphaComponent:0.9]];
    MyButton *leftCancelItem=[MyButton buttonWithType:UIButtonTypeCustom];
    [leftCancelItem setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateNormal];
    [leftCancelItem addTarget:self  action:@selector(onCancelClick) forControlEvents:UIControlEventTouchUpInside];
    [leftCancelItem sizeToFit];
    UIBarButtonItem *informationCardItem = [[UIBarButtonItem alloc] initWithCustomView:leftCancelItem];
    self.navigationItem.leftBarButtonItems  = @[informationCardItem];
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.backgroundColor=[self colorWithHexString:@"f3f5f7"];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    //_tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _tableView.separatorColor=[UIColor clearColor];
    [self.view addSubview:_tableView];
    TheDrop_downRefresh(_tableView, @selector(onCreatData))
    //[self NULLData];
    // Do any additional setup after loading the view.
}
-(void)onCreatData{

    [CouponsRequest ToObtainCouponsList_page:1 pageSize:200 coupon_state:index block:^(NSDictionary *dic) {
        CouponsListBaseClass *class=[[CouponsListBaseClass alloc]initWithDictionary:[self deleteEmpty:dic]];
        if ([stringFormat(class.code) isEqualToString:@"3"]) {
            if (class.pagingList.resultList.count<1) {
                [self NULLData];
            }else{
                [[self.view viewWithTag:999]removeFromSuperview];
                [[self.view viewWithTag:888]removeFromSuperview];
            }
        }else{
        [SVProgressHUD showInfoWithStatus:class.msg];
        }
        self.dataDic=[self deleteEmpty:dic];
        [_tableView reloadData];
        [_tableView.mj_header endRefreshing];
        [SVProgressHUD dismiss];
    }];
}
#pragma mark 无数据
-(void)NULLData{

    UIImageView *img=[[UIImageView alloc]init];
    img.image=[UIImage imageNamed:@"img_noyouhui"];
    img.tag=999;
    [self.view addSubview:img];
    img.sd_layout.leftSpaceToView(self.view, (WIDTH-125)/2).topSpaceToView(self.view, 160).rightSpaceToView(self.view, (WIDTH-125)/2);
    UILabel *lbl=[[UILabel alloc]init];
    lbl.textColor=[self colorWithHexString:@"a3a3a3"];
    lbl.font=[UIFont systemFontOfSize:14];
    lbl.tag=888;
    lbl.textAlignment=NSTextAlignmentCenter;
    lbl.text=@"您还没有优惠券呢~";
    [self.view addSubview:lbl];
    lbl.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).topSpaceToView(img, 22).autoHeightRatio(0);
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    CouponsListBaseClass *class=[[CouponsListBaseClass alloc]initWithDictionary:[self deleteEmpty:self.dataDic]];
    return class.pagingList.resultList.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 45;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    PreferentialView *view=[[PreferentialView alloc]init];
    view.delegate=self;
    view.array=@[@"未使用",@"已使用",@"已过期"];
    view.idx=index;
    return view;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PreferentialCell *cell=[[PreferentialCell alloc]init];
    CouponsListBaseClass *class=[[CouponsListBaseClass alloc]initWithDictionary:[self deleteEmpty:self.dataDic]];
    CouponsListResultList *list=class.pagingList.resultList[indexPath.row];
    if (index==0) {
        cell.bjImage.image=[UIImage imageNamed:@"bg_unused"];
        cell.name.textColor=[self colorWithHexString:@"000000"];
        cell.time.textColor=[self colorWithHexString:@"000000"];
        cell.money.textColor=[self colorWithHexString:@"ff4c59"];
        cell.conditions.text=stringFormat(list.couponName);
    }else if (index==1){
        cell.bjImage.image=[UIImage imageNamed:@"bg_used"];
        cell.typeImage.image=[UIImage imageNamed:@"img_used"];
        cell.name.textColor=[self colorWithHexString:@"a3a3a3"];
        cell.time.textColor=[self colorWithHexString:@"a3a3a3"];
        cell.money.textColor=[self colorWithHexString:@"a3a3a3"];
    }else if (index==2){
        cell.bjImage.image=[UIImage imageNamed:@"bg_expired"];
        cell.typeImage.image=[UIImage imageNamed:@"img_expired"];
        cell.name.textColor=[self colorWithHexString:@"cdc7c7"];
        cell.time.textColor=[self colorWithHexString:@"cdc7c7"];
        cell.money.textColor=[self colorWithHexString:@"cdc7c7"];
    }
    
    if (list.couponType==0) {
    cell.name.text=@"月拜共享·满减券";
    }else if (list.couponType==1){
    cell.name.text=@"月拜共享·折扣券";
    }else if (list.couponType==2){
    cell.name.text=@"月拜共享·抵用券";
    }
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%.1f",list.couponDiscount]];
     [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14] range:NSMakeRange(1, 2)];
    [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldItalicMT" size:45] range:NSMakeRange(0, 3)];
    cell.money.attributedText=str;
    
    cell.time.text=stringFormat(list.couponExpireTime);
    cell.backgroundColor=[self colorWithHexString:@"f3f5f7"];
    return cell;
}
#pragma mark 返回
-(void)onCancelClick{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark 点击筛选按钮执行该方法
-(void)state:(NSInteger)idx{
    index=idx;
    [SVProgressHUD showWithStatus:loading];
    [self onCreatData];
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
