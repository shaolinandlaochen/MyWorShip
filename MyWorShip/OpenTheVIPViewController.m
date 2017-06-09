//
//  OpenTheVIPViewController.m
//  MyWorShip
//
//  Created by 123 on 2017/6/9.
//  Copyright © 2017年 123. All rights reserved.
//

#import "OpenTheVIPViewController.h"

@interface OpenTheVIPViewController ()
{
    UIScrollView *_scrollView;
}
@end

@implementation OpenTheVIPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"VIP特权";
    lfteItemAndColor
    _scrollView=[[UIScrollView alloc]init];
    _scrollView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_scrollView];
    if (self.isvip==1) {
        _scrollView.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).topSpaceToView(self.view, 0).bottomSpaceToView(self.view, 0);
    }else{
    _scrollView.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).topSpaceToView(self.view, 0).bottomSpaceToView(self.view, 50);
        
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"开通VIP" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(goVIPClick) forControlEvents:UIControlEventTouchUpInside];
        btn.backgroundColor=[MyClass colorWithHexString:@"ff4c59"];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.titleLabel.font=[UIFont systemFontOfSize:18];
        [self.view addSubview:btn];
        btn.sd_layout.leftSpaceToView(self.view, 0).bottomSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).heightIs(50);
    }
    
    
    UIImageView *imgview=[[UIImageView alloc]init];
    imgview.image=[UIImage imageNamed:@"banner_vip"];
    [_scrollView addSubview:imgview];
    imgview.sd_layout.leftSpaceToView(_scrollView, 0).topSpaceToView(_scrollView, 0).rightSpaceToView(_scrollView, 0).heightIs(210);
    autoSize
    UILabel *money=[[UILabel alloc]init];
    money.textColor=[MyClass colorWithHexString:@"ffffff"];
    [_scrollView addSubview:money];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"300元"];
    [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial Rounded MT Bold" size:45] range:NSMakeRange(0, 3)];
    [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial Rounded MT Bold" size:25] range:NSMakeRange(3, 1)];
    money.attributedText=str;
    money.sd_layout.leftSpaceToView(_scrollView, 38*autoSizeScaleX).topSpaceToView(_scrollView, 110*autoSizeScaleY).widthIs(120).heightIs(36);
    
    UILabel *time=[[UILabel alloc]init];
    time.textColor=[MyClass colorWithHexString:@"ffffff"];
    time.font=[UIFont systemFontOfSize:12];
    time.text=@"有效期:2016-06-06至2017-07-07";
    [_scrollView addSubview:time];
    time.sd_layout.leftSpaceToView(_scrollView, 18).topSpaceToView(_scrollView, 176).rightSpaceToView(_scrollView, 18).autoHeightRatio(0);
    
    
    UILabel *Agreement=[[UILabel alloc]init];
    Agreement.textColor=[MyClass colorWithHexString:@"a3a3a3"];
    Agreement.font=[UIFont systemFontOfSize:13];
    Agreement.numberOfLines=0;
    [_scrollView addSubview:Agreement];
    Agreement.text=@"地大家纷纷规划的粉丝更好地覅共和党发生过ID发生过ID是否更好的双方各华东师范赶快来剑荡四方华工科技六点十分哈根达斯的看法就更好的师傅看了几个男的富士康公司的反馈给第三方高科技的书房里感受到付款就感觉到是否考虑过的是否考虑过的市房管局课代表打开房间风格的十分可观的付款公司的控股的顺口溜广东省咖啡馆的方式开关多晶硅的尽快改变对方改变对方几个地方规定收费规定是否经历过后对方老师给第三方来看规划的首付款更好地烦死规定符合三个东方时空看见对方更好地开发是个好地方开个会第三方开个会大使馆的反馈更好地烧开后改";
    Agreement.sd_layout.leftSpaceToView(_scrollView, 15).topSpaceToView(imgview, 15).rightSpaceToView(_scrollView, 15).bottomSpaceToView(_scrollView, 50);
    
    
    // Do any additional setup after loading the view.
}
CANCEL

#pragma mark 开通VIP
-(void)goVIPClick{

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=NO;
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
