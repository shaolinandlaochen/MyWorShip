//
//  HomeViewController.m
//  MyWorShip
//
//  Created by 123 on 2017/5/23.
//  Copyright © 2017年 123. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()<MAMapViewDelegate>
{
    MAMapView *_mapView;
    LocationAnnotationView *_locationAnnotationView;
    MyImage *_BjImage;
    CGPoint _point;
    
}
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"奇拜";
    self.view.backgroundColor=[self colorWithHexString:@"f3f5f7"];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:[self colorWithHexString:@"ff4e54"]}];
    [self.navigationController.navigationBar setBarTintColor:[[UIColor blackColor]colorWithAlphaComponent:0.9]];
    [self addLeftItemAndRightItem];
    [self AddAMap];
    [self AddAllViews];
    // Do any additional setup after loading the view.
}
#pragma mark 添加左右按钮项
-(void)addLeftItemAndRightItem{

    MyButton *leftItem=[MyButton buttonWithType:UIButtonTypeCustom];
    [leftItem setImage:[UIImage imageNamed:@"icon_mine"] forState:UIControlStateNormal];
    [leftItem addTarget:self  action:@selector(onNavButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    leftItem.tag=1;
    [leftItem sizeToFit];
    UIBarButtonItem *informationCardItem = [[UIBarButtonItem alloc] initWithCustomView:leftItem];
     self.navigationItem.leftBarButtonItems  = @[informationCardItem];
    
    MyButton *rightItem=[MyButton buttonWithType:UIButtonTypeCustom];
    [rightItem setImage:[UIImage imageNamed:@"icon_youhui"] forState:UIControlStateNormal];
    [rightItem addTarget:self  action:@selector(onNavButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    rightItem.tag=2;
    [rightItem sizeToFit];
    UIBarButtonItem *rightItemItem = [[UIBarButtonItem alloc] initWithCustomView:rightItem];
    self.navigationItem.rightBarButtonItems  = @[rightItemItem];
    
}
#pragma mark 点击左右按钮项进入该方法
-(void)onNavButtonClick:(MyButton *)btn{
    if (btn.tag==1) {
        //左
    }else{
    //右
    }

}
#pragma mark 添加扫描等按钮
-(void)AddAllViews{
    //背景图片
    _BjImage=[[MyImage alloc]init];
    _BjImage.image=[UIImage imageNamed:@"shape_unfold"];
    float y=self.view.frame.size.height-225;
    _BjImage.userInteractionEnabled=YES;
    _BjImage.frame=CGRectMake(0, y, self.view.frame.size.width, 225);
    [self.view addSubview:_BjImage];
    //上下箭头
    MyButton *UpAndDown=[MyButton buttonWithType:UIButtonTypeCustom];
    [UpAndDown setImage:[UIImage imageNamed:@"icon_up"] forState:UIControlStateNormal];
    [UpAndDown setImage:[UIImage imageNamed:@"icon_down"] forState:UIControlStateSelected];
    UpAndDown.selected=YES;
    [UpAndDown addTarget:self action:@selector(onUpAndDownClick:) forControlEvents:UIControlEventTouchUpInside];
    [_BjImage addSubview:UpAndDown];
    UpAndDown.sd_layout.leftSpaceToView(_BjImage, (self.view.frame.size.width-32)/2).topSpaceToView(_BjImage, 18).widthIs(32).heightIs(32);
    //底部定位按钮
    MyButton *positioning=[MyButton buttonWithType:UIButtonTypeCustom];
    positioning.tag=3;
    [positioning setImage:[UIImage imageNamed:@"icon_dingwei"] forState:UIControlStateNormal];
    [positioning addTarget:self action:@selector(PositioningAndFeedback:) forControlEvents:UIControlEventTouchUpInside];
    [_BjImage addSubview:positioning];
    positioning.sd_layout.leftSpaceToView(_BjImage, 22).bottomSpaceToView(_BjImage, 18).widthIs(27).heightIs(27);
    
    //lamp
    //底部反馈按钮
    MyButton *Feedback=[MyButton buttonWithType:UIButtonTypeCustom];
    Feedback.tag=4;
    [Feedback setImage:[UIImage imageNamed:@"icon_fankui"] forState:UIControlStateNormal];
    [Feedback addTarget:self action:@selector(PositioningAndFeedback:) forControlEvents:UIControlEventTouchUpInside];
    [_BjImage addSubview:Feedback];
    Feedback.sd_layout.rightSpaceToView(_BjImage, 22).bottomSpaceToView(_BjImage, 18).widthIs(27).heightIs(27);
    
    //扫描按钮
    MyButton *scanning=[MyButton buttonWithType:UIButtonTypeCustom];
    [scanning setBackgroundImage:[UIImage imageNamed:@"btn_scan"] forState:UIControlStateNormal];
    [scanning addTarget:self action:@selector(onScanningClick:) forControlEvents:UIControlEventTouchUpInside];
    [_BjImage addSubview:scanning];
    float orgerY=self.view.frame.size.width-150;
    scanning.sd_layout.leftSpaceToView(_BjImage, orgerY/2).rightSpaceToView(_BjImage, orgerY/2).topSpaceToView(_BjImage, 50).heightIs(150);
    
    MyButton *scanning1=[MyButton buttonWithType:UIButtonTypeCustom];
    [scanning1 setBackgroundImage:[UIImage imageNamed:@"icon_saoyisao"] forState:UIControlStateNormal];
    [scanning1 addTarget:self action:@selector(onScanningClick:) forControlEvents:UIControlEventTouchUpInside];
    [scanning addSubview:scanning1];
    float orgerY1=150-30;
    scanning1.sd_layout.leftSpaceToView(scanning, orgerY1/2).rightSpaceToView(scanning, orgerY1/2).topSpaceToView(scanning, 40).heightIs(30);
    
    UILabel *name=[[UILabel alloc]init];
    name.textColor=[UIColor whiteColor];
    name.font=[UIFont systemFontOfSize:20];
    name.textAlignment=NSTextAlignmentCenter;
    name.text=@"扫描奇拜";
    [scanning addSubview:name];
    name.sd_layout.leftSpaceToView(scanning, 0).rightSpaceToView(scanning, 0).topSpaceToView(scanning1, 16).autoHeightRatio(0);
    
    
}
#pragma mark 点击定位或者反馈
-(void)PositioningAndFeedback:(MyButton *)btn{
    if (btn.tag==3) {
        //定位
    }else{
    //反馈
    }
}
#pragma mark 收缩或者展开
-(void)onUpAndDownClick:(MyButton *)btn{
   
    if (btn.selected) {
        
        float y=self.view.frame.size.height-65;
        [UIView animateWithDuration:0.5 animations:^{
            _BjImage.frame=CGRectMake(0, y, self.view.frame.size.width, 225);
        }];
    }else{
       
    [UIView animateWithDuration:0.5 animations:^{
        float y=self.view.frame.size.height-225;
        _BjImage.frame=CGRectMake(0, y, self.view.frame.size.width, 225);
    }];
    }
     btn.selected=!btn.selected;
}
#pragma mark 扫描
-(void)onScanningClick:(MyButton *)btn{
    
}
#pragma  mark 添加 地图
-(void)AddAMap{
    ///地图需要v4.5.0及以上版本才必须要打开此选项（v4.5.0以下版本，需要手动配置info.plist）
    [AMapServices sharedServices].enableHTTPS = YES;
    
    ///初始化地图
    _mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    _mapView.zoomLevel=15;//缩放级别
    ///把地图添加至view
    [self.view addSubview:_mapView];
    ///如果您需要进入地图就显示定位小蓝点，则需要下面两行代码
    _mapView.showsUserLocation = YES;
    _mapView.userTrackingMode = MAUserTrackingModeFollowWithHeading;
    _mapView.delegate = self;
    _mapView.customizeUserLocationAccuracyCircleRepresentation = YES;
    
    MAUserLocationRepresentation *r = [[MAUserLocationRepresentation alloc] init];
    //精度圈是否显示：
    r.showsAccuracyRing = YES;///精度圈是否显示，默认YES
    //是否显示蓝点方向指向：
    r.showsHeadingIndicator = YES;///是否显示方向指示(MAUserTrackingModeFollowWithHeading模式开启)。默认为YES
    //调整精度圈填充颜色：
    r.fillColor = [UIColor redColor];///精度圈 填充颜色, 默认 kAccuracyCircleDefaultColor
    //调整精度圈边线颜色：
    r.strokeColor = [UIColor blueColor];///精度圈 边线颜色, 默认 kAccuracyCircleDefaultColor
    //调整精度圈边线宽度：
    r.lineWidth = 2;///精度圈 边线宽度，默认0
    // 精度圈是否显示律动效果：
    r.enablePulseAnnimation = YES;///内部蓝色圆点是否使用律动效果, 默认YES
    //调整定位蓝点的背景颜色：
    r.locationDotBgColor = [UIColor greenColor];///定位点背景色，不设置默认白色
    //调整定位蓝点的颜色：
    r.locationDotFillColor = [UIColor grayColor];///定位点蓝色圆点颜色，不设置默认蓝色
    //调整定位蓝点的图标：
      r.image = [UIImage imageNamed:@"icon_location"]; ///定位图标, 与蓝色原点互斥
    //执行：
    [_mapView updateUserLocationRepresentation:r];

}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    _mapView.userTrackingMode = MAUserTrackingModeFollow;
    
    
    //扎大头针
    MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
    pointAnnotation.coordinate = CLLocationCoordinate2DMake(30.553147, 104.067998);
    pointAnnotation.title = @"旷世兄弟集团";
    pointAnnotation.subtitle = @"天府二街,东方希望天祥广场";
    
    [_mapView addAnnotation:pointAnnotation];
    
}
- (MAOverlayRenderer *)mapView:(MAMapView *)mapView rendererForOverlay:(id <MAOverlay>)overlay
{
    /* 自定义定位精度对应的MACircleView. */
    if (overlay == mapView.userLocationAccuracyCircle)
    {
        MACircleRenderer *accuracyCircleRenderer = [[MACircleRenderer alloc] initWithCircle:overlay];
        
        accuracyCircleRenderer.lineWidth    = 2.f;
        accuracyCircleRenderer.strokeColor  = [UIColor lightGrayColor];
        accuracyCircleRenderer.fillColor    = [UIColor colorWithRed:1 green:0 blue:0 alpha:.3];
        
        return accuracyCircleRenderer;
    }
    
    return nil;
}

- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation
{
    /* 自定义userLocation对应的annotationView. */
    if ([annotation isKindOfClass:[MAUserLocation class]])
    {
        static NSString *userLocationStyleReuseIndetifier = @"userLocationStyleReuseIndetifier";
        MAAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:userLocationStyleReuseIndetifier];
        if (annotationView == nil)
        {
            annotationView = [[LocationAnnotationView alloc] initWithAnnotation:annotation
                                                                reuseIdentifier:userLocationStyleReuseIndetifier];
            
            annotationView.canShowCallout = YES;
            
        }
        
        _locationAnnotationView = (LocationAnnotationView *)annotationView;
        [_locationAnnotationView updateImage:[UIImage imageNamed:@"icon_location"]];
        
        return annotationView;
    }
    
    //设置大头针
    if ([annotation isKindOfClass:[MAPointAnnotation class]])
    {
        static NSString *pointReuseIndentifier = @"pointReuseIndentifier";
        MAPinAnnotationView*annotationView = (MAPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndentifier];
        if (annotationView == nil)
        {
            annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndentifier];
        }
        annotationView.canShowCallout= YES;       //设置气泡可以弹出，默认为NO
        annotationView.animatesDrop = YES;        //设置标注动画显示，默认为NO
        annotationView.draggable = YES;        //设置标注可以拖动，默认为NO
        annotationView.pinColor = MAPinAnnotationColorPurple;
        annotationView.image=[UIImage imageNamed:@"icon_place"];
        return annotationView;
    }
    
    
    return nil;
}


- (void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation
{
    if (!updatingLocation && _locationAnnotationView != nil)
    {
        _locationAnnotationView.rotateDegree = userLocation.heading.trueHeading - _mapView.rotationDegree;
    }
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
