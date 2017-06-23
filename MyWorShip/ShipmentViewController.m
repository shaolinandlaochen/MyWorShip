//
//  ShipmentViewController.m
//  MyWorShip
//
//  Created by 123 on 2017/6/13.
//  Copyright © 2017年 123. All rights reserved.
//

#import "ShipmentViewController.h"
#import "OrderRequest.h"
@interface ShipmentViewController ()
{
    UIImageView *_img;
    UILabel *_name;
    MyButton *_button;

}
@end

@implementation ShipmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"支付";
    lfteItemAndColor
    [self CreateAView];
    // Do any additional setup after loading the view.
}
-(void)CreateAView{
    NAVHEIGHT
    RECTSTATUS
    _img=[[UIImageView alloc]init];
  
    
    [self.view addSubview:_img];
    _img.sd_layout.leftSpaceToView(self.view, (WIDTH-100)/2).topSpaceToView(self.view, 100+navheight+rectStatus.size.height).widthIs(100).heightIs(100);
    
    _name=[[UILabel alloc]init];
    _name.textColor=[MyClass colorWithHexString:@"a3a3a3"];
    _name.font=[UIFont systemFontOfSize:18];
    _name.textAlignment=NSTextAlignmentCenter;

    [self.view addSubview:_name];
    _name.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).topSpaceToView(_img, 26).autoHeightRatio(0);
    
    _button=[MyButton buttonWithType:UIButtonTypeCustom];
    
    _button.backgroundColor=[MyClass colorWithHexString:@"ff4c59"];
    [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _button.titleLabel.font=[UIFont systemFontOfSize:17];
    [_button addTarget:self action:@selector(onButtonnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
    _button.layer.masksToBounds=5;
    _button.layer.cornerRadius=5;
    _button.sd_layout.leftSpaceToView(self.view, 17).topSpaceToView(_name, 31).rightSpaceToView(self.view, 17).heightIs(47);
    if ([self.model.code isEqualToString:@"32"]) {
        _img.image=[UIImage imageNamed:@"img_-succeed"];
        _name.text=@"出货成功";
        [_button setTitle:@"立即评论" forState:UIControlStateNormal];
    }else{
        _img.image=[UIImage imageNamed:@"img_-error"];
        _name.text=@"出货失败";
        [_button setTitle:@"取消订单" forState:UIControlStateNormal];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)onButtonnClick{
    if ([self.model.code isEqualToString:@"32"]){//去评论
        EvaluationViewController *Evaluation=[[EvaluationViewController alloc]init];
        Evaluation.name=self.nameString;
        Evaluation.money=self.money;
        Evaluation.imgUrl=self.imgUrl;
        Evaluation.order_serial=self.serial;
        Evaluation.commodity_serial=self.commodity_serial;
        [self.navigationController pushViewController:Evaluation animated:YES];
    }else{//取消订单
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"温馨提示" message:@"请选择取消订单理由" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action1=[UIAlertAction actionWithTitle:@"设备故障" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            [SVProgressHUD showWithStatus:loading];
            [OrderRequest CancelTheOrder_order_refund_cause:@"0" order_serial:self.serial block:^(NSDictionary *dic) {
                LoginsIsBaseClass *class=[[LoginsIsBaseClass alloc]initWithDictionary:[self deleteEmpty:dic]];
                if ([stringFormat(class.code) isEqualToString:@"31"]) {
                    
                    [SVProgressHUD showSuccessWithStatus:class.msg];
                }else{
                    [SVProgressHUD showErrorWithStatus:class.msg];
                }
            }];
            
        }];
        UIAlertAction *action2=[UIAlertAction actionWithTitle:@"出货超时" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            [SVProgressHUD showWithStatus:loading];
            [OrderRequest CancelTheOrder_order_refund_cause:@"0" order_serial:self.serial block:^(NSDictionary *dic) {
                LoginsIsBaseClass *class=[[LoginsIsBaseClass alloc]initWithDictionary:[self deleteEmpty:dic]];
                if ([stringFormat(class.code) isEqualToString:@"31"]) {
                    [SVProgressHUD showSuccessWithStatus:class.msg];
                    
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
    }

}
CANCEL
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
