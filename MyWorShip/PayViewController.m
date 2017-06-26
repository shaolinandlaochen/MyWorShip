//
//  PayViewController.m
//  MyWorShip
//
//  Created by 123 on 2017/6/13.
//  Copyright © 2017年 123. All rights reserved.
//

#import "PayViewController.h"
#import "TopUpAmountViewController.h"
#import "ShipmentViewController.h"
#import "PayCell.h"
#import "BuyRequest.h"
#import "ChooseACouponViewController.h"
#import "OrderBuyBaseClass.h"
@interface PayViewController ()<UITableViewDelegate,UITableViewDataSource,ChooseACouponDelegate>
{
    UITableView *_tableView;
}
@end

@implementation PayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"支付";
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
#pragma mark 查询数据
-(void)onCreatGoods{
    [BuyRequest TheWalletPaymentInformationQuery_commodity_serial:self.commodity_serial Block:^(NSDictionary *dic) {
        BaseClass *class=[[BaseClass alloc]initWithDictionary:[self deleteEmpty:dic]];
        if ([stringFormat(class.code) isEqualToString:@"3"]) {
            self.dataDic=[self deleteEmpty:dic];
            if (class.couponList.count>0&&class.freeCount<1) {//如果不是可以免费消费的商品和有优惠券条件满足就进入该方法
                CouponList *monsy=class.couponList[0];
                self.coupon_id=[NSString stringWithFormat:@"%.0f",monsy.couponListIdentifier];
                if (monsy.couponType==0||monsy.couponType==2) {//满减,抵用
                    self.ActualConsumptionAmount=class.commoditySellprice-monsy.couponSubtractAmount;
                }else if (monsy.couponType==1){//折扣
                    self.ActualConsumptionAmount=class.commoditySellprice*monsy.couponDiscount;
                }
                self.DiscountAmount=class.commoditySellprice-self.ActualConsumptionAmount;//优惠的金额
            }else{
            self.ActualConsumptionAmount=class.commoditySellprice;
            }
            [_tableView reloadData];
        }else{
            [SVProgressHUD showErrorWithStatus:stringFormat(class.msg)];
        }
        [_tableView.mj_header endRefreshing];
    }];
    
}
// mark 选择优惠券
-(void)Choose_a_coupon:(NSInteger)index{
    BaseClass *class=[[BaseClass alloc]initWithDictionary:self.dataDic];
    if (index<class.couponList.count) {
        CouponList *monsy=class.couponList[index];
        self.coupon_id=[NSString stringWithFormat:@"%.0f",monsy.couponListIdentifier];
        if (monsy.couponType==0||monsy.couponType==2) {//满减,抵用
            self.ActualConsumptionAmount=class.commoditySellprice-monsy.couponSubtractAmount;
        }else if (monsy.couponType==1){//折扣
            self.ActualConsumptionAmount=class.commoditySellprice*monsy.couponDiscount;
        }
        self.DiscountAmount=class.commoditySellprice-self.ActualConsumptionAmount;//优惠的金额
    }else{
        self.ActualConsumptionAmount=class.commoditySellprice;
        self.DiscountAmount=0;
        self.coupon_id=nil;
    }
    [_tableView reloadData];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.dataDic!=nil) {
        return 1;
    }
    return 0;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    BaseClass *class=[[BaseClass alloc]initWithDictionary:self.dataDic];
    if (indexPath.row==1) {
        if (class.couponList.count>0&&class.freeCount<1) {
            return 50;
        }else{
            return 0;
        }
    }
    return 50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 107;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 100;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row==1) {
        BaseClass *class=[[BaseClass alloc]initWithDictionary:self.dataDic];
        ChooseACouponViewController *ChooseACoupon=[[ChooseACouponViewController alloc]init];
        ChooseACoupon.delegate=self;
        ChooseACoupon.model=class;
        ChooseACoupon.modalPresentationStyle = UIModalPresentationOverFullScreen;
        [self presentViewController:ChooseACoupon animated:YES completion:^{
            ChooseACoupon.view.backgroundColor = [[UIColor clearColor] colorWithAlphaComponent:0.5];
        }];
    }
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view=[[UIView alloc]init];
    BaseClass *class=[[BaseClass alloc]initWithDictionary:self.dataDic];
    view.backgroundColor=[self colorWithHexString:@"f3f5f7"];
    UILabel *lblOne=[[UILabel alloc]init];
    lblOne.textColor=[MyClass colorWithHexString:@"000000"];
    lblOne.font=[UIFont systemFontOfSize:17];
    lblOne.textAlignment=NSTextAlignmentCenter;
    lblOne.text=@"账户余额";
    [view addSubview:lblOne];
    lblOne.sd_layout.leftSpaceToView(view, 0).rightSpaceToView(view, 0).topSpaceToView(view, 29).autoHeightRatio(0);
    
    
    UILabel *money=[[UILabel alloc]init];
    money.textColor=[MyClass colorWithHexString:@"000000"];
    money.font=[UIFont systemFontOfSize:17];
    money.textAlignment=NSTextAlignmentCenter;
    money.text=[NSString stringWithFormat:@"¥%.2f",class.remain];
    [view addSubview:money];
    money.sd_layout.leftSpaceToView(view, 0).rightSpaceToView(view, 0).topSpaceToView(lblOne, 10).autoHeightRatio(0);
    
    UILabel *message=[[UILabel alloc]init];
    message.textColor=[MyClass colorWithHexString:@"ff4c59"];
    message.font=[UIFont systemFontOfSize:12];
    message.textAlignment=NSTextAlignmentCenter;
    if (class.freeCount>0) {
        message.text=[NSString stringWithFormat:@"VIP免费消费次数本月剩余:%.0f次",class.freeCount];
    }
    
    [view addSubview:message];
    message.sd_layout.leftSpaceToView(view, 0).rightSpaceToView(view, 0).bottomSpaceToView(view, 12).autoHeightRatio(0);
    return view;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=[self colorWithHexString:@"f3f5f7"];
    UIButton *buyBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    buyBtn.backgroundColor=[MyClass colorWithHexString:@"ff4c59"];
    [buyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    buyBtn.titleLabel.font=[UIFont systemFontOfSize:17];
    buyBtn.layer.masksToBounds=5;
    buyBtn.layer.cornerRadius=5;
    [buyBtn setTitle:@"确认支付" forState:UIControlStateNormal];
    [buyBtn addTarget:self action:@selector(onBuyClick) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:buyBtn];
    buyBtn.sd_layout.leftSpaceToView(view, 17).topSpaceToView(view, 22.5).heightIs(47).rightSpaceToView(view, 17);
    
    BaseClass *class=[[BaseClass alloc]initWithDictionary:self.dataDic];
    if (class.remain<class.commoditySellprice) {//可用余额小于商品价格
        UIButton *top_upBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [top_upBtn addTarget:self action:@selector(onTop_UpClick) forControlEvents:UIControlEventTouchUpInside];
        top_upBtn.titleLabel.font=[UIFont systemFontOfSize:13];
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"余额不足请充值"];
        [str addAttribute:NSForegroundColorAttributeName value:[self colorWithHexString:@"ff4c59"] range:NSMakeRange(5,2)];
        [str addAttribute:NSForegroundColorAttributeName value:[self colorWithHexString:@"a3a3a3"] range:NSMakeRange(0,5)];
        [top_upBtn setAttributedTitle:str forState:UIControlStateNormal];
        [view addSubview:top_upBtn];
        top_upBtn.sd_layout.leftSpaceToView(view, (WIDTH-100)/2).topSpaceToView(buyBtn, 13).widthIs(100).heightIs(15);
    }

    return view;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CELLINIT(@"indexPath", PayCell)

    BaseClass *class=[[BaseClass alloc]initWithDictionary:self.dataDic];
    if (indexPath.row==0) {
        cell.name.text=@"商品价格";
        cell.money.text=[NSString stringWithFormat:@"¥%.2f",class.commoditySellprice];
    }else if (indexPath.row==1){
        if (class.couponList.count>0&&class.freeCount<1) {
            cell.name.text=[NSString stringWithFormat:@"优惠券(%ld张可用)",class.couponList.count];
            cell.imgName=@"imgName";
            if (self.DiscountAmount>0) {
                cell.money.text=[NSString stringWithFormat:@"-¥%.2f",self.DiscountAmount];
            }else{
            cell.money.text=@"暂不使用优惠券";
            }
            
        }
    }else if (indexPath.row==2){
    cell.name.text=@"实际消费";
        if (class.freeCount>0) {
            cell.money.text=@"¥0.00";
        }else{
        cell.money.text=[NSString stringWithFormat:@"¥%.2f",self.ActualConsumptionAmount];
        }
    
    }
    return cell;
}

