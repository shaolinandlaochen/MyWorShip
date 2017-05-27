//
//  TopUpResultsViewController.m
//  MyWorShip
//
//  Created by 123 on 2017/5/26.
//  Copyright © 2017年 123. All rights reserved.
//

#import "TopUpResultsViewController.h"

@interface TopUpResultsViewController ()

@end

@implementation TopUpResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"充值";
    lfteItemAndColor
    NAVHEIGHT
    RECTSTATUS
    UIImageView *img=[[UIImageView alloc]init];
    img.image=[UIImage imageNamed:@"img_smile"];
    [self.view addSubview:img];
    img.sd_layout.leftSpaceToView(self.view, (WIDTH-155)/2).topSpaceToView(self.view, 28+navheight+rectStatus.size.height).rightSpaceToView(self.view, (WIDTH-155)/2).heightIs(135);
    UILabel *lbl=[[UILabel alloc]init];
    lbl.textColor=[self colorWithHexString:@"010101"];
    lbl.font=[UIFont systemFontOfSize:18];
    lbl.text=@"充值成功";
    lbl.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:lbl];
    lbl.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).topSpaceToView(img, 24).autoHeightRatio(0);
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"查看余额" forState:UIControlStateNormal];
    btn.layer.cornerRadius=6;
    btn.layer.masksToBounds=6;
    btn.backgroundColor=[self colorWithHexString:@"ff4c59"];
    [btn setTitleColor:[self colorWithHexString:@"ffffff"] forState:UIControlStateNormal];
    btn.titleLabel.font=[UIFont systemFontOfSize:17];
    [btn addTarget:self action:@selector(onButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.sd_layout.leftSpaceToView(self.view, 18).topSpaceToView(lbl, 36).rightSpaceToView(self.view, 18).heightIs(50);
    // Do any additional setup after loading the view.
}
-(void)onButtonClick{
    for (UIViewController *controller in self.navigationController.viewControllers) {
        if ([controller isKindOfClass:[WalletViewController class]]) {
            [self.navigationController popToViewController:controller animated:YES];
        }
    }
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
