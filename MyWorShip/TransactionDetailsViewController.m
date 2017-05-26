//
//  TransactionDetailsViewController.m
//  MyWorShip
//
//  Created by 123 on 2017/5/26.
//  Copyright © 2017年 123. All rights reserved.
//

#import "TransactionDetailsViewController.h"
#import "TransactionDetailsCell.h"
@interface TransactionDetailsViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    NSInteger index;
}

@end

@implementation TransactionDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"交易明细";
    index=0;
    lfteItemAndColor
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _tableView.separatorColor=[self colorWithHexString:@"d7d7d7"];
    _tableView.backgroundColor=[self colorWithHexString:@"#f3f5f7"];
    [self.view addSubview:_tableView];
    //[self NULLData];
    // Do any additional setup after loading the view.
}
#pragma mark 创建无数据视图
-(void)NULLData{
    UIImageView *img=[[UIImageView alloc]init];
    img.tag=852;
    img.image=[UIImage imageNamed:@"img_nomingxi"];
    [self.view addSubview:img];
    img.sd_layout.leftSpaceToView(self.view, (WIDTH-125)/2).topSpaceToView(self.view, 150).rightSpaceToView(self.view, (WIDTH-125)/2).heightIs(125);
    UILabel *lbl=[[UILabel alloc]init];
    lbl.text=@"您还没有进行过交易呢~";
    lbl.textColor=[self colorWithHexString:@"a3a3a3"];
    lbl.font=[UIFont systemFontOfSize:14];
    lbl.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:lbl];
    lbl.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).topSpaceToView(img, 19).autoHeightRatio(0);
    
}
CANCEL
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 65;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 45;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=[UIColor whiteColor];
    for (int i=0; i<2; i++) {
        MyButton *btn=[MyButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor=[UIColor whiteColor];
        btn.tag=i+1;
        [btn setTitleColor:[self colorWithHexString:@"000000"] forState:UIControlStateNormal];
        [btn setTitleColor:[self colorWithHexString:@"ff4c59"] forState:UIControlStateSelected];
        btn.titleLabel.font=[UIFont systemFontOfSize:15];
        if (i==0) {
            [btn setTitle:@"消费明细" forState:UIControlStateNormal];
        }else{
            [btn setTitle:@"充值明细" forState:UIControlStateNormal];
        }
        if (i==index) {
            btn.selected=YES;
        }
        [btn addTarget:self action:@selector(onbtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btn];
        btn.sd_layout.leftSpaceToView(view, (WIDTH/2)*i).bottomSpaceToView(view, 3).heightIs(42).widthIs(WIDTH/2);
    }
    UILabel *line=[[UILabel alloc]init];
    line.backgroundColor=[self colorWithHexString:@"de0024"];
    [view addSubview:line];
    if (index==0) {
        line.sd_layout.leftSpaceToView(view, 0).bottomSpaceToView(view, 1).heightIs(1.5).widthIs(WIDTH/2);
    }else{
        line.sd_layout.leftSpaceToView(view, WIDTH/2).bottomSpaceToView(view, 1).heightIs(1.5).widthIs(WIDTH/2);
    }
    
    UIView *lllll=[[UIView alloc]init];
    lllll.backgroundColor=[self colorWithHexString:@"d7d7d7"];
    [view addSubview:lllll];
    lllll.sd_layout.leftSpaceToView(view, 0).rightSpaceToView(view, 0).bottomSpaceToView(view, 0).heightIs(0.5);
    
    return view;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TransactionDetailsCell *cell=[[TransactionDetailsCell alloc]init];
    cell.title.text=@"我是充值送的";
    cell.time.text=@"2020-02-20 12:12";
    cell.money.text=@"+200.00元";
    return cell;
}
-(void)onbtnClick:(MyButton *)btn{
    index=btn.tag-1;
    [_tableView reloadData];
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
