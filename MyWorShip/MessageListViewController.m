//
//  MessageListViewController.m
//  MyWorShip
//
//  Created by 123 on 2017/5/25.
//  Copyright © 2017年 123. All rights reserved.
//

#import "MessageListViewController.h"
#import "MessageListHeaderView.h"
#import "MessageCell.h"
#import "AnnouncementCell.h"
#import "MessageForDetailsViewController.h"//消息详情
#import "AnnouncementOfTheDetailsViewController.h"//公告详情
@interface MessageListViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    NSInteger index;
}

@end

@implementation MessageListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"我的消息";
    index=0;
    lfteItemAndColor

    _tableView=[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.backgroundColor=[self colorWithHexString:@"F3F5F7"];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.separatorColor=[self colorWithHexString:@"ebebeb"];
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:_tableView];
    _tableView.sd_layout.leftSpaceToView(self.view, 0).topSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).bottomSpaceToView(self.view, 0);

   // [self NULLData];
    // Do any additional setup after loading the view.
}
#pragma mark 无数据
-(void)NULLData{

    UIImageView *img=[[UIImageView alloc]init];
    img.tag=852;
    img.image=[UIImage imageNamed:@"img_nomews"];
    [self.view addSubview:img];
    img.sd_layout.leftSpaceToView(self.view, (WIDTH-125)/2).topSpaceToView(self.view, 150).rightSpaceToView(self.view, (WIDTH-125)/2).heightIs(125);
    UILabel *lbl=[[UILabel alloc]init];
    lbl.text=@"还没有什么大事发生哦~";
    lbl.textColor=[self colorWithHexString:@"a3a3a3"];
    lbl.font=[UIFont systemFontOfSize:14];
    lbl.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:lbl];
    lbl.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).topSpaceToView(img, 19).autoHeightRatio(0);
    
}
#pragma mark 点击筛选按钮执行该方法
-(void)onConditionsForScreeningClick:(MyButton *)btn{
    index=btn.tag-1;
    [_tableView reloadData];

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 10;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section>0) {
        return 1;
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (index==1) {
        return 157;
    }
    return 90;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 45;
    }else {
        if (index==1){
            return 37.5;
        }
    }
    return 0;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    AnnouncementOfTheDetailsViewController *AnnouncementOfTheDetails=[[AnnouncementOfTheDetailsViewController alloc]init];
    if (index==0) {//消息详情
     AnnouncementOfTheDetails.titleString=@"消息详情";
    }else{//公告详情
     AnnouncementOfTheDetails.titleString=@"公告详情";

    }
    [self.navigationController pushViewController:AnnouncementOfTheDetails animated:YES];
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section==0) {
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
                [btn setTitle:@"消息" forState:UIControlStateNormal];
            }else{
                [btn setTitle:@"公告" forState:UIControlStateNormal];
            }
            if (i==index) {
                btn.selected=YES;
            }
            [btn addTarget:self action:@selector(onConditionsForScreeningClick:) forControlEvents:UIControlEventTouchUpInside];
            [view addSubview:btn];
            btn.sd_layout.leftSpaceToView(view, (WIDTH/2)*i).bottomSpaceToView(view, 3).heightIs(42).widthIs(WIDTH/2);
        }
        UILabel *line=[[UILabel alloc]init];
        line.backgroundColor=[self colorWithHexString:@"de0024"];
        [view addSubview:line];
        if (index==0) {
             line.sd_layout.leftSpaceToView(view, 0).bottomSpaceToView(view, 0).heightIs(1.5).widthIs(WIDTH/2);
        }else{
         line.sd_layout.leftSpaceToView(view, WIDTH/2).bottomSpaceToView(view, 0).heightIs(1.5).widthIs(WIDTH/2);
        }
       
        return view;
        
    }else{
        MessageListHeaderView *HeaderView=[[MessageListHeaderView alloc]init];
        if (index==1) {
            HeaderView.time.text=@"2016-02-03 12:20";
        }
        return HeaderView;
    }
    return nil;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (index==0) {
        MessageCell *cell=[[MessageCell alloc]init];
        cell.backgroundColor=[self colorWithHexString:@"f3f5f7"];
        cell.nameTXT=@"我是名字";
        cell.redTXT=@"a";
        cell.timeTXT=@"2016-02-98";
        cell.contextTXT=@"时光飞逝不放假舒服不舒服更深刻收款返款尖峰时刻刷卡缴费时快捷方式看见分公司快捷回复";
        return cell;
    }else{
        AnnouncementCell *cell=[[AnnouncementCell alloc]init];
        cell.nameString=@"哈哈哈哈哈哈哈";
        cell.contextString=@"is覅素钙蛋白的噶比大股东嘎嘣第八大不大看似简单不付款时间发布时间开放第三方不都看世界杯刷卡机交封不杀会计法吧空间吧看到祭敖包刷卡缴费靠近岸边";
        return cell;
    }
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
CANCEL
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
