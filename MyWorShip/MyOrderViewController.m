//
//  MyOrderViewController.m
//  MyWorShip
//
//  Created by 123 on 2017/5/26.
//  Copyright © 2017年 123. All rights reserved.
//

#import "MyOrderViewController.h"
#import "OrderCell.h"
#import "OrderRequest.h"
#import "EvaluationViewController.h"
@interface MyOrderViewController ()<UITableViewDelegate,UITableViewDataSource,EvaluationDelegate>
{
    UITableView *_tableView;
    NSInteger index;
}

@end

@implementation MyOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"我的订单";
    lfteItemAndColor
    index=0;
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.backgroundColor=[self colorWithHexString:@"f3f5f7"];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _tableView.separatorColor=[self colorWithHexString:@"d7d7d7"];
    [self.view addSubview:_tableView];
    _tableView.sd_layout.leftSpaceToView(self.view, 12).topSpaceToView(self.view, 45).rightSpaceToView(self.view, 12).bottomSpaceToView(self.view, 0);
    

    TheDrop_downRefresh(_tableView, @selector(ToObtainAListOrder))
    NAVHEIGHT
    RECTSTATUS
    NSArray *array=@[@"全部",@"未完成",@"未评论",@"已取消"];
    for (int i=0; i<4; i++) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag=i+1;
        btn.backgroundColor=[UIColor whiteColor];
        [btn setTitle:array[i] forState:UIControlStateNormal];
        if (i==index) {
            [btn setTitleColor:[MyClass colorWithHexString:@"ff4c59"] forState:UIControlStateNormal];
        }else{
            [btn setTitleColor:[MyClass colorWithHexString:@"000000"] forState:UIControlStateNormal];
        }
        btn.titleLabel.font=[UIFont systemFontOfSize:15];
        [btn addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        btn.sd_layout.leftSpaceToView(self.view, (WIDTH/4)*i).widthIs(WIDTH/4).topSpaceToView(self.view, navheight+rectStatus.size.height).heightIs(43);
        
        
        UILabel *line=[[UILabel alloc]init];
        line.tag=10+i;
        if (i==0) {
            line.backgroundColor=[MyClass colorWithHexString:@"ff4c59"];
        }else{
            line.backgroundColor=[UIColor clearColor];
        }
        [self.view addSubview:line];
        line.sd_layout.leftSpaceToView(self.view, (WIDTH/4)*i).widthIs(WIDTH/4).topSpaceToView(self.view, navheight+rectStatus.size.height+43).heightIs(2);
    }

    // Do any additional setup after loading the view.
}
//评论完毕
-(void)EvaluationAfterEvaluation{
    [self ToObtainAListOrder];
}
#pragma mark 加载数据
-(void)ToObtainAListOrder{
    NSString *type;
    if (index==0) {
        type=@"all";
    }else if (index==1){
        type=@"undone";
    }else if (index==2){
        type=@"iscomment";
    }else if (index==3){
        type=@"cancelled";
    }
[OrderRequest ToObtainAListOrder_page:1 pageSize:1000 type:type block:^(NSDictionary *dic) {
    [_tableView.mj_header endRefreshing];
    OrderBaseClass *class=[[OrderBaseClass alloc]initWithDictionary:[self deleteEmpty:dic]];
    if ([stringFormat(class.code) isEqualToString:@"3"]) {
        self.dataDic=[self deleteEmpty:dic];
        [_tableView reloadData];
    }else{
        [SVProgressHUD showErrorWithStatus:class.msg];
    }
}];
}
CANCEL
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=NO;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.dataDic!=nil) {
        OrderBaseClass *class=[[OrderBaseClass alloc]initWithDictionary:self.dataDic];
        return class.pagingList.resultList.count;
    }
    return 0;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    OrderBaseClass *class=[[OrderBaseClass alloc]initWithDictionary:self.dataDic];
    OrderResultList *list=class.pagingList.resultList[indexPath.section];
   
    if (list.orderState==1) {//已付款未发货
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"温馨提示" message:@"请选择取消订单理由" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action1=[UIAlertAction actionWithTitle:@"设备故障" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            [SVProgressHUD showWithStatus:loading];
            [OrderRequest CancelTheOrder_order_refund_cause:@"0" order_serial:[NSString stringWithFormat:@"%.0f",list.orderSerial] block:^(NSDictionary *dic) {
                LoginsIsBaseClass *class=[[LoginsIsBaseClass alloc]initWithDictionary:[self deleteEmpty:dic]];
                if ([stringFormat(class.code) isEqualToString:@"31"]) {
                    [self ToObtainAListOrder];
                    [SVProgressHUD showSuccessWithStatus:class.msg];
                }else{
                    [SVProgressHUD showErrorWithStatus:class.msg];
                }
            }];
            
        }];
        UIAlertAction *action2=[UIAlertAction actionWithTitle:@"出货超时" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            [SVProgressHUD showWithStatus:loading];
            [OrderRequest CancelTheOrder_order_refund_cause:@"0" order_serial:[NSString stringWithFormat:@"%.0f",list.orderSerial] block:^(NSDictionary *dic) {
                LoginsIsBaseClass *class=[[LoginsIsBaseClass alloc]initWithDictionary:[self deleteEmpty:dic]];
                if ([stringFormat(class.code) isEqualToString:@"31"]) {
                    [SVProgressHUD showSuccessWithStatus:class.msg];
                    [self ToObtainAListOrder];
                }else{
                    [SVProgressHUD showErrorWithStatus:class.msg];
                }
            }];
        }];
        UIAlertAction *action3=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"加粗(取消)");
        }];
        [alert addAction:action1];
        [alert addAction:action2];
        [alert addAction:action3];
        [self presentViewController:alert animated:YES completion:nil];
    }else if (list.orderState==2){//已发货未评价

        EvaluationViewController *Evaluation=[[EvaluationViewController alloc]init];
        Evaluation.delegate=self;
        Evaluation.name=stringFormat(list.commodityName);
        Evaluation.money=[NSString stringWithFormat:@"%.2f",list.orderAmount];
        Evaluation.imgUrl=[NSString stringWithFormat:@"%@%@%@",class.imgSrc,list.commodityImagesPath,list.commodityCoverImage];
        Evaluation.order_serial=[NSString stringWithFormat:@"%.0f",list.orderSerial];
        Evaluation.commodity_serial=[NSString stringWithFormat:@"%.0f",list.commoditySerial];
        [self.navigationController pushViewController:Evaluation animated:YES];
    }
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=[self colorWithHexString:@"f3f5f7"];
    return view;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    OrderBaseClass *class=[[OrderBaseClass alloc]initWithDictionary:self.dataDic];
    OrderResultList *list=class.pagingList.resultList[indexPath.section];
    CELLINIT(@"nidexpath", OrderCell)
    cell.time.text=stringFormat(list.orderTime);
    NSMutableAttributedString *str2 = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"¥%.1f",list.orderAmount]];
    [str2 addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial" size:14] range:NSMakeRange(0, 1)];
    [str2 addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial" size:25] range:NSMakeRange(1, [[NSString stringWithFormat:@"%.1f",list.orderAmount] length])];
    cell.money.attributedText=str2;
    cell.location.text=stringFormat(list.equipmentAddress);
    cell.name.text=stringFormat(list.commodityName);
    if (list.orderState==1) {//已付款未发货
        cell.imgRight.image=[UIImage imageNamed:@"icon_right"];
        cell.state.text=@"取消订单";
        cell.state.textColor=[MyClass colorWithHexString:@"a3a3a3"];
    }else if (list.orderState==2){//已发货未评价
        cell.imgRight.image=[UIImage imageNamed:@"icon_right"];
        cell.state.text=@"去评论";
        cell.state.textColor=[MyClass colorWithHexString:@"a3a3a3"];
    }else if (list.orderState==3){//
        cell.imgRight.image=[UIImage imageNamed:@""];
        cell.state.text=@"已完成";
        cell.state.textColor=[MyClass colorWithHexString:@"a3a3a3"];
    }else if (list.orderState==4){
        cell.imgRight.image=[UIImage imageNamed:@""];
        cell.state.text=@"退款成功";
        cell.state.textColor=[MyClass colorWithHexString:@"a3a3a3"];
    }else if (list.orderState==-1){
        cell.imgRight.image=[UIImage imageNamed:@""];
        cell.state.text=@"退款成功";
        cell.state.textColor=[MyClass colorWithHexString:@"a3a3a3"];
    }else if (list.orderState==-2){
        cell.imgRight.image=[UIImage imageNamed:@""];
        cell.state.text=@"处理中";
        cell.state.textColor=[MyClass colorWithHexString:@"a3a3a3"];
    }else if (list.orderState==-3){
        cell.imgRight.image=[UIImage imageNamed:@""];
        cell.state.text=@"退款失败";
        cell.state.textColor=[MyClass colorWithHexString:@"a3a3a3"];
    }
    



    return cell;
}
#pragma mark 筛选
-(void)onButtonClick:(UIButton *)btn{
    if (btn.tag==index+1) {
        return;
    }else{
    
        index=btn.tag-1;
        for (int i=0; i<4; i++) {
            [((UIButton *)[self.view viewWithTag:i+1]) setTitleColor:[MyClass colorWithHexString:@"000000"] forState:UIControlStateNormal];
            ((UILabel *)[self.view viewWithTag:i+10]).backgroundColor=[UIColor clearColor];
        }
        [((UIButton *)[self.view viewWithTag:index+1]) setTitleColor:[MyClass colorWithHexString:@"ff4c59"] forState:UIControlStateNormal];
        ((UILabel *)[self.view viewWithTag:btn.tag+9]).backgroundColor=[MyClass colorWithHexString:@"ff4c59"];
        [self ToObtainAListOrder];
    }
    

    
    
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
