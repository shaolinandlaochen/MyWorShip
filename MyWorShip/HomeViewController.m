//
//  HomeViewController.m
//  MyWorShip
//
//  Created by 123 on 2017/5/23.
//  Copyright © 2017年 123. All rights reserved.
//

#import "HomeViewController.h"
#import "SelectableOverlay.h"
@interface HomeViewController ()<MAMapViewDelegate,SGQRCodeScanningVCDelegate,MyViewControllerDelegate,AMapNaviWalkManagerDelegate>
{
    MAMapView *_mapView;
    LocationAnnotationView *_locationAnnotationView;
    MyImage *_BjImage;
    MyButton *_location;
    BOOL state;//地图状态:yes表示正在导航(推荐路线中) no表示常规状态
}
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self addLeftItemAndRightItem];
    [self AddAMap];
    [self AddAllViews];
    [self initWalkManager];
    // Do any additional setup after loading the view.
}
#pragma mark 视图伸缩
-(void)scaling:(BOOL)isScaling{

}
#pragma mark 用户进行步行路线规划
- (void)initProperties
{

    self.routeIndicatorInfoArray = [NSMutableArray array];
    
    CLLocationCoordinate2D oldCoordinate = _mapView.userLocation.coordinate;//获取用户当前位置信息
    self.startPoint = [AMapNaviPoint locationWithLatitude:oldCoordinate.latitude longitude:oldCoordinate.longitude];
    NSLog(@"startPoint===%@-----",self.startPoint);
    NSLog(@"endPoint=====%@-----",self.endPoint);
    [self.walkManager calculateWalkRouteWithStartPoints:@[self.startPoint]
                                              endPoints:@[self.endPoint]];
}
#pragma mark 点击大头针执行该方法
- (void)mapView:(MAMapView *)mapView didSelectAnnotationView:(MAAnnotationView *)view
{
    CLLocationCoordinate2D coorinate = [view.annotation coordinate];
    self.endPoint=[AMapNaviPoint locationWithLatitude:coorinate.latitude longitude:coorinate.longitude];
    NSLog(@"点击大头针执行该方法 = {%f, %f}", coorinate.latitude, coorinate.longitude);
    [self initProperties];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.title=@"月拜";
    self.view.backgroundColor=[self colorWithHexString:@"f3f5f7"];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:[self colorWithHexString:@"ff4e54"]}];
    [self.navigationController.navigationBar setBarTintColor:[[UIColor blackColor]colorWithAlphaComponent:0.9]];
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
         [self ToCreateMyPersonalInformationInterface];
    }else{
    //右
        PreferentialViewController *Preferential=[[PreferentialViewController alloc]init];
        [self.navigationController pushViewController:Preferential animated:YES];
    }

}
#pragma mark 添加扫描等按钮
-(void)AddAllViews{
    //定位
    MyButton *positioningBtn=[MyButton buttonWithType:UIButtonTypeCustom];
    positioningBtn.tag=3;
    [positioningBtn setBackgroundImage:[UIImage imageNamed:@"icon_dingwei"] forState:UIControlStateNormal];
    [positioningBtn addTarget:self action:@selector(PositioningAndFeedback:) forControlEvents:UIControlEventTouchUpInside];
    [self.view  addSubview:positioningBtn];
    positioningBtn.sd_layout.leftSpaceToView(self.view, 15.5).bottomSpaceToView(self.view, 13.5).widthIs(41).heightIs(41);
    
    //反馈
    MyButton *feedbackBtn=[MyButton buttonWithType:UIButtonTypeCustom];
    feedbackBtn.tag=4;
    [feedbackBtn setBackgroundImage:[UIImage imageNamed:@"icon_fankui"] forState:UIControlStateNormal];
    [feedbackBtn addTarget:self action:@selector(PositioningAndFeedback:) forControlEvents:UIControlEventTouchUpInside];
    [self.view  addSubview:feedbackBtn];
    feedbackBtn.sd_layout.rightSpaceToView(self.view, 15.5).bottomSpaceToView(self.view, 13.5).widthIs(41).heightIs(41);
    
    //扫描
    MyButton *scanningBtn=[MyButton buttonWithType:UIButtonTypeCustom];
    scanningBtn.tag=4;
    [scanningBtn setBackgroundImage:[UIImage imageNamed:@"btn_scan"] forState:UIControlStateNormal];
    [scanningBtn addTarget:self action:@selector(onScanningClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view  addSubview:scanningBtn];
    scanningBtn.sd_layout.rightSpaceToView(self.view, (self.view.frame.size.width-134)/2).leftSpaceToView(self.view, (self.view.frame.size.width-134)/2).bottomSpaceToView(self.view, 10).heightIs(52);
    
    //中心点
    UIImageView *IMGCentr=[[UIImageView alloc]init];
    IMGCentr.image=[UIImage imageNamed:@"icon_zuobiao"];
    [self.view addSubview:IMGCentr];
    IMGCentr.sd_layout.leftSpaceToView(self.view, (self.view.frame.size.width-25)/2).topSpaceToView(self.view, (self.view.frame.size.height-38)/2).widthIs(25).heightIs(38);
    
}

#pragma mark 点击定位回到初始位置或者反馈
-(void)PositioningAndFeedback:(MyButton *)btn{
    if (btn.tag==3) {
        //定位
        if(_mapView.userLocation.updating && _mapView.userLocation.location) {
            state=NO;
            [_mapView setCenterCoordinate:_mapView.userLocation.location.coordinate animated:YES];
        }
    }else{
    //反馈
        TeasingViewController *Teasing=[[TeasingViewController alloc]init];
        [self.navigationController pushViewController:Teasing animated:YES];
    }
}

#pragma mark 扫描
-(void)onScanningClick:(MyButton *)btn{
    // 1、 获取摄像设备
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (device) {
        AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if (status == AVAuthorizationStatusNotDetermined) {
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                if (granted) {
                    SGQRCodeScanningVC *Scanning =[[SGQRCodeScanningVC alloc]init];
                    Scanning.delegate=self;
                    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:Scanning];
                    nav.modalPresentationStyle = UIModalPresentationOverFullScreen;
                    [self presentViewController:nav animated:YES completion:^{
                        
                    }];
                    SGQRCodeLog(@"当前线程 - - %@", [NSThread currentThread]);
                    // 用户第一次同意了访问相机权限
                    SGQRCodeLog(@"用户第一次同意了访问相机权限");
                    
                } else {
                    
                    // 用户第一次拒绝了访问相机权限
                    SGQRCodeLog(@"用户第一次拒绝了访问相机权限");
                }
            }];
        } else if (status == AVAuthorizationStatusAuthorized) { // 用户允许当前应用访问相机
            SGQRCodeScanningVC *vc = [[SGQRCodeScanningVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        } else if (status == AVAuthorizationStatusDenied) { // 用户拒绝当前应用访问相机
            UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"⚠️ 警告" message:@"请去-> [设置 - 隐私 - 相机 - 月拜] 打开访问开关" preferredStyle:(UIAlertControllerStyleAlert)];
            UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            
            [alertC addAction:alertA];
            [self presentViewController:alertC animated:YES completion:nil];
            
        } else if (status == AVAuthorizationStatusRestricted) {
            NSLog(@"因为系统原因, 无法访问相册");
        }
    } else {
        UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"未检测到您的摄像头" preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            ListOfGoodsViewController *ListOfGoods=[[ListOfGoodsViewController alloc]init];
            [self.navigationController pushViewController:ListOfGoods animated:YES];
        }];
        
        [alertC addAction:alertA];
        [self presentViewController:alertC animated:YES completion:nil];
    }
