//
//  ViewController.m
//  MyWorShip
//
//  Created by 123 on 2017/5/23.
//  Copyright © 2017年 123. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self CreateAView];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)CreateAView{
    HomeViewController *home=[[HomeViewController alloc]init];
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:home];
     [[UIApplication sharedApplication].delegate window].rootViewController=nav;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