#pragma mark 立即支付
-(void)onBuyClick{
    [SVProgressHUD showWithStatus:loading];
    
    [BuyRequest GoodsOrder_equipment_uuid:self.equipment_uuid pay_type:@"0" commodity_serial:self.commodity_serial coupon_id:self.coupon_id Block:^(NSDictionary *dic) {
        OrderBuyBaseClass *class=[[OrderBuyBaseClass alloc]initWithDictionary:[self deleteEmpty:dic]];
        if ([stringFormat(class.code) isEqualToString:@"60"]) {
            [BuyRequest PaymentInterface_order_serial:[NSString stringWithFormat:@"%@",class.serial] Block:^(NSDictionary *dic) {
                PayForResultsBaseClass *model=[[PayForResultsBaseClass alloc]initWithDictionary:[self deleteEmpty:dic]];
                if ([stringFormat(model.code) isEqualToString:@"32"]) {
                    ShipmentViewController *Shipment=[[ShipmentViewController alloc]init];
                    Shipment.model=model;
                    Shipment.commodity_serial=self.commodity_serial;
                    Shipment.serial=[NSString stringWithFormat:@"%@",class.serial];
                    if (self.model!=nil) {
                        Shipment.nameString=self.model.comm.commodityName;
                        Shipment.money=[NSString stringWithFormat:@"%.0f",self.model.comm.commoditySellprice];
                    }else{
                        Shipment.nameString=self.ResultList.commodityName;
                        Shipment.money=[NSString stringWithFormat:@"%.0f",self.ResultList.commoditySellprice];
                    }
                    [self.navigationController pushViewController:Shipment animated:YES];
                }else{
                    [SVProgressHUD showErrorWithStatus:model.msg];
                }
            }];
        }else{
            [SVProgressHUD showErrorWithStatus:stringFormat(class.msg)];
        }
        
    }];

}
#pragma mark 充值
-(void)onTop_UpClick{
    TopUpAmountViewController *TopUpAmount=[[TopUpAmountViewController alloc]init];
    [self.navigationController pushViewController:TopUpAmount animated:YES];
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
