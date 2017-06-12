//
//  AllCommentsViewController.m
//  MyWorShip
//
//  Created by 123 on 2017/6/8.
//  Copyright © 2017年 123. All rights reserved.
//

#import "AllCommentsViewController.h"
#import "CommentsCell.h"
#import "GoodsRequest.h"
@interface AllCommentsViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
}

@end

@implementation AllCommentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"商品评价";
    lfteItemAndColor
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _tableView.separatorColor=[self colorWithHexString:@"d7d7d7"];
    _tableView.backgroundColor=[self colorWithHexString:@"#f3f5f7"];
    [self.view addSubview:_tableView];
    TheDrop_downRefresh(_tableView, @selector(requestCommData))
    // Do any additional setup after loading the view.
}
#pragma mark 获取全部评价
-(void)requestCommData{

    [GoodsRequest QueryEvaluationOfAllCommodities_serial:self.serial page:@"1" pageSize:@"1000" block:^(NSDictionary *dic) {
        
        EvaluationListBaseClass *class=[[EvaluationListBaseClass alloc]initWithDictionary:[self deleteEmpty:dic]];
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
    EvaluationListBaseClass *class=[[EvaluationListBaseClass alloc]initWithDictionary:self.dataDic];
    return class.listComment.resultList.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    EvaluationListBaseClass *class=[[EvaluationListBaseClass alloc]initWithDictionary:self.dataDic];
    EvaluationListResultList *list=class.listComment.resultList[indexPath.row];
    return [tableView cellHeightForIndexPath:indexPath model:list keyPath:@"list" cellClass:[CommentsCell class] contentViewWidth:self.view.frame.size.width];
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
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=[self colorWithHexString:@"f3f5f7"];

    return view;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    EvaluationListBaseClass *class=[[EvaluationListBaseClass alloc]initWithDictionary:self.dataDic];
    EvaluationListResultList *list=class.listComment.resultList[indexPath.row];
    CELLINIT(@"indexPath3", CommentsCell)
    cell.list=list;
    return cell;
    
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
