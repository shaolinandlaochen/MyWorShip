//
//  ShipmentViewController.m
//  MyWorShip
//
//  Created by 123 on 2017/6/13.
//  Copyright © 2017年 123. All rights reserved.
//

#import "ShipmentViewController.h"

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
    _img.image=[UIImage imageNamed:@"img_wait"];
    [self.view addSubview:_img];
    _img.sd_layout.leftSpaceToView(self.view, (WIDTH-100)/2).topSpaceToView(self.view, 100+navheight+rectStatus.size.height).widthIs(100).heightIs(100);
    
    _name=[[UILabel alloc]init];
    _name.textColor=[MyClass colorWithHexString:@"a3a3a3"];
    _name.font=[UIFont systemFontOfSize:18];
    _name.textAlignment=NSTextAlignmentCenter;
    _name.text=@"正在出货···";
    [self.view addSubview:_name];
    _name.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).topSpaceToView(_img, 26).autoHeightRatio(0);
    
    _button=[MyButton buttonWithType:UIButtonTypeCustom];
    [_button setTitle:@"立即评论" forState:UIControlStateNormal];
    _button.backgroundColor=[MyClass colorWithHexString:@"ff4c59"];
    [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _button.titleLabel.font=[UIFont systemFontOfSize:17];
    [_button addTarget:self action:@selector(onButtonnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
    _button.layer.masksToBounds=5;
    _button.layer.cornerRadius=5;
    _button.sd_layout.leftSpaceToView(self.view, 17).topSpaceToView(_name, 31).rightSpaceToView(self.view, 17).heightIs(47);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)onButtonnClick{
    EvaluationViewController *Evaluation=[[EvaluationViewController alloc]init];
    [self.navigationController pushViewController:Evaluation animated:YES];
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
