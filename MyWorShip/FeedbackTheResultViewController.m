//
//  FeedbackTheResultViewController.m
//  MyWorShip
//
//  Created by 123 on 2017/6/13.
//  Copyright © 2017年 123. All rights reserved.
//

#import "FeedbackTheResultViewController.h"

@interface FeedbackTheResultViewController ()

@end

@implementation FeedbackTheResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"吐槽";
    lfteItemAndColor
    NAVHEIGHT
    RECTSTATUS
    UIImageView *img=[[UIImageView alloc]init];
    img.image=[UIImage imageNamed:@"img_zan"];
    [self.view addSubview:img];
    img.sd_layout.leftSpaceToView(self.view, (WIDTH-155)/2).widthIs(155).topSpaceToView(self.view, 29+navheight+rectStatus.size.height).heightIs(135);
    
    
    UILabel *lblOne=[[UILabel alloc]init];
    lblOne.textColor=[MyClass colorWithHexString:@"010101"];
    lblOne.font=[UIFont systemFontOfSize:18];
    lblOne.textAlignment=NSTextAlignmentCenter;
    lblOne.text=@"感谢";
    [self.view addSubview:lblOne];
    lblOne.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).topSpaceToView(img, 26).autoHeightRatio(0);
    
    UILabel *lblTwo=[[UILabel alloc]init];
    lblTwo.textColor=[MyClass colorWithHexString:@"000000"];
    lblTwo.font=[UIFont systemFontOfSize:14];
    lblTwo.textAlignment=NSTextAlignmentCenter;
    lblTwo.text=@"您的反馈已经收到,我们会尽快处理.";
    [self.view addSubview:lblTwo];
    lblTwo.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).topSpaceToView(lblOne, 22).autoHeightRatio(0);
    
    
    // Do any additional setup after loading the view.
}
-(void)onCancelClick{
ReturnToSpecifyTheController(HomeViewController)
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
