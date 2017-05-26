//
//  AnnouncementOfTheDetailsViewController.m
//  MyWorShip
//
//  Created by 123 on 2017/5/26.
//  Copyright © 2017年 123. All rights reserved.
//

#import "AnnouncementOfTheDetailsViewController.h"

@interface AnnouncementOfTheDetailsViewController ()
{
    UIScrollView *_scrollView;
}
@end

@implementation AnnouncementOfTheDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=_titleString;
    lfteItemAndColor
    _scrollView=[[UIScrollView alloc]initWithFrame:self.view.bounds];
    _scrollView.backgroundColor=[self colorWithHexString:@"f3f5f7"];
    [self.view addSubview:_scrollView];
    
    [self CreatAView];
    // Do any additional setup after loading the view.
}
CANCEL
#pragma mark 创建视图
-(void)CreatAView{
    
    UILabel *hello=[[UILabel alloc]init];
    hello.text=@"用户你好";
    hello.textColor=[self colorWithHexString:@"000000"];
    hello.font=[UIFont systemFontOfSize:17];
    [_scrollView addSubview:hello];
    hello.sd_layout.leftSpaceToView(_scrollView, 18).topSpaceToView(_scrollView, 29).widthIs(200).autoHeightRatio(0);
    
    UILabel *context=[[UILabel alloc]init];
    context.text=@"司法必胜客福布斯防不胜防开始部分考试办法看吧四uufbsifbsibfkfbskfks水库附近时快捷方便时快捷方便快睡吧刷卡缴费不是空间分布看手机备份会计师暴风科技副书记会计师分别是科技发布时间开放不是开福布斯分别为if比赛福布斯分班考试放不开手机不反抗精神病妇科疾病刷卡缴费不可随便";
    context.textColor=[self colorWithHexString:@"000000"];
    context.font=[UIFont systemFontOfSize:14];
    context.numberOfLines=0;
    [_scrollView addSubview:context];
    context.sd_layout.leftSpaceToView(_scrollView, 18).topSpaceToView(hello, 25).rightSpaceToView(_scrollView, 18).autoHeightRatio(0);
    
    UILabel *company=[[UILabel alloc]init];
    company.text=@"公司名称";
    company.textAlignment=NSTextAlignmentRight;
    company.textColor=[self colorWithHexString:@"000000"];
    company.font=[UIFont systemFontOfSize:15];
    [_scrollView addSubview:company];
    company.sd_layout.topSpaceToView(context, 50).leftSpaceToView(_scrollView, 18).rightSpaceToView(_scrollView, 11).autoHeightRatio(0);
    
    UILabel *time=[[UILabel alloc]init];
    time.text=@"2017-05-27 12:08";
    time.textAlignment=NSTextAlignmentRight;
    time.textColor=[self colorWithHexString:@"a3a3a3"];
    time.font=[UIFont systemFontOfSize:12];
    [_scrollView addSubview:time];
    time.sd_layout.topSpaceToView(company, 10).leftSpaceToView(_scrollView, 18).rightSpaceToView(_scrollView, 11).autoHeightRatio(0);
    
    
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