//    SGQRCodeScanningVC *Scanning =[[SGQRCodeScanningVC alloc]init];
//    Scanning.delegate=self;
//    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:Scanning];
//    nav.modalPresentationStyle = UIModalPresentationOverFullScreen;
//    [self presentViewController:nav animated:YES completion:^{
//        //nav.view.backgroundColor = [[UIColor clearColor] colorWithAlphaComponent:0.5];
//    }];
}
#pragma  mark 添加 地图
-(void)AddAMap{
    ///地图需要v4.5.0及以上版本才必须要打开此选项（v4.5.0以下版本，需要手动配置info.plist）
    [AMapServices sharedServices].enableHTTPS = YES;
    
    ///初始化地图
    _mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    _mapView.zoomLevel=17;//缩放级别
    ///把地图添加至view
    [self.view addSubview:_mapView];
    ///如果您需要进入地图就显示定位小蓝点，则需要下面两行代码
    _mapView.showsUserLocation = YES;
    _mapView.userTrackingMode = MAUserTrackingModeFollowWithHeading;
    _mapView.delegate = self;
    _mapView.customizeUserLocationAccuracyCircleRepresentation = YES;
    
    MAUserLocationRepresentation *r = [[MAUserLocationRepresentation alloc] init];
    //精度圈是否显示：
    r.showsAccuracyRing = NO;///精度圈是否显示，默认YES
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
#pragma mark 3）初始化 AMapNaviWalkManager。
- (void)initWalkManager
{
    if (self.walkManager == nil)
    {
        self.walkManager = [[AMapNaviWalkManager alloc] init];
        [self.walkManager setDelegate:self];
    }
}

/**
 * @brief 定位失败后，会调用此函数
 * @param mapView 地图View
 * @param error 错误号，参考CLError.h中定义的错误号
 */
- (void)mapView:(MAMapView *)mapView didFailToLocateUserWithError:(NSError *)error{
    [SVProgressHUD showErrorWithStatus:@"定位失败,请检查您当前网络状态或者查看设置是否打开定位设置"];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    _mapView.userTrackingMode = MAUserTrackingModeFollow;
    
    

    
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
    if ([overlay isKindOfClass:[SelectableOverlay class]])
    {
        //路线规划线路展示
        SelectableOverlay * selectableOverlay = (SelectableOverlay *)overlay;
        id<MAOverlay> actualOverlay = selectableOverlay.overlay;
        
        MAPolylineRenderer *polylineRenderer = [[MAPolylineRenderer alloc] initWithPolyline:actualOverlay];
        
        polylineRenderer.lineWidth = 8.f;
        polylineRenderer.strokeColor = selectableOverlay.isSelected ? selectableOverlay.selectedColor : selectableOverlay.regularColor;
        
        return polylineRenderer;
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

/**
 * @brief 位置或者设备方向更新后，会调用此函数
 * @param mapView 地图View
 * @param userLocation 用户定位信息(包括位置与设备方向等数据)
 * @param updatingLocation 标示是否是location数据更新, YES:location数据更新 NO:heading数据更新
 */

- (void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation
{
    if (!updatingLocation && _locationAnnotationView != nil)
    {
        _locationAnnotationView.rotateDegree = userLocation.heading.trueHeading - _mapView.rotationDegree;
        
    }
   
    if (userLocation.location!=nil) {//获取用户当前位置信息
        self.startPoint = [AMapNaviPoint locationWithLatitude:userLocation.location.altitude longitude:userLocation.location.altitude];
    }
    
}
#pragma mark 扫描结果
-(void)ScanResults:(NSString *)context{
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"扫描结果" message:context preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alertC addAction:alertA];
    [self presentViewController:alertC animated:YES completion:nil];
}
#pragma mark 创建我的个人信息界面
-(void)ToCreateMyPersonalInformationInterface{
   MyViewController *myViewCtrol=[[MyViewController alloc]init];
    myViewCtrol.delegate=self;
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:myViewCtrol];
    nav.modalPresentationStyle = UIModalPresentationOverFullScreen;
    nav.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;

    [self presentViewController:nav animated:YES completion:^{
        nav.view.backgroundColor = [[UIColor clearColor] colorWithAlphaComponent:0.0];
    }];
}
/**
 * @brief 地图区域改变完成后会调用此接口
 * @param mapView 地图View
 * @param animated 是否动画
 */
#pragma mark 地图移动结束后获取屏幕中心点,根据区域插入大头针
- (void)mapView:(MAMapView *)mapView regionDidChangeAnimated:(BOOL)animated{
    
    NSLog(@"%f---屏幕中心----%f",mapView.centerCoordinate.latitude,mapView.centerCoordinate.longitude);
    if (!state) {//非导航状态
        MAPointAnnotation *APin = [[MAPointAnnotation alloc] init];
        APin.coordinate = CLLocationCoordinate2DMake(mapView.centerCoordinate.latitude+0.001, mapView.centerCoordinate.longitude+0.0010);
        [mapView removeAnnotations:mapView.annotations];
        [self MrPin:mapView];
    }
    
}
#pragma mark 插入大头针
-(void)MrPin:(MAMapView *)mapView{

    //扎大头针
    MAPointAnnotation *APin = [[MAPointAnnotation alloc] init];
    APin.coordinate = CLLocationCoordinate2DMake(mapView.centerCoordinate.latitude+0.001, mapView.centerCoordinate.longitude+0.0010);
    APin.title = @"旷世兄弟集团";
    APin.subtitle = @"天府二街,东方希望天祥广场";
    
    [_mapView addAnnotation:APin];
}

/**
 * @brief 发生错误时,会调用代理的此方法
 * @param walkManager 步行导航管理类
 * @param error 错误信息
 */
- (void)walkManager:(AMapNaviWalkManager *)walkManager error:(NSError *)error{
    [SVProgressHUD showErrorWithStatus:error.domain];
    NSLog(@"步行路径规划失败1");
}
/**
 * @brief 步行路径规划成功后的回调函数
 * @param walkManager 步行导航管理类
 */
- (void)walkManagerOnCalculateRouteSuccess:(AMapNaviWalkManager *)walkManager{
    NSLog(@"步行路径规划成功");
    state=YES;
    [self showNaviRoutes];
}

/**
 * @brief 步行路径规划失败后的回调函数
 * @param walkManager 步行导航管理类
 * @param error 错误信息,error.code参照AMapNaviCalcRouteState
 */
- (void)walkManager:(AMapNaviWalkManager *)walkManager onCalculateRouteFailure:(NSError *)error{
[SVProgressHUD showErrorWithStatus:error.domain];
    NSString *str=[NSString stringWithFormat:@"%@",error];
    NSLog(@"步行路径规划失败2----%@",str);
    
}
#pragma mark 显示路径
- (void)showNaviRoutes
{
    if (self.walkManager.naviRoute == nil)
    {
        return;
    }
    
    [_mapView removeOverlays:_mapView.overlays];
    [self.routeIndicatorInfoArray removeAllObjects];
    
    //将路径显示到地图上
    AMapNaviRoute *aRoute = self.walkManager.naviRoute;
    int count = (int)[[aRoute routeCoordinates] count];
    
    //添加路径Polyline
    CLLocationCoordinate2D *coords = (CLLocationCoordinate2D *)malloc(count * sizeof(CLLocationCoordinate2D));
    for (int i = 0; i < count; i++)
    {
        AMapNaviPoint *coordinate = [[aRoute routeCoordinates] objectAtIndex:i];
        coords[i].latitude = [coordinate latitude];
        coords[i].longitude = [coordinate longitude];
    }
    MAPolyline *polyline = [MAPolyline polylineWithCoordinates:coords count:count];
    
    SelectableOverlay *selectablePolyline = [[SelectableOverlay alloc] initWithOverlay:polyline];
    
    [_mapView addOverlay:selectablePolyline];
    free(coords);
//
//    //更新CollectonView的信息
//    RouteCollectionViewInfo *info = [[RouteCollectionViewInfo alloc] init];
//    info.title = [NSString stringWithFormat:@"路径信息:"];
//    info.subtitle = [NSString stringWithFormat:@"长度:%ld米 | 预估时间:%ld秒 | 分段数:%ld", (long)aRoute.routeLength, (long)aRoute.routeTime, (long)aRoute.routeSegments.count];
//    
//    [self.routeIndicatorInfoArray addObject:info];
    
    [_mapView showAnnotations:_mapView.annotations animated:NO];
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
