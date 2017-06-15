//
//  VIPConsumptionRecordViewController.m
//  MyWorShip
//
//  Created by 123 on 2017/6/15.
//  Copyright © 2017年 123. All rights reserved.
//

#import "VIPConsumptionRecordViewController.h"
#import "VIPConsumptionRecordCell.h"
#import "VIPRequest.h"
@interface VIPConsumptionRecordViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
}

@end

@implementation VIPConsumptionRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"VIP免费消费明细";
    lfteItemAndColor
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _tableView.separatorColor=[UIColor clearColor];
    _tableView.backgroundColor=[self colorWithHexString:@"#f3f5f7"];
    [self.view addSubview:_tableView];
    TheDrop_downRefresh(_tableView, @selector(RequestData))
    // Do any additional setup after loading the view.
}
#pragma mark 获取数据
-(void)RequestData{

    [VIPRequest AccessToTheVIPConsumptionRecordDetails_page:1 pageSize:1000 block:^(NSDictionary *dic) {
        VIPRecordsBaseClass *class=[[VIPRecordsBaseClass alloc]initWithDictionary:[self deleteEmpty:dic]];
        if ([stringFormat(class.code) isEqualToString:@"3"]) {
            self.dataDic=[self deleteEmpty:dic];
            [_tableView reloadData];
        }else{
            [SVProgressHUD showErrorWithStatus:class.msg];
        }
        [_tableView.mj_header endRefreshing];
    }];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.dataDic!=nil) {
        return 1;
    }
    return 0;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    VIPRecordsBaseClass *class=[[VIPRecordsBaseClass alloc]initWithDictionary:self.dataDic];
    return class.pagingList.resultList.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 83;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
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
    VIPRecordsBaseClass *class=[[VIPRecordsBaseClass alloc]initWithDictionary:self.dataDic];
    VIPRecordsResultList *list=class.pagingList.resultList[indexPath.row];
    CELLINIT(@"indexPath", VIPConsumptionRecordCell)
    cell.model=list;
    cell.count=class.pagingList.resultList.count;
    cell.indexPath=indexPath;
    
    return cell;
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
