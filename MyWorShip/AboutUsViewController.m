//
//  AboutUsViewController.m
//  MyWorShip
//
//  Created by 123 on 2017/5/26.
//  Copyright © 2017年 123. All rights reserved.
//

#import "AboutUsViewController.h"

@interface AboutUsViewController ()

@end

@implementation AboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"关于奇拜";
    lfteItemAndColor
    UIImageView *img=[[UIImageView alloc]init];
    img.image=[UIImage imageNamed:@"logo_guanyu"];
    [self.view addSubview:img];
    img.sd_layout.leftSpaceToView(self.view, (WIDTH-59)/2).topSpaceToView(self.view, 130).rightSpaceToView(self.view, (WIDTH-59)/2).heightIs(81);
    UILabel *lbl=[[UILabel alloc]init];
    lbl.textColor=[self colorWithHexString:@"000000"];
    lbl.font=[UIFont systemFontOfSize:14];
    lbl.text=@"奇拜共享是全球第一个共享厕所平台,首创'厕所共享'模式,用户只需在微信服务号或者APP搜索,即可导航至厕所.";
    lbl.numberOfLines=0;
    [self.view addSubview:lbl];
    lbl.sd_layout.leftSpaceToView(self.view, 19).topSpaceToView(img, 6.5).rightSpaceToView(self.view, 19).autoHeightRatio(0);
    // Do any additional setup after loading the view.
}
CANCEL

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=NO;
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
