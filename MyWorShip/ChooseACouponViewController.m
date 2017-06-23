//
//  ChooseACouponViewController.m
//  MyWorShip
//
//  Created by 123 on 2017/6/23.
//  Copyright © 2017年 123. All rights reserved.
//

#import "ChooseACouponViewController.h"
#import "ChooseACouponCell.h"
@interface ChooseACouponViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
}

@end

@implementation ChooseACouponViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.backgroundColor=[self colorWithHexString:@"f3f5f7"];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.layer.masksToBounds=10;
    _tableView.layer.cornerRadius=10;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _tableView.separatorColor=[self colorWithHexString:@"d7d7d7"];
    [self.view addSubview:_tableView];
    _tableView.sd_layout.leftSpaceToView(self.view, 60).topSpaceToView(self.view, 100).rightSpaceToView(self.view, 60).bottomSpaceToView(self.view, 100);
    // Do any additional setup after loading the view.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
   
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return  self.model.couponList.count+1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    [self dismissViewControllerAnimated:YES completion:^{
        [_delegate Choose_a_coupon:indexPath.row];
    }];
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=[self colorWithHexString:@"f3f5f7"];
    UILabel *lbl=[[UILabel alloc]init];
    lbl.text=@"请选取优惠券";
    lbl.textAlignment=NSTextAlignmentCenter;
    lbl.font=[UIFont systemFontOfSize:15];
    lbl.textColor=[MyClass colorWithHexString:@"a3a3a3"];
    [view addSubview:lbl];
    lbl.sd_layout.leftSpaceToView(view, 0).rightSpaceToView(view, 0).topSpaceToView(view, 0).bottomSpaceToView(view, 0);
    
    return view;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CELLINIT(@"indexPath", ChooseACouponCell)
    if (indexPath.row<self.model.couponList.count) {
        CouponList *list=self.model.couponList[indexPath.row];
        cell.name.text=stringFormat(list.couponName);
    }else{
    cell.name.text=@"暂不使用优惠券";
    }
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
