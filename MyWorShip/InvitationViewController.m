//
//  InvitationViewController.m
//  MyWorShip
//,
//  Created by 123 on 2017/5/26.
//  Copyright © 2017年 123. All rights reserved.
//

#import "InvitationViewController.h"
#import "ActivityRulesViewController.h"
@interface InvitationViewController ()
{
    UIScrollView *_scrollView;

    UIImageView *_img;
}
@end

@implementation InvitationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"邀请好友";
    lfteItemAndColor
    _scrollView=[[UIScrollView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_scrollView];
    _scrollView.contentSize=CGSizeMake(0, 1193.5);
    [self CareatAView];
    // Do any additional setup after loading the view.
}
#pragma mark 创建视图
-(void)CareatAView{
    _img=[[UIImageView alloc]init];
    _img.image=[UIImage imageNamed:@"img_huodong"];
    [_scrollView addSubview:_img];
    _img.sd_layout.leftSpaceToView(_scrollView, 0).topSpaceToView(_scrollView, 0).rightSpaceToView(_scrollView, 0).heightIs(1193.5);
    
    UIButton *InviteFriendsBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [InviteFriendsBtn addTarget:self action:@selector(onInviteFriendsClick) forControlEvents:UIControlEventTouchUpInside];
    [_scrollView addSubview:InviteFriendsBtn];
    InviteFriendsBtn.sd_layout.leftSpaceToView(_scrollView, 66).topSpaceToView(_scrollView, 275).rightSpaceToView(_scrollView, 66).heightIs(80);
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"已获得优惠券 20 张"];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0,7)];
     [str addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(10,1)];
    [str addAttribute:NSForegroundColorAttributeName value:[self colorWithHexString:@"ffff00"] range:NSMakeRange(7,2)];
     [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:24] range:NSMakeRange(0, 11)];
     [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:32] range:NSMakeRange(7, 2)];
    UILabel *number1=[[UILabel alloc]init];
    number1.textAlignment=NSTextAlignmentCenter;
    number1.attributedText=str;
    [_scrollView addSubview:number1];
    number1.sd_layout.topSpaceToView(InviteFriendsBtn, 188).leftSpaceToView(_scrollView, 0).autoHeightRatio(0).rightSpaceToView(_scrollView, 0);
    
    NSMutableAttributedString *str2 = [[NSMutableAttributedString alloc] initWithString:@"当前剩余优惠券 20 张"];
    [str2 addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0,8)];
    [str2 addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(10,2)];
    [str2 addAttribute:NSForegroundColorAttributeName value:[self colorWithHexString:@"ffff00"] range:NSMakeRange(8,2)];
    [str2 addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:20] range:NSMakeRange(0, 12)];
    [str2 addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:28] range:NSMakeRange(8, 2)];
    UILabel *number2=[[UILabel alloc]init];
    number2.textAlignment=NSTextAlignmentCenter;
    number2.attributedText=str2;
    [_scrollView addSubview:number2];
    number2.sd_layout.topSpaceToView(number1, 11).leftSpaceToView(_scrollView, 0).autoHeightRatio(0).rightSpaceToView(_scrollView, 0);


    
    UIButton *InvitedToImmediateUseBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [InvitedToImmediateUseBtn addTarget:self action:@selector(onInvitedToImmediateUseClick) forControlEvents:UIControlEventTouchUpInside];
    [_scrollView addSubview:InvitedToImmediateUseBtn];
    InvitedToImmediateUseBtn.sd_layout.leftSpaceToView(_scrollView, 80).topSpaceToView(number2, 22).rightSpaceToView(_scrollView, 80).heightIs(55);
    
    UIButton *CheckTheRecordBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [CheckTheRecordBtn addTarget:self action:@selector(onCheckTheRecordClick) forControlEvents:UIControlEventTouchUpInside];
    [_scrollView addSubview:CheckTheRecordBtn];
    CheckTheRecordBtn.sd_layout.leftEqualToView(InvitedToImmediateUseBtn).topSpaceToView(InvitedToImmediateUseBtn, 16).rightEqualToView(InvitedToImmediateUseBtn).heightIs(20);
    
    UIButton *UnderstandTheRulesBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [UnderstandTheRulesBtn addTarget:self action:@selector(onUnderstandTheRulesClick) forControlEvents:UIControlEventTouchUpInside];
    [_scrollView addSubview:UnderstandTheRulesBtn];
    UnderstandTheRulesBtn.sd_layout.leftSpaceToView(_scrollView, 100).rightSpaceToView(_scrollView, 100).topSpaceToView(CheckTheRecordBtn, 310).heightIs(30);
    
    
    MyButton *rightItem=[MyButton buttonWithType:UIButtonTypeCustom];
    [rightItem setImage:[UIImage imageNamed:@"icon_share"] forState:UIControlStateNormal];
    [rightItem addTarget:self  action:@selector(onshareClick) forControlEvents:UIControlEventTouchUpInside];
    rightItem.tag=2;
    [rightItem sizeToFit];
    UIBarButtonItem *rightItemItem = [[UIBarButtonItem alloc] initWithCustomView:rightItem];
    self.navigationItem.rightBarButtonItems  = @[rightItemItem];
    
}
#pragma  mark //邀请好友
-(void)onInviteFriendsClick{

}
#pragma mark 立即使用按钮
-(void)onInvitedToImmediateUseClick{
    [_delegate dismiss];
}
#pragma mark 查看优惠券图标
-(void)onCheckTheRecordClick{
    PreferentialViewController *Preferential=[[PreferentialViewController alloc]init];
    [self.navigationController pushViewController:Preferential animated:YES];
}
#pragma mark 了解详细规则
-(void)onUnderstandTheRulesClick{
    ActivityRulesViewController *ActivityRules=[[ActivityRulesViewController alloc]init];
    ActivityRules.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:ActivityRules animated:YES completion:^{
        ActivityRules.view.backgroundColor = [[UIColor clearColor] colorWithAlphaComponent:0.5];
    }];
}
#pragma mark 分享
-(void)onshareClick{

}
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden=NO;
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
