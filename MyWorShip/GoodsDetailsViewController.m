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
#import "HTMLCell.h"
#import "PayViewController.h"
@interface GoodsDetailsViewController ()<UITableViewDelegate,UITableViewDataSource,ScrollViewCellDelegate,HTMLContextDelegate>
{
    UITableView *_tableView;
    CGFloat HTMLheight;
}

@end

@implementation GoodsDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"商品详情";
    lfteItemAndColor
    HTMLheight=0;
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
#pragma mark 获取商品详情
-(void)RequestData{
    if (self.goodsID!=nil) {
        [GoodsRequest GetProductDetails:self.goodsID block:^(NSDictionary *dic) {
            GoodsDetilBaseClass *class=[[GoodsDetilBaseClass alloc]initWithDictionary:[self deleteEmpty:dic]];
            if ([stringFormat(class.code) isEqualToString:@"3"]) {
                self.dataDic=[self deleteEmpty:dic];
                [_tableView reloadData];
            }else{
                [SVProgressHUD showErrorWithStatus:class.msg];
            }
            
            [_tableView.mj_header endRefreshing];
        }];
    }
    
}
#pragma mark 接收富文本缓存高度
-(void)htmlHeight:(float)height{
    if (height>HTMLheight) {
        HTMLheight=height;
        FormToUpdate(2, _tableView)
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.dataDic!=nil) {
        return 3;
    }
    return 0;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 2;
    }else if (section==1){
        GoodsDetilBaseClass *class=[[GoodsDetilBaseClass alloc]initWithDictionary:self.dataDic];
        return class.listComment.count;
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
        GoodsDetilBaseClass *class=[[GoodsDetilBaseClass alloc]initWithDictionary:self.dataDic];
        GoodsDetilListComment *model=class.listComment[indexPath.row];
        return [tableView cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:[CommentsCell class] contentViewWidth:self.view.frame.size.width];
    }else if (indexPath.section==2){
        return HTMLheight;
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==1) {
        GoodsDetilBaseClass *class=[[GoodsDetilBaseClass alloc]initWithDictionary:self.dataDic];
        if (class.listComment.count>0) {
            return 55;
        }
    }
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==1) {
        GoodsDetilBaseClass *class=[[GoodsDetilBaseClass alloc]initWithDictionary:self.dataDic];
        if (class.listComment.count>0) {
            return 40;
        }
    }
    return 0;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=[self colorWithHexString:@"f3f5f7"];
    if (section==1) {
        GoodsDetilBaseClass *class=[[GoodsDetilBaseClass alloc]initWithDictionary:self.dataDic];
        if (class.listComment.count>0) {
            view.backgroundColor=[self colorWithHexString:@"ffffff"];
            UILabel *lbl=[[UILabel alloc]init];
            lbl.textColor=[MyClass colorWithHexString:@"a3a3a3"];
            lbl.font=[UIFont systemFontOfSize:14];
            lbl.text=[NSString stringWithFormat:@"(评价:%ld)",class.listComment.count];
            [view addSubview:lbl];
            lbl.sd_layout.leftSpaceToView(view, 12).topSpaceToView(view, 0).bottomSpaceToView(view, 0).widthIs(200);
        }
        
    }
    return view;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=[self colorWithHexString:@"f3f5f7"];
    if (section==1) {
        GoodsDetilBaseClass *class=[[GoodsDetilBaseClass alloc]initWithDictionary:self.dataDic];
        if (class.listComment.count>0) {
            view.backgroundColor=[self colorWithHexString:@"ffffff"];
            UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
            [btn setTitle:[NSString stringWithFormat:@"全部评论:%ld",class.listComment.count] forState:UIControlStateNormal];
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
        
    }
    return view;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GoodsDetilBaseClass *class=[[GoodsDetilBaseClass alloc]initWithDictionary:self.dataDic];
    if (indexPath.section==0&&indexPath.row==0) {//滚动视图
        
        static NSString *string=@"indexPath1";
        ScrollViewCell *cell=[tableView dequeueReusableCellWithIdentifier:string];
        if (!cell) {
            cell=[[ScrollViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
            
        }
        cell.model=class;
        cell.delegate=self;
        return cell;
    }else if (indexPath.section==0&&indexPath.row==1){//商品描述和价格
        
        CELLINIT(@"indexPath2", GoodsContextCell)
        cell.name.text=class.comm.commodityName;
        cell.price.text=[NSString stringWithFormat:@"¥%.2f元",class.comm.commoditySellprice];

        NSString *stringContext=[NSString stringWithFormat:@"¥%.2f元",class.comm.commodityMarketprice];
        NSMutableAttributedString *attributeMarket = [[NSMutableAttributedString alloc] initWithString:stringContext];
        [attributeMarket setAttributes:@{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle], NSBaselineOffsetAttributeName : @(NSUnderlineStyleSingle)} range:NSMakeRange(0,stringContext.length)];
        cell.listPrice.attributedText=attributeMarket;
        cell.contextNumber.text=[NSString stringWithFormat:@"已售%.0f 剩余%.0f",class.comm.commoditySales,class.comm.commodityReserves];
        return cell;
    }else if (indexPath.section==1){//商品评价
        static NSString *string=@"indexPath3";
        CommentsCell *cell=[tableView dequeueReusableCellWithIdentifier:string];
        if (!cell) {
            cell=[[CommentsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
        }
         GoodsDetilListComment *model=class.listComment[indexPath.row];
        cell.model=model;
        return cell;
    
    }else{
      
        CELLINIT(@"indexPath4", GoodsDetailsCell)
        cell.delegate=self;
        cell.commodity_desc=class.comm.commodityDesc;
        return cell;
    }
    

}
#pragma mark 点击滚动图片执行该方法
-(void)cycleScrollView_didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"%ld",index);
}

#pragma mark 查看全部评论
-(void)onCommentsClick{
    GoodsDetilBaseClass *class=[[GoodsDetilBaseClass alloc]initWithDictionary:self.dataDic];
    AllCommentsViewController *AllComments=[[AllCommentsViewController alloc]init];
    AllComments.serial=[NSString stringWithFormat:@"%.0f",class.comm.commoditySerial];
    [self.navigationController pushViewController:AllComments animated:YES];
}
#pragma mark 立即购买
-(void)onBuyClick{
    GoodsDetilBaseClass *class=[[GoodsDetilBaseClass alloc]initWithDictionary:self.dataDic];
    PayViewController *Pay=[[PayViewController alloc]init];
    Pay.imgUrl=self.imgUrl;
    Pay.model=class;
    Pay.equipment_uuid=self.equipment_uuid;
    Pay.commodity_serial=[NSString stringWithFormat:@"%.0f",class.comm.commoditySerial];
    [self.navigationController pushViewController:Pay animated:YES];
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
