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
@interface PayViewController ()

@end

@implementation PayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"支付";
    lfteItemAndColor
    [self CreateAView];
    // Do any additional setup after loading the view.
}
#pragma mark 创建视图
-(void)CreateAView{
    NAVHEIGHT
    RECTSTATUS
    UILabel *lblOne=[[UILabel alloc]init];
    lblOne.textColor=[MyClass colorWithHexString:@"000000"];
    lblOne.font=[UIFont systemFontOfSize:17];
    lblOne.textAlignment=NSTextAlignmentCenter;
    lblOne.text=@"账户余额";
    [self.view addSubview:lblOne];
    lblOne.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).topSpaceToView(self.view, 29+navheight+rectStatus.size.height).autoHeightRatio(0);
    
    
    UILabel *money=[[UILabel alloc]init];
    money.textColor=[MyClass colorWithHexString:@"000000"];
    money.font=[UIFont systemFontOfSize:17];
    money.textAlignment=NSTextAlignmentCenter;
    money.text=@"¥200.00";
    [self.view addSubview:money];
    money.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).topSpaceToView(lblOne, 10).autoHeightRatio(0);
    
    
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:view];
    view.sd_layout.topSpaceToView(money, 38).leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).heightIs(50);
    
    
    UILabel *consumption=[[UILabel alloc]init];
    consumption.textColor=[MyClass colorWithHexString:@"000000"];
    consumption.font=[UIFont systemFontOfSize:15];
    consumption.text=@"本次消费";
    [view addSubview:consumption];
    consumption.sd_layout.leftSpaceToView(view, 18).topSpaceToView(view, 0).bottomSpaceToView(view, 0).widthIs(120);
    
    UILabel *ConsumptionAmount=[[UILabel alloc]init];
    ConsumptionAmount.textColor=[MyClass colorWithHexString:@"ff4c59"];
    ConsumptionAmount.font=[UIFont systemFontOfSize:17];
    ConsumptionAmount.textAlignment=NSTextAlignmentRight;
    ConsumptionAmount.text=@"¥20.00";
    [view addSubview:ConsumptionAmount];
    ConsumptionAmount.sd_layout.rightSpaceToView(view, 17).topEqualToView(consumption).bottomEqualToView(consumption).widthIs(200);
    
    UIButton *buyBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    buyBtn.backgroundColor=[MyClass colorWithHexString:@"ff4c59"];
    [buyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    buyBtn.titleLabel.font=[UIFont systemFontOfSize:17];
    buyBtn.layer.masksToBounds=5;
    buyBtn.layer.cornerRadius=5;
    [buyBtn setTitle:@"确认支付" forState:UIControlStateNormal];
    [buyBtn addTarget:self action:@selector(onBuyClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buyBtn];
    buyBtn.sd_layout.leftSpaceToView(self.view, 17).topSpaceToView(view, 31).heightIs(47).rightSpaceToView(self.view, 17);
    
    
    UIButton *top_upBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [top_upBtn addTarget:self action:@selector(onTop_UpClick) forControlEvents:UIControlEventTouchUpInside];
    top_upBtn.titleLabel.font=[UIFont systemFontOfSize:13];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"余额不足请充值"];
    [str addAttribute:NSForegroundColorAttributeName value:[self colorWithHexString:@"ff4c59"] range:NSMakeRange(5,2)];
    [str addAttribute:NSForegroundColorAttributeName value:[self colorWithHexString:@"a3a3a3"] range:NSMakeRange(0,5)];
    [top_upBtn setAttributedTitle:str forState:UIControlStateNormal];
    [self.view addSubview:top_upBtn];
    top_upBtn.sd_layout.leftSpaceToView(self.view, (WIDTH-100)/2).topSpaceToView(buyBtn, 13).widthIs(100).heightIs(15);
    
    
}
#pragma mark 立即支付
-(void)onBuyClick{
    ShipmentViewController *Shipment=[[ShipmentViewController alloc]init];
    [self.navigationController pushViewController:Shipment animated:YES];
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
