//
//  GuideTheContentViewController.m
//  MyWorShip
//
//  Created by 123 on 2017/5/27.
//  Copyright © 2017年 123. All rights reserved.
//

#import "GuideTheContentViewController.h"

@interface GuideTheContentViewController ()

@end

@implementation GuideTheContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.title=self.stringName;
    lfteItemAndColor
   
    // Do any additional setup after loading the view.
}
CANCEL
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=NO;
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
