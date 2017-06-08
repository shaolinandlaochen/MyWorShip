//
//  MyOrderViewController.m
//  MyWorShip
//
//  Created by 123 on 2017/5/26.
//  Copyright © 2017年 123. All rights reserved.
//

#import "MyOrderViewController.h"
#import "OrderCell.h"
@interface MyOrderViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    NSInteger index;
}

@end

@implementation MyOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"我的订单";
    lfteItemAndColor
    index=0;
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.backgroundColor=[self colorWithHexString:@"f3f5f7"];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _tableView.separatorColor=[self colorWithHexString:@"d7d7d7"];
    [self.view addSubview:_tableView];
    _tableView.sd_layout.leftSpaceToView(self.view, 12).topSpaceToView(self.view, 45).rightSpaceToView(self.view, 12).bottomSpaceToView(self.view, 0);
    

    NAVHEIGHT
    RECTSTATUS
    NSArray *array=@[@"全部",@"未完成",@"未评论",@"已取消"];
    for (int i=0; i<4; i++) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag=i+1;
        btn.backgroundColor=[UIColor whiteColor];
        [btn setTitle:array[i] forState:UIControlStateNormal];
        if (i==index) {
            [btn setTitleColor:[MyClass colorWithHexString:@"ff4c59"] forState:UIControlStateNormal];
        }else{
            [btn setTitleColor:[MyClass colorWithHexString:@"000000"] forState:UIControlStateNormal];
        }
        btn.titleLabel.font=[UIFont systemFontOfSize:15];
        [btn addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        btn.sd_layout.leftSpaceToView(self.view, (WIDTH/4)*i).widthIs(WIDTH/4).topSpaceToView(self.view, navheight+rectStatus.size.height).heightIs(43);
        
        
        UILabel *line=[[UILabel alloc]init];
        line.tag=10+i;
        if (i==0) {
            line.backgroundColor=[MyClass colorWithHexString:@"ff4c59"];
        }else{
            line.backgroundColor=[UIColor clearColor];
        }
        [self.view addSubview:line];
        line.sd_layout.leftSpaceToView(self.view, (WIDTH/4)*i).widthIs(WIDTH/4).topSpaceToView(self.view, navheight+rectStatus.size.height+43).heightIs(2);
    }

    // Do any additional setup after loading the view.
}

CANCEL
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=NO;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 10;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=[self colorWithHexString:@"f3f5f7"];
    return view;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    OrderCell *cell=[[OrderCell alloc]init];
    cell.time.text=@"2020-20-20 12:12";
    NSMutableAttributedString *str2 = [[NSMutableAttributedString alloc] initWithString:@"¥0.00"];
    [str2 addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial" size:14] range:NSMakeRange(0, 1)];
    [str2 addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial" size:25] range:NSMakeRange(1, 4)];
    cell.money.attributedText=str2;
    cell.location.text=@"厕所位置:高新区";
    cell.imgRight.image=[UIImage imageNamed:@"icon_right"];
    cell.state.text=@"退款中";
    cell.state.textColor=[UIColor redColor];


    return cell;
}
#pragma mark 筛选
-(void)onButtonClick:(UIButton *)btn{
    index=btn.tag-1;
    for (int i=0; i<4; i++) {
        [((UIButton *)[self.view viewWithTag:i+1]) setTitleColor:[MyClass colorWithHexString:@"000000"] forState:UIControlStateNormal];
        ((UILabel *)[self.view viewWithTag:i+10]).backgroundColor=[UIColor clearColor];
    }
    [((UIButton *)[self.view viewWithTag:index+1]) setTitleColor:[MyClass colorWithHexString:@"ff4c59"] forState:UIControlStateNormal];
    ((UILabel *)[self.view viewWithTag:btn.tag+9]).backgroundColor=[MyClass colorWithHexString:@"ff4c59"];
    
    
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
