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
    if ([[NSUserDefaults standardUserDefaults]valueForKey:@"TheUser"]==nil) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:@"用户" forKey:@"TheUser"];
        //同步数据
        [defaults synchronize];
        UIImageView *img=[[UIImageView alloc]init];
        img.frame=self.view.bounds;
        img.image=[UIImage imageNamed:@"initial_page"];
        [self.view addSubview:img];
        autoSize
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        [btn addTarget:self action:@selector(onButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        btn.sd_layout.leftSpaceToView(self.view, 30).rightSpaceToView(self.view, 30).bottomSpaceToView(self.view, 220*autoSizeScaleY).heightIs(120*autoSizeScaleY);
    }else{
        [self onButtonClick];//已经不是第一次进来了
    }

    
   // [self CreateAView];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)onButtonClick{
    HomeViewController *home=[[HomeViewController alloc]init];
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:home];
     [[UIApplication sharedApplication].delegate window].rootViewController=nav;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
