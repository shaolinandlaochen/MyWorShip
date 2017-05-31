//
//  UseGuideViewController.m
//  MyWorShip
//
//  Created by 123 on 2017/5/27.
//  Copyright © 2017年 123. All rights reserved.
//

#import "UseGuideViewController.h"
#import "UseGuideNameTableViewCell.h"
#import "UseGuideContextTableViewCell.h"
#import "GuideTheContentViewController.h"
@interface UseGuideViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_NameTableView;
    UITableView *_ContextTableView;
}

@end

@implementation UseGuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"使用指南";
    lfteItemAndColor
    NAVHEIGHT
    RECTSTATUS
    
    UILabel *lbl=[[UILabel alloc]init];
    lbl.text=@"猜您遇到了以下问题";
    lbl.font=[UIFont systemFontOfSize:12];
    lbl.textColor=[self colorWithHexString:@"a3a3a3"];
    [self.view addSubview:lbl];
    lbl.sd_layout.leftSpaceToView(self.view, 11).rightSpaceToView(self.view, 0).topSpaceToView(self.view, navheight+rectStatus.size.height).heightIs(30);
    
    
    _NameTableView=[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    _NameTableView.backgroundColor=[self colorWithHexString:@"f3f5f7"];
    _NameTableView.delegate=self;
    _NameTableView.dataSource=self;
    _NameTableView.scrollEnabled=NO;
    _NameTableView.showsVerticalScrollIndicator = NO;
    _NameTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _NameTableView.separatorColor=[UIColor clearColor];
    [self.view addSubview:_NameTableView];
    _NameTableView.sd_layout.leftSpaceToView(self.view, 0).topSpaceToView(self.view, navheight+rectStatus.size.height+30).widthIs(80).bottomSpaceToView(self.view, 0);
    
    

    
    _ContextTableView=[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    _ContextTableView.backgroundColor=[self colorWithHexString:@"f3f5f7"];
    _ContextTableView.delegate=self;
    _ContextTableView.dataSource=self;
    _ContextTableView.scrollEnabled=NO;
    _ContextTableView.showsVerticalScrollIndicator = NO;
    _ContextTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _ContextTableView.separatorColor=[UIColor clearColor];
    [self.view addSubview:_ContextTableView];
    _ContextTableView.sd_layout.leftSpaceToView(_NameTableView, 0).topSpaceToView(self.view, navheight+rectStatus.size.height+30).rightSpaceToView(self.view, 0).bottomSpaceToView(self.view, 0);
    // Do any additional setup after loading the view.
}
CANCEL
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView==_NameTableView) {
        return 6;
    }
    return 7;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==_NameTableView) {
        if (indexPath.row==3) {
            return 94;
        }else{
            return 47;
        }
    }
    return 47;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    GuideTheContentViewController *GuideTheContent=[[GuideTheContentViewController alloc]init];
    switch (indexPath.row) {
        case 0:
        {
            GuideTheContent.stringName=@"注册";
            
        }
            break;
        case 1:
        {//邀请好友
            GuideTheContent.stringName=@"邀请好友";
        }
            break;
        case 2:
        {
            GuideTheContent.stringName=@"优惠券问题";
        }
            break;
        case 3:
        {
            GuideTheContent.stringName=@"联系我们";
        }
            break;
        case 4:
        {
            GuideTheContent.stringName=@"联系我们";
        }
            break;
        case 5:
        {//关于奇拜
            GuideTheContent.stringName=@"关于我们";
        }
            break;
        case 6:
        {
            GuideTheContent.stringName=@"用户服务协议";
        }
            break;
            
            
        default:
            break;
    }
   [self.navigationController pushViewController:GuideTheContent animated:YES];
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=[self colorWithHexString:@"f3f5f7"];
    return view;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==_NameTableView) {
        UseGuideNameTableViewCell *cell=[[UseGuideNameTableViewCell alloc]init];
        cell.userInteractionEnabled=NO;
        switch (indexPath.row) {
            case 0:
            {
                cell.name.text=@"注册";
            }
                break;
            case 1:
            {
                cell.name.text=@"邀请好友";
            }
                break;
            case 2:
            {
                cell.name.text=@"优惠券问题";
            }
                break;
            case 3:
            {
                cell.name.text=@"联系我们";
            }
                break;
            case 4:
            {
                cell.name.text=@"关于我们";
            }
                break;
            case 5:
            {
                cell.name.text=@"用户协议";
            }
                break;
                
                
            default:
                break;
        }
        return cell;
    }else{
        UseGuideContextTableViewCell *cell=[[UseGuideContextTableViewCell alloc]init];
        switch (indexPath.row) {
            case 0:
            {
                cell.context.text=@"如何注册?";
            }
                break;
            case 1:
            {
                cell.context.text=@"如何邀请好友?";
            }
                break;
            case 2:
            {
                cell.context.text=@"邀请好友后,为何没有获得优惠券?";
            }
                break;
            case 3:
            {
                cell.context.text=@"如何与客服人员联系?";
            }
                break;
            case 4:
            {
                cell.context.text=@"公共事务相关";
            }
                break;
            case 5:
            {
                cell.context.text=@"关于奇拜";
            }
                break;
            case 6:
            {
                cell.context.text=@"用户服务协议";
            }
                break;
                
                
            default:
                break;
        }
        return cell;
    }
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=NO;
    self.automaticallyAdjustsScrollViewInsets = NO;//取消自动布局
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
