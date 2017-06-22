//
//  ListOfGoodsViewController.m
//  MyWorShip
//
//  Created by 123 on 2017/6/6.
//  Copyright © 2017年 123. All rights reserved.
//

#import "ListOfGoodsViewController.h"
#import "ScanTheGoodsDetailsCell.h"
#import "GoodsDetailsViewController.h"
#import "GoodsRequest.h"
#import "PayViewController.h"
@interface ListOfGoodsViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
}

@end

@implementation ListOfGoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"所有商品";
    lfteItemAndColor
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _tableView.separatorColor=[self colorWithHexString:@"d7d7d7"];
    _tableView.backgroundColor=[self colorWithHexString:@"#f3f5f7"];
    [self.view addSubview:_tableView];
    TheDrop_downRefresh(_tableView, @selector(RequestData))
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=NO;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.dataDic!=nil) {
        
        return 1;
    }
    return 0;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    EquipmentCommodityBaseClass *class=[[EquipmentCommodityBaseClass alloc]initWithDictionary:self.dataDic];
    return class.pagingList.resultList.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    EquipmentCommodityBaseClass *class=[[EquipmentCommodityBaseClass alloc]initWithDictionary:self.dataDic];
    EquipmentCommodityResultList *list=class.pagingList.resultList[indexPath.row];
    GoodsDetailsViewController *GoodsDetails=[[GoodsDetailsViewController alloc]init];
    GoodsDetails.why=@"a";
    GoodsDetails.goodsID=[NSString stringWithFormat:@"%.0f",list.commoditySerial];
    [self.navigationController pushViewController:GoodsDetails animated:YES];
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=[self colorWithHexString:@"f3f5f7"];
    return view;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    EquipmentCommodityBaseClass *class=[[EquipmentCommodityBaseClass alloc]initWithDictionary:self.dataDic];
    static NSString *string=@"indexPath";
    ScanTheGoodsDetailsCell *cell=[tableView dequeueReusableCellWithIdentifier:string];
    if (!cell) {
        cell=[[ScanTheGoodsDetailsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
    }
    EquipmentCommodityResultList *list=class.pagingList.resultList[indexPath.row];
    cell.model=list;
    [cell.image sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",class.imgSrc,list.commodityImagesPath,list.commodityCoverImage]]];
    cell.buyBtn.indexPath=indexPath;
    [cell.buyBtn addTarget:self action:@selector(onGoodsDtaileBuyClick:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

#pragma mark 请求获取数据
-(void)RequestData{

    [GoodsRequest EquipmentCommodityList_page:1 pageSize:100 equipment_uuid:self.equipment_uuid block:^(NSDictionary *dic) {
        EquipmentCommodityBaseClass *class=[[EquipmentCommodityBaseClass alloc]initWithDictionary:[self deleteEmpty:dic]];
        if ([stringFormat(class.code) isEqualToString:@"3"]) {
            self.dataDic=[self deleteEmpty:dic];
            [_tableView reloadData];
        }else{
            [SVProgressHUD showErrorWithStatus:class.msg];
        }
    [_tableView.mj_header endRefreshing];
    }];
    
    
}
#pragma mark 用户点击立即购买执行该方法
-(void)onGoodsDtaileBuyClick:(MyButton *)btn{
    EquipmentCommodityBaseClass *class=[[EquipmentCommodityBaseClass alloc]initWithDictionary:self.dataDic];
    EquipmentCommodityResultList *list=class.pagingList.resultList[btn.indexPath.row];
    PayViewController *Pay=[[PayViewController alloc]init];
    Pay.ResultList=list;
    [self.navigationController pushViewController:Pay animated:YES];

}
CANCEL
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
