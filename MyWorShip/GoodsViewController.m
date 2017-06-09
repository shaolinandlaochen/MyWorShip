//
//  GoodsViewController.m
//  MyWorShip
//
//  Created by 123 on 2017/5/26.
//  Copyright © 2017年 123. All rights reserved.
//

#import "GoodsViewController.h"
#import "GoodsCell.h"
#import "GoodsRequest.h"
@interface GoodsViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
}

@end

@implementation GoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"月拜商品";
    lfteItemAndColor
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.backgroundColor=[self colorWithHexString:@"f3f5f7"];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _tableView.separatorColor=[self colorWithHexString:@"d7d7d7"];
    [self.view addSubview:_tableView];
    TheDrop_downRefresh(_tableView, @selector(onCreatGoods))
    // Do any additional setup after loading the view.
}
#pragma mark 获取月拜商品
-(void)onCreatGoods{

    [GoodsRequest GetOnGoods:^(NSDictionary *dic) {
        MonthsThanksGoodsBaseClass *class=[[MonthsThanksGoodsBaseClass alloc]initWithDictionary:[self deleteEmpty:dic]];
        if ([stringFormat(class.code) isEqualToString:@"3"]) {
            self.dataDic=[self deleteEmpty:dic];
            [_tableView reloadData];
        }else{
            [SVProgressHUD showErrorWithStatus:class.msg];
        }
        [_tableView.mj_header endRefreshing];
    }];
    
}
CANCEL
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    MonthsThanksGoodsBaseClass *class=[[MonthsThanksGoodsBaseClass alloc]initWithDictionary:[self deleteEmpty:self.dataDic]];
    return class.commodityall.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
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

    static NSString *string=@"indexPath";
    GoodsCell *cell=[tableView dequeueReusableCellWithIdentifier:string];
    if (!cell) {
        cell=[[GoodsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
    }
    MonthsThanksGoodsBaseClass *class=[[MonthsThanksGoodsBaseClass alloc]initWithDictionary:[self deleteEmpty:self.dataDic]];
    MonthsThanksGoodsCommodityall *Commodityall=class.commodityall[indexPath.row];
    cell.model=class.commodityall[indexPath.row];
    [cell.img sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",class.imgSrc,Commodityall.commodityImagesPath,Commodityall.commodityCoverImage]]];
    return cell;
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
