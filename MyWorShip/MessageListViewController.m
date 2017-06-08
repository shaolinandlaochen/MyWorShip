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
#import "MyMessageRequest.h"
@interface MessageListViewController ()<UITableViewDelegate,UITableViewDataSource,AnnouncementOfTheDetailsDelegate>
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
    TheDrop_downRefresh(_tableView, @selector(CaretDatas))

   // [self NULLData];

    // Do any additional setup after loading the view.
}
#pragma mark 获取数据
-(void)CaretDatas{
    if (index==0) {//消息列表
        [MyMessageRequest TheMessageListpage:1 pageSize:10 block:^(NSDictionary *dic) {
            
            MyMessageListBaseClass *class=[[MyMessageListBaseClass alloc]initWithDictionary:[self deleteEmpty:dic]];
            if ([class.code isEqualToString:@"3"]) {
                self.MessageDataDic=[self deleteEmpty:dic];
                [_tableView reloadData];
                if (class.data.resultList.count<1) {
                    [self NULLData];
                }else{
                    [[self.view viewWithTag:852]removeFromSuperview];
                    [[self.view viewWithTag:753]removeFromSuperview];
                    
                }
            }else{
                [SVProgressHUD showErrorWithStatus:class.msg];
            }
              [_tableView.mj_header endRefreshing];
            
        }];
    }else if (index==1){//公告列表
    [MyMessageRequest ToObtainAListAnnouncement_page:1 pageSize:500 block:^(NSDictionary *dic) {
        AnnouncementListBaseClass *class=[[AnnouncementListBaseClass alloc]initWithDictionary:[self deleteEmpty:dic]];
        if ([class.code isEqualToString:@"3"]) {
            self.AnnouncementDataDic=[self deleteEmpty:dic];
            [_tableView reloadData];
            if (class.data.resultList.count<1) {
                [self NULLData];
            }else{
                [[self.view viewWithTag:852]removeFromSuperview];
                [[self.view viewWithTag:753]removeFromSuperview];
                
            }
        }else{
            [SVProgressHUD showErrorWithStatus:class.msg];
        }
        [_tableView.mj_header endRefreshing];
    }];
    }
   

}

#pragma mark消息已读
-(void)TheMessageHasBeenRead{
    [self CaretDatas];
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
    lbl.tag=753;
    lbl.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:lbl];
    lbl.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).topSpaceToView(img, 19).autoHeightRatio(0);
    
}
#pragma mark 点击筛选按钮执行该方法
-(void)onConditionsForScreeningClick:(MyButton *)btn{
    index=btn.tag-1;
    [SVProgressHUD showWithStatus:loading];
    [self CaretDatas];

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (index==0) {
    MyMessageListBaseClass *class=[[MyMessageListBaseClass alloc]initWithDictionary:self.MessageDataDic];
        return class.data.resultList.count+1;
    }else if (index==1){
        AnnouncementListBaseClass *class=[[AnnouncementListBaseClass alloc]initWithDictionary:[self deleteEmpty:self.AnnouncementDataDic]];
        return class.data.resultList.count+1;
    }
    return 0;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section>0) {
        return 1;
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (index==1) {
        AnnouncementListBaseClass *class=[[AnnouncementListBaseClass alloc]initWithDictionary:[self deleteEmpty:self.AnnouncementDataDic]];
        AnnouncementListResultList *list=class.data.resultList[indexPath.section-1];
        return [tableView cellHeightForIndexPath:indexPath model:list keyPath:@"model" cellClass:[AnnouncementCell class] contentViewWidth:self.view.frame.size.width];
        return 157;
    }else if (index==0){
        MyMessageListBaseClass *class=[[MyMessageListBaseClass alloc]initWithDictionary:self.MessageDataDic];
        MyMessageListResultList *list=class.data.resultList[indexPath.section-1];
        return [tableView cellHeightForIndexPath:indexPath model:list keyPath:@"model" cellClass:[MessageCell class] contentViewWidth:self.view.frame.size.width];
    }
    return 0;
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
    AnnouncementOfTheDetails.delegate=self;
    if (index==0) {//消息详情
     AnnouncementOfTheDetails.titleString=@"消息详情";
        MyMessageListBaseClass *class=[[MyMessageListBaseClass alloc]initWithDictionary:self.MessageDataDic];
        MyMessageListResultList *list=class.data.resultList[indexPath.section-1];
        AnnouncementOfTheDetails.model=list;
        
    }else{//公告详情
     AnnouncementOfTheDetails.titleString=@"公告详情";
        AnnouncementListBaseClass *class=[[AnnouncementListBaseClass alloc]initWithDictionary:[self deleteEmpty:self.AnnouncementDataDic]];
        AnnouncementListResultList *list=class.data.resultList[indexPath.section-1];
        AnnouncementOfTheDetails.annModel=list;

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
            AnnouncementListBaseClass *class=[[AnnouncementListBaseClass alloc]initWithDictionary:[self deleteEmpty:self.AnnouncementDataDic]];
            AnnouncementListResultList *list=class.data.resultList[section-1];
            HeaderView.timeString=stringFormat(list.noticeTime);
        }
        return HeaderView;
    }
    return nil;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (index==0) {
        static NSString *string=@"indexpath";
        MessageCell *cell=[tableView dequeueReusableCellWithIdentifier:string];
        if (!cell) {
            cell=[[MessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
        }
        MyMessageListBaseClass *class=[[MyMessageListBaseClass alloc]initWithDictionary:self.MessageDataDic];
        MyMessageListResultList *list=class.data.resultList[indexPath.section-1];
        cell.model=list;
        cell.backgroundColor=[self colorWithHexString:@"ffffff"];

        return cell;
    }else{
        AnnouncementListBaseClass *class=[[AnnouncementListBaseClass alloc]initWithDictionary:[self deleteEmpty:self.AnnouncementDataDic]];
        AnnouncementListResultList *list=class.data.resultList[indexPath.section-1];
        AnnouncementCell *cell=[[AnnouncementCell alloc]init];
        cell.model=list;
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
