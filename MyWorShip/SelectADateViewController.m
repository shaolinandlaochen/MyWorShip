//
//  SelectADateViewController.m
//  MyWorShip
//
//  Created by 123 on 2017/6/7.
//  Copyright © 2017年 123. All rights reserved.
//

#import "SelectADateViewController.h"

@interface SelectADateViewController ()
{
    UIView *view;
    NSString *timeString;
}
@end

@implementation SelectADateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    view=[[UIView alloc]init];
    view.backgroundColor=[UIColor whiteColor];
    view.layer.masksToBounds=10;
    view.layer.cornerRadius=10;
    [self.view addSubview:view];
    view.sd_layout.leftSpaceToView(self.view, 50).bottomSpaceToView(self.view, (self.view.frame.size.height-230)/2).rightSpaceToView(self.view, 50).heightIs(230);
    
    UIView *bjView=[[UIView alloc]init];
    bjView.backgroundColor=[MyClass colorWithHexString:@"f3f5f7"];
    [view addSubview:bjView];
    bjView.sd_layout.leftSpaceToView(view, 0).rightSpaceToView(view, 0).topSpaceToView(view, 0).heightIs(50);
    
    UIButton *canCel=[UIButton buttonWithType:UIButtonTypeCustom];
    [canCel setTitle:@"返回" forState:UIControlStateNormal];
    [canCel setTitleColor:[MyClass colorWithHexString:@"000000"] forState:UIControlStateNormal];
    canCel.titleLabel.font=[UIFont systemFontOfSize:15];
    [canCel addTarget:self action:@selector(onCancelClick) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:canCel];
    canCel.sd_layout.leftSpaceToView(view, 0).topSpaceToView(view, 0).widthIs(50).heightIs(50);
    
    UIButton *GoBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [GoBtn setTitle:@"确定" forState:UIControlStateNormal];
    [GoBtn setTitleColor:[MyClass colorWithHexString:@"000000"] forState:UIControlStateNormal];
    GoBtn.titleLabel.font=[UIFont systemFontOfSize:15];
    [GoBtn addTarget:self action:@selector(onGoBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:GoBtn];
    GoBtn.sd_layout.rightSpaceToView(view, 0).topSpaceToView(view, 0).widthIs(50).heightIs(50);
    
    
    
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    //设置日期选择控件的地区,中国地区标识是："zh_Hans_CN"或者"zh_CN"
    [datePicker setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_Hans_CN"]];
    // 设置当前显示时间
    [datePicker setDate:[NSDate date] animated:YES];
    //获取当前时间
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    
    //当前时间
    [formatter setDateFormat:@"yyyy-MM-dd"];
    timeString=[formatter stringFromDate:[NSDate date]];
    
    // 设置UIDatePicker的显示模式
    [datePicker setDatePickerMode:UIDatePickerModeDate];
    //datePicker.minimumDate = [NSDate dateWithTimeIntervalSince1970:0];
    [datePicker addTarget:self action:@selector(onDatePickerClick:) forControlEvents:UIControlEventValueChanged];
    
    [view addSubview:datePicker];
    datePicker.sd_layout.leftSpaceToView(view, 0).rightSpaceToView(view, 0).topSpaceToView(view, 50).bottomSpaceToView(view, 0);
    
    
    UILabel *lblTime=[[UILabel alloc]init];
    lblTime.tag=15951;
    lblTime.textColor=[MyClass colorWithHexString:@"a3a3a3"];
    lblTime.textAlignment=NSTextAlignmentCenter;
    lblTime.font=[UIFont systemFontOfSize:12];
    lblTime.text=[NSString stringWithFormat:@"当前选择时间为:%@",timeString];
    [view addSubview:lblTime];
    lblTime.sd_layout.leftSpaceToView(canCel, 0).rightSpaceToView(GoBtn, 0).topSpaceToView(view, 0).heightIs(49);
    
    
    // Do any additional setup after loading the view.
}
-(void)onCancelClick{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self onCancelClick];
}
//选择完毕时间执行该方法
-(void)onDatePickerClick:(UIDatePicker *)pick{
    
    
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    timeString=[formatter stringFromDate:pick.date];

    NSLog(@"当前选择时间%@",timeString);
    ((UILabel *)[view viewWithTag:15951]).text=[NSString stringWithFormat:@"当前选择时间为:%@",timeString];

}
-(void)onGoBtnClick{
    
    [self dismissViewControllerAnimated:YES completion:^{
        [_delegate selectTime:timeString];
    }];
    
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
