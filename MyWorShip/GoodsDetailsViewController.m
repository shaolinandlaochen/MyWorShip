//
//  GoodsDetailsViewController.m
//  MyWorShip
//
//  Created by 123 on 2017/6/8.
//  Copyright © 2017年 123. All rights reserved.
//

#import "GoodsDetailsViewController.h"
#import "GoodsDetailsCell.h"
#import "ScrollViewCell.h"
#import "GoodsContextCell.h"
#import "CommentsCell.h"
#import "AllCommentsViewController.h"
#import "GoodsRequest.h"
@interface GoodsDetailsViewController ()<UITableViewDelegate,UITableViewDataSource,ScrollViewCellDelegate>
{
    UITableView *_tableView;
}

@end

@implementation GoodsDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"商品详情";
    lfteItemAndColor
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _tableView.separatorColor=[self colorWithHexString:@"d7d7d7"];
    _tableView.backgroundColor=[self colorWithHexString:@"#f3f5f7"];
    [self.view addSubview:_tableView];
    if (self.why!=nil) {
        _tableView.sd_layout.leftSpaceToView(self.view, 0).topSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).bottomSpaceToView(self.view, 50);
        UIButton *buyBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [buyBtn setTitle:@"立即购买" forState:UIControlStateNormal];
        [buyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        buyBtn.backgroundColor=[MyClass colorWithHexString:@"ff4c59"];
        buyBtn.titleLabel.font=[UIFont systemFontOfSize:18];
        [buyBtn addTarget:self action:@selector(onBuyClick) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:buyBtn];
        buyBtn.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).bottomSpaceToView(self.view, 0).heightIs(50);
    }else{
    _tableView.sd_layout.leftSpaceToView(self.view, 0).topSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).bottomSpaceToView(self.view, 0);
    }

    
    TheDrop_downRefresh(_tableView, @selector(RequestData))
    // Do any additional setup after loading the view.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 2;
    }else if (section==1){
        return 2;
    }else{
        return 1;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0&&indexPath.row==0) {
        return WIDTH+10;
    }else if (indexPath.section==0&&indexPath.row==1){
        return 112;
    }else if (indexPath.section==1){
    MyMessageListResultList *list=[[MyMessageListResultList alloc]init];
    return [tableView cellHeightForIndexPath:indexPath model:list keyPath:@"model" cellClass:[CommentsCell class] contentViewWidth:self.view.frame.size.width];
    }
    return 130;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==1) {
        return 55;
    }
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==1) {
        return 40;
    }
    return 0;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    GoodsDetailsViewController *GoodsDetails=[[GoodsDetailsViewController alloc]init];
    [self.navigationController pushViewController:GoodsDetails animated:YES];
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=[self colorWithHexString:@"f3f5f7"];
    if (section==1) {
        view.backgroundColor=[self colorWithHexString:@"ffffff"];
        UILabel *lbl=[[UILabel alloc]init];
        lbl.textColor=[MyClass colorWithHexString:@"a3a3a3"];
        lbl.font=[UIFont systemFontOfSize:14];
        lbl.text=@"(评价123)";
        [view addSubview:lbl];
        lbl.sd_layout.leftSpaceToView(view, 12).topSpaceToView(view, 0).bottomSpaceToView(view, 0).widthIs(200);
    }
    return view;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=[self colorWithHexString:@"f3f5f7"];
    if (section==1) {
        view.backgroundColor=[self colorWithHexString:@"ffffff"];
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"全部评论:123" forState:UIControlStateNormal];
        [btn setTitleColor:[MyClass colorWithHexString:@"a3a3a3"] forState:UIControlStateNormal];
        btn.titleLabel.font=[UIFont systemFontOfSize:14];
        [btn.layer setBorderColor:[MyClass colorWithHexString:@"#d7d7d7"].CGColor];
        [btn.layer setBorderWidth:1];
        [btn.layer setMasksToBounds:YES];
        btn.layer.cornerRadius = 6;
        btn.layer.masksToBounds = 6;
        [btn addTarget:self action:@selector(onCommentsClick) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btn];
        btn.sd_layout.leftSpaceToView(view, 12.5).topSpaceToView(view, 10).rightSpaceToView(view, 12.5).bottomSpaceToView(view, 10);
    }
    return view;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0&&indexPath.row==0) {//滚动视图
        
        static NSString *string=@"indexPath1";
        ScrollViewCell *cell=[tableView dequeueReusableCellWithIdentifier:string];
        if (!cell) {
            cell=[[ScrollViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
            
        }
        cell.delegate=self;
        cell.imgUrlArray=@[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1496896212505&di=b8d93bfa2af4e893fd33d2826644c612&imgtype=0&src=http%3A%2F%2Fimg.67.com%2Fupload%2Fimages%2F2016%2F03%2F27%2F1459048283_1466410327.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1496896212503&di=1e0fe3f6f1f6bd7b8b107804c66ee844&imgtype=0&src=http%3A%2F%2Fimg.mp.sohu.com%2Fupload%2F20170519%2F8c6d7f2b3816486aa995f71f226c19ac_th.png"];
        return cell;
    }else if (indexPath.section==0&&indexPath.row==1){//商品描述和价格
        static NSString *string=@"indexPath2";
        GoodsContextCell *cell=[tableView dequeueReusableCellWithIdentifier:string];
        if (!cell) {
            cell=[[GoodsContextCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
        }
        cell.name.text=@"司法不是滴地方环保的司法部的司法不少地方不少地方不是史蒂夫的司法";
        cell.price.text=@"¥200.00元";

        NSString *stringContext=@"¥200.00元";
        NSMutableAttributedString *attributeMarket = [[NSMutableAttributedString alloc] initWithString:stringContext];
        [attributeMarket setAttributes:@{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle], NSBaselineOffsetAttributeName : @(NSUnderlineStyleSingle)} range:NSMakeRange(0,stringContext.length)];
        cell.listPrice.attributedText=attributeMarket;
        cell.contextNumber.text=@"已售10 剩余20";
        return cell;
    }else if (indexPath.section==1){//商品评价
        static NSString *string=@"indexPath3";
        CommentsCell *cell=[tableView dequeueReusableCellWithIdentifier:string];
        if (!cell) {
            cell=[[CommentsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
        }
         MyMessageListResultList *list=[[MyMessageListResultList alloc]init];
        cell.model=list;
        return cell;
    
    }
    
    else{
        
        static NSString *string=@"indexPath4";
        GoodsDetailsCell *cell=[tableView dequeueReusableCellWithIdentifier:string];
        if (!cell) {
            cell=[[GoodsDetailsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
        }
        return cell;
    }
    

}
#pragma mark 点击滚动图片执行该方法
-(void)cycleScrollView_didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"%ld",index);
}
#pragma mark 获取商品详情
-(void)RequestData{
    if (self.goodsID!=nil) {
        [GoodsRequest GetProductDetails:self.goodsID block:^(NSDictionary *dic) {
            
            [_tableView.mj_header endRefreshing];
        }];
    }
    
    

}
#pragma mark 查看全部评论
-(void)onCommentsClick{
    AllCommentsViewController *AllComments=[[AllCommentsViewController alloc]init];
    [self.navigationController pushViewController:AllComments animated:YES];
}
#pragma mark 立即购买
-(void)onBuyClick{

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
