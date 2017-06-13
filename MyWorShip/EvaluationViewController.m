//
//  EvaluationViewController.m
//  MyWorShip
//
//  Created by 123 on 2017/6/13.
//  Copyright © 2017年 123. All rights reserved.
//

#import "EvaluationViewController.h"

@interface EvaluationViewController ()<UITextViewDelegate>
{
    UILabel *_message;
}
@end

@implementation EvaluationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"评论商品";
    lfteItemAndColor
    [self CreateAView];
    // Do any additional setup after loading the view.
}
#pragma mark 创建视图
-(void)CreateAView{
    NAVHEIGHT
    RECTSTATUS
    
    UIView *goodsView=[[UIView alloc]init];
    goodsView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:goodsView];
    goodsView.sd_layout.leftSpaceToView(self.view, 0).topSpaceToView(self.view, navheight+rectStatus.size.height).rightSpaceToView(self.view, 0).heightIs(100);
    
    UIImageView *goodsImage=[[UIImageView alloc]init];
    [goodsImage sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1497930479&di=726f2b777c50a22bd9be7f46a713c9c6&imgtype=jpg&er=1&src=http%3A%2F%2Fimage4.xyzs.com%2Fupload%2F66%2F80%2F414%2F20150506%2F143087299270780_0.jpg"]];
    [goodsView addSubview:goodsImage];
    goodsImage.sd_layout.leftSpaceToView(goodsView, 10).topSpaceToView(goodsView, 6).bottomSpaceToView(goodsView, 6).widthIs(87);
    
    
    
    UILabel *lbl=[[UILabel alloc]init];
    lbl.textColor=[MyClass colorWithHexString:@"000000"];
    lbl.font=[UIFont systemFontOfSize:15];
    lbl.numberOfLines=2;
    lbl.text=@"东风浩荡搜粉红色的粉红色东方闪电会发生的合法你稍等";
    [goodsView addSubview:lbl];
    lbl.sd_layout.leftSpaceToView(goodsImage, 7.5).topSpaceToView(goodsView, 14.5).rightSpaceToView(goodsView, 18).autoHeightRatio(0);
    
    UILabel *money=[[UILabel alloc]init];
    money.textColor=[MyClass colorWithHexString:@"ff4c59"];
    money.font=[UIFont systemFontOfSize:17];
    money.text=@"¥200.00";
    [goodsView addSubview:money];
    money.sd_layout.leftSpaceToView(goodsImage, 7.5).bottomSpaceToView(goodsView, 20).heightIs(15).widthIs(120);
    
    
    //放置星星
    UIView *xingView=[[UIView alloc]init];
    xingView.tag=1994;
    xingView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:xingView];
    xingView.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).topSpaceToView(goodsView, 11).heightIs(60);
    
    UILabel *lblTwo=[[UILabel alloc]init];
    lblTwo.text=@"评分";
    lblTwo.textColor=[MyClass colorWithHexString:@"000000"];
    lblTwo.font=[UIFont systemFontOfSize:15];
    [xingView addSubview:lblTwo];
    lblTwo.sd_layout.leftSpaceToView(xingView, 18).topSpaceToView(xingView, 0).bottomSpaceToView(xingView, 0).widthIs(32);
    
    for (int i=0; i<5; i++) {
        float x=14+(18+9)*(i%5);
        UIButton *xingBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        xingBtn.tag=i+1;
        [xingBtn addTarget:self action:@selector(onXingXingClick:) forControlEvents:UIControlEventTouchUpInside];
        [xingBtn setBackgroundImage:[UIImage imageNamed:@"star_pinglun_solid"] forState:UIControlStateNormal];
        [xingView addSubview:xingBtn];
        xingBtn.sd_layout.leftSpaceToView(lblTwo, x).topSpaceToView(xingView, 20).widthIs(18).heightIs(18);
        
        
    }
    
    
    UITextView *TextView=[[UITextView alloc]init];
    TextView.backgroundColor=[MyClass colorWithHexString:@"f3f5f7"];
    TextView.delegate=self;
    TextView.textColor=[MyClass colorWithHexString:@"000000"];
    TextView.font=[UIFont systemFontOfSize:14];
    [self.view addSubview:TextView];
    TextView.sd_layout.leftSpaceToView(self.view, 0).topSpaceToView(xingView, 0).rightSpaceToView(self.view, 0).heightIs(136);
    
    _message=[[UILabel alloc]init];
    _message.text=@"输入您的评论内容!";
    _message.textColor=[MyClass colorWithHexString:@"adb0ae"];
    _message.font=[UIFont systemFontOfSize:14];
    [self.view addSubview:_message];
    _message.sd_layout.leftSpaceToView(self.view, 17).topSpaceToView(xingView, 11).widthIs(150).autoHeightRatio(0);
    
    
    
    UIView *btnView=[[UIView  alloc]init];
    btnView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:btnView];
    btnView.sd_layout.leftSpaceToView(self.view, 0).topSpaceToView(TextView, 0).rightSpaceToView(self.view, 0).heightIs(85);
    
    UIButton *evaluationBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [evaluationBtn setTitle:@"立即评价" forState:UIControlStateNormal];
    evaluationBtn.titleLabel.font=[UIFont systemFontOfSize:17];
    evaluationBtn.layer.masksToBounds=5;
    evaluationBtn.layer.cornerRadius=5;
    [evaluationBtn addTarget:self action:@selector(onEvaluationClick) forControlEvents:UIControlEventTouchUpInside];
    [evaluationBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    evaluationBtn.backgroundColor=[MyClass colorWithHexString:@"ff4c59"];
    [btnView addSubview:evaluationBtn];
    evaluationBtn.sd_layout.leftSpaceToView(btnView, 18).topSpaceToView(btnView, 19).rightSpaceToView(btnView, 18).bottomSpaceToView(btnView, 19);

}
#pragma mark 点击星星执行该方法
-(void)onXingXingClick:(UIButton *)btn{

    for (int i=0; i<5; i++) {
        if (i<btn.tag) {
            [((UIButton *)[((UIView *)[self.view viewWithTag:1994])viewWithTag:i+1]) setBackgroundImage:[UIImage imageNamed:@"star_pinglun_solid"] forState:UIControlStateNormal];
        }else{
        [((UIButton *)[((UIView *)[self.view viewWithTag:1994])viewWithTag:i+1]) setBackgroundImage:[UIImage imageNamed:@"star_pinglun_hollow"] forState:UIControlStateNormal];
        }
        
    }
    
}
CANCEL
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark 开始编辑执行
- (void)textViewDidBeginEditing:(UITextView *)textView{
_message.text=@"";
}
#pragma mark 结束编辑执行
- (void)textViewDidEndEditing:(UITextView *)textView{
    if ([textView.text length]<1) {
        _message.text=@"输入您的评论内容!";
    }
}
#pragma mark 立即评价
-(void)onEvaluationClick{

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
