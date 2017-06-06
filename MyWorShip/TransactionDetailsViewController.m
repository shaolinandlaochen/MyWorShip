//
//  TransactionDetailsViewController.m
//  MyWorShip
//
//  Created by 123 on 2017/5/26.
//  Copyright © 2017年 123. All rights reserved.
//

#import "TransactionDetailsViewController.h"
#import "TransactionDetailsCell.h"
#import "MoneyRequest.h"
@interface TransactionDetailsViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    NSInteger index;
}

@end

@implementation TransactionDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"交易明细";
    index=0;
    lfteItemAndColor
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _tableView.separatorColor=[self colorWithHexString:@"d7d7d7"];
    _tableView.backgroundColor=[self colorWithHexString:@"#f3f5f7"];
    [self.view addSubview:_tableView];
    TheDrop_downRefresh(_tableView, @selector(QuerastData))
    //[self NULLData];
    // Do any additional setup after loading the view.
}
#pragma mark 请求获取数据
-(void)QuerastData{
    NSString *url=@"";
    if (index==0) {//消费明细
      url=@"querycdetail";
    }else{//充值明细
        url=@"querycrecharge";
    }
    [MoneyRequest Top_upDetail_url:url Page:@"1" pageSize:@"1000" start:@"2017-06-01" end:@"2077-06-01" Block:^(NSDictionary *dic) {
        self.dataDic=[self deleteEmpty:dic];
        Top_up_detailBaseClass *class=[[Top_up_detailBaseClass alloc]initWithDictionary:self.dataDic];
        if ([stringFormat(class.code) isEqualToString:@"3"]) {
            
        }else{
            [SVProgressHUD showErrorWithStatus:class.msg];
        }
        [_tableView reloadData];
        [_tableView.mj_header endRefreshing];
        [SVProgressHUD dismiss];
    }];


}
#pragma mark 创建无数据视图
-(void)NULLData{
    UIImageView *img=[[UIImageView alloc]init];
    img.tag=852;
    img.image=[UIImage imageNamed:@"img_nomingxi"];
    [self.view addSubview:img];
    img.sd_layout.leftSpaceToView(self.view, (WIDTH-125)/2).topSpaceToView(self.view, 150).rightSpaceToView(self.view, (WIDTH-125)/2).heightIs(125);
    UILabel *lbl=[[UILabel alloc]init];
    lbl.text=@"您还没有进行过交易呢~";
    lbl.textColor=[self colorWithHexString:@"a3a3a3"];
    lbl.font=[UIFont systemFontOfSize:14];
    lbl.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:lbl];
    lbl.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).topSpaceToView(img, 19).autoHeightRatio(0);
    
}
CANCEL
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (index==0) {
        StatementBaseClass *class=[[StatementBaseClass alloc]initWithDictionary:self.dataDic];
         return class.pagingList.resultList.count;
    }else{
    Top_up_detailBaseClass *class=[[Top_up_detailBaseClass alloc]initWithDictionary:self.dataDic];
        return class.pagingList.resultList.count;
    }
   
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 65;
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
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=[UIColor whiteColor];
    for (int i=0; i<2; i++) {
        MyButton *btn=[MyButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor=[UIColor whiteColor];
        btn.tag=i+1;
        [btn setTitleColor:[self colorWithHexString:@"000000"] forState:UIControlStateNormal];
        [btn setTitleColor:[self colorWithHexString:@"ff4c59"] forState:UIControlStateSelected];
        btn.titleLabel.font=[UIFont systemFontOfSize:15];
        if (i==0) {
            [btn setTitle:@"消费明细" forState:UIControlStateNormal];
        }else{
            [btn setTitle:@"充值明细" forState:UIControlStateNormal];
        }
        if (i==index) {
            btn.selected=YES;
        }
        [btn addTarget:self action:@selector(onbtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btn];
        btn.sd_layout.leftSpaceToView(view, (WIDTH/2)*i).bottomSpaceToView(view, 3).heightIs(42).widthIs(WIDTH/2);
    }
    UILabel *line=[[UILabel alloc]init];
    line.backgroundColor=[self colorWithHexString:@"de0024"];
    [view addSubview:line];
    if (index==0) {
        line.sd_layout.leftSpaceToView(view, 0).bottomSpaceToView(view, 1).heightIs(1.5).widthIs(WIDTH/2);
    }else{
        line.sd_layout.leftSpaceToView(view, WIDTH/2).bottomSpaceToView(view, 1).heightIs(1.5).widthIs(WIDTH/2);
    }
    
    UIView *lllll=[[UIView alloc]init];
    lllll.backgroundColor=[self colorWithHexString:@"d7d7d7"];
    [view addSubview:lllll];
    lllll.sd_layout.leftSpaceToView(view, 0).rightSpaceToView(view, 0).bottomSpaceToView(view, 0).heightIs(0.5);
    
    return view;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *string=@"indexpath";
    
    TransactionDetailsCell *cell=[tableView dequeueReusableCellWithIdentifier:string];
    if (!cell) {
        cell=[[TransactionDetailsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
    }
    if (index==0) {
        StatementBaseClass *class=[[StatementBaseClass alloc]initWithDictionary:self.dataDic];
        StatementResultList *list=class.pagingList.resultList[indexPath.row];
        cell.title.text=stringFormat(list.remark);
        cell.time.text=stringFormat(list.cwalletTime);
        cell.money.text=[NSString stringWithFormat:@"-%.2f元",list.cwalletAmount];
    }else{
        Top_up_detailBaseClass *class=[[Top_up_detailBaseClass alloc]initWithDictionary:self.dataDic];
        Top_up_detailResultList *list=class.pagingList.resultList[indexPath.row];
        cell.title.text=stringFormat(list.rechargeDescribe);
        cell.time.text=stringFormat(list.rechargeTime);
        cell.money.text=[NSString stringWithFormat:@"+%.2f元",list.rechargeAmount];
    }


    return cell;
}
-(void)onbtnClick:(MyButton *)btn{
    index=btn.tag-1;
    [SVProgressHUD showWithStatus:loading];
    [self QuerastData];
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
