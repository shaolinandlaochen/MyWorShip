//
//  HomeViewController.m
//  MyWorShip
//
//  Created by 123 on 2017/5/23.
//  Copyright © 2017年 123. All rights reserved.
//

#import "HomeViewController.h"
#import "SelectableOverlay.h"
#import "HomeRequest.h"
#import "APinOperationView.h"
#import <AMapSearchKit/AMapSearchKit.h>
#import "MANaviRoute.h"
#import "CommonUtility.h"
static const NSString *RoutePlanningViewControllerStartTitle       = @"起点";
static const NSString *RoutePlanningViewControllerDestinationTitle = @"终点";
@interface HomeViewController ()<MAMapViewDelegate,SGQRCodeScanningVCDelegate,MyViewControllerDelegate,AMapNaviWalkManagerDelegate,APinOperationDelegate,AMapNaviDriveManagerDelegate,AMapSearchDelegate>
{
    MAMapView *_mapView;
    LocationAnnotationView *_locationAnnotationView;
    MyImage *_BjImage;
    MyButton *_location;
    BOOL state;//地图状态:yes表示正在导航(推荐路线中) no表示常规状态
    MAMapPoint point;
    APinOperationView *_apinView;//操作大头针的视图view
}
/* 起始点经纬度. */
@property (nonatomic) CLLocationCoordinate2D startCoordinate;
/* 终点经纬度. */
@property (nonatomic) CLLocationCoordinate2D destinationCoordinate;
@property (nonatomic, strong) AMapSearchAPI *search;
@property (nonatomic, strong) MAPointAnnotation *startAnnotation;
@property (nonatomic, strong) MAPointAnnotation *destinationAnnotation;
/* 用于显示当前路线方案. */
@property (nonatomic) MANaviRoute * naviRoute;
@property (nonatomic, strong) AMapRoute *route;
/* 当前路线方案索引值. */
@property (nonatomic) NSInteger currentCourse;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   point=MAMapPointForCoordinate(CLLocationCoordinate2DMake(0,0));
    [self addLeftItemAndRightItem];
    [self AddAMap];
    [self AddAllViews];
    [self initWalkManager];
    [self initDriveManager];
    [self CreateBounced];
    self.search = [[AMapSearchAPI alloc] init];
    self.search.delegate = self;
    // Do any additional setup after loading the view.
}
#pragma mark 创建大头针的弹框
-(void)CreateBounced{

    _apinView=[[APinOperationView alloc]init];
    _apinView.delegate=self;
    _apinView.backgroundColor=[UIColor whiteColor];
    _apinView.frame=CGRectMake(0, -100, WIDTH, 95);
    [self.view addSubview:_apinView];
    
    
}
#pragma mark 点击步行,驾车,公交执行该方法
-(void)ClickOnTheLine:(MAAnnotationView *)manontation myBtn:(MyButton*)btn{
     [_mapView removeOverlays:_mapView.overlays];//移除所有推荐线路
    [self clear];//清楚路线缓存
    if (btn.selected) {
        [self initProperties:btn.tag];
       
    }
}
#pragma mark 视图伸缩
-(void)scaling:(BOOL)isScaling{

}
#pragma mark 用户进行步行路线规划
- (void)initProperties:(NSInteger)index
{

    self.routeIndicatorInfoArray = [NSMutableArray array];
    
    CLLocationCoordinate2D oldCoordinate = _mapView.userLocation.coordinate;//获取用户当前位置信息
    self.startPoint = [AMapNaviPoint locationWithLatitude:oldCoordinate.latitude longitude:oldCoordinate.longitude];
    self.startCoordinate=_mapView.userLocation.coordinate;
    NSLog(@"startPoint===%@-----",self.startPoint);
    NSLog(@"endPoint=====%@-----",self.endPoint);
     [self clear];//清楚路线缓存
    if (index==1) {//步行
        [self.walkManager calculateWalkRouteWithStartPoints:@[self.startPoint]
                                                  endPoints:@[self.endPoint]];
    }else if (index==2){//驾车

        [self.driveManager calculateDriveRouteWithStartPoints:@[self.startPoint]
                                                    endPoints:@[self.endPoint]
                                                    wayPoints:nil
                                              drivingStrategy:17];
    }else{//公交
        self.currentCourse=0;
        [self addDefaultAnnotations];
        [self searchRoutePlanningBus];
    }
    
}
#pragma mark 点击大头针执行该方法
- (void)mapView:(MAMapView *)mapView didSelectAnnotationView:(MAAnnotationView *)view
{
    NSLog(@"标题==%@   副标题==%@",view.annotation.title,view.annotation.subtitle);
    CLLocationCoordinate2D coorinate = [view.annotation coordinate];
    self.endPoint=[AMapNaviPoint locationWithLatitude:coorinate.latitude longitude:coorinate.longitude];
    self.destinationCoordinate=CLLocationCoordinate2DMake(coorinate.latitude, coorinate.longitude);
    NSLog(@"点击大头针执行该方法 = {%f, %f}", coorinate.latitude, coorinate.longitude);
    if ([view.annotation.subtitle length]>0) {
        _apinView.maannotations=view;
        NAVHEIGHT
        RECTSTATUS
        
        [UIView animateWithDuration:0.3 animations:^{
            _apinView.frame=CGRectMake(0, navheight+rectStatus.size.height, WIDTH, 95);
            if (_apinView.state) {
                [self initProperties:_apinView.index];
            }
        }];
    }
   
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
           
            [_mapView setCenterCoordinate:_mapView.userLocation.location.coordinate animated:YES];//把屏幕中心点回到当前位置
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
    _mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
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
- (void)initDriveManager
{
    if (self.driveManager == nil)
    {
        self.driveManager = [[AMapNaviDriveManager alloc] init];
        [self.driveManager setDelegate:self];
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
/**
 * @brief 根据overlay生成对应的Renderer
 * @param mapView 地图View
 * @param overlay 指定的overlay
 * @return 生成的覆盖物Renderer
 */
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
    //下面是公交的
    if ([overlay isKindOfClass:[LineDashPolyline class]])
    {
        MAPolylineRenderer *polylineRenderer = [[MAPolylineRenderer alloc] initWithPolyline:((LineDashPolyline *)overlay).polyline];
        polylineRenderer.lineWidth  = 8;
        polylineRenderer.lineDash = YES;
        polylineRenderer.strokeColor = [UIColor redColor];
        
        return polylineRenderer;
    }
    if ([overlay isKindOfClass:[MANaviPolyline class]])
    {
        MANaviPolyline *naviPolyline = (MANaviPolyline *)overlay;
        MAPolylineRenderer *polylineRenderer = [[MAPolylineRenderer alloc] initWithPolyline:naviPolyline.polyline];
        
        polylineRenderer.lineWidth = 8;
        
        if (naviPolyline.type == MANaviAnnotationTypeWalking)
        {
            polylineRenderer.strokeColor = self.naviRoute.walkingColor;
        }
        else if (naviPolyline.type == MANaviAnnotationTypeRailway)
        {
            polylineRenderer.strokeColor = self.naviRoute.railwayColor;
        }
        else
        {
            polylineRenderer.strokeColor = self.naviRoute.routeColor;
        }
        
        return polylineRenderer;
    }
    if ([overlay isKindOfClass:[MAMultiPolyline class]])
    {
        MAMultiColoredPolylineRenderer * polylineRenderer = [[MAMultiColoredPolylineRenderer alloc] initWithMultiPolyline:overlay];
        
        polylineRenderer.lineWidth = 10;
        polylineRenderer.strokeColors = [self.naviRoute.multiPolylineColors copy];
        polylineRenderer.gradient = YES;
        
        return polylineRenderer;
    }
    
    return nil;
}
/**
 * @brief 根据anntation生成对应的View
 * @param mapView 地图View
 * @param annotation 指定的标注
 * @return 生成的标注View
 */
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
    
    //设置大头针和公交图标
    if ([annotation isKindOfClass:[MAPointAnnotation class]])
    {
        if (_apinView.state) {//公交划线
            static NSString *routePlanningCellIdentifier = @"RoutePlanningCellIdentifier";
            
            MAAnnotationView *poiAnnotationView = (MAAnnotationView*)[_mapView dequeueReusableAnnotationViewWithIdentifier:routePlanningCellIdentifier];
            if (poiAnnotationView == nil)
            {
                poiAnnotationView = [[MAAnnotationView alloc] initWithAnnotation:annotation
                                                                 reuseIdentifier:routePlanningCellIdentifier];
            }
            
            poiAnnotationView.canShowCallout = YES;
            poiAnnotationView.image = nil;
            
            if ([annotation isKindOfClass:[MANaviAnnotation class]])
            {
                switch (((MANaviAnnotation*)annotation).type)
                {
                        
                    case MANaviAnnotationTypeRailway:
                        poiAnnotationView.image = [UIImage imageNamed:@"railway_station"];
                        break;
                        
                    case MANaviAnnotationTypeBus:
                        poiAnnotationView.image = [UIImage imageNamed:@"bus"];
                        break;
                        
                    case MANaviAnnotationTypeDrive:
                        poiAnnotationView.image = [UIImage imageNamed:@"car"];
                        break;
                        
                    case MANaviAnnotationTypeWalking:
                        poiAnnotationView.image = [UIImage imageNamed:@"man"];
                        break;
                        
                    default:
                        break;
                }
            }
            
            return poiAnnotationView;
        }else{
            static NSString *pointReuseIndentifier = @"pointReuseIndentifier";
            MAPinAnnotationView*annotationView = (MAPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndentifier];
            if (annotationView == nil)
            {
                annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndentifier];
            }
            annotationView.canShowCallout= NO;       //设置气泡可以弹出，默认为NO
            annotationView.animatesDrop = NO;        //设置标注动画显示，默认为NO
            annotationView.draggable = NO;        //设置标注可以拖动，默认为NO
            annotationView.pinColor = MAPinAnnotationColorPurple;
            annotationView.image=[UIImage imageNamed:@"icon_place"];
            return annotationView;
        }
      
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
 *  mapView.annotations里面有很多标注点包括用户位置和大头针MAPointAnnotation是大头针,MAUserLocation是用户位置
 */
#pragma mark 地图移动结束后获取屏幕中心点,根据区域插入大头针
- (void)mapView:(MAMapView *)mapView regionDidChangeAnimated:(BOOL)animated{
    
   // NSLog(@"%f---屏幕中心----%f",mapView.centerCoordinate.latitude,mapView.centerCoordinate.longitude);
    if (!state) {//非导航状态
        //NSLog(@"mapView_is_annotations===%@",mapView.annotations);
        if (point.x==0) {//如果等于0 就表示刚进来
            point=MAMapPointForCoordinate(CLLocationCoordinate2DMake(mapView.centerCoordinate.latitude,mapView.centerCoordinate.longitude));
        }else{
            //获取当前的位置
            MAMapPoint point2=MAMapPointForCoordinate(CLLocationCoordinate2DMake(mapView.centerCoordinate.latitude,mapView.centerCoordinate.longitude));
            //那当前的位置和上次移动的距离比较
            CLLocationDistance distance = MAMetersBetweenMapPoints(point,point2);
            NSLog(@"距离上次移动距离为%f",distance);
            if (distance>20000) {//超过20公里就重新加载
                point=MAMapPointForCoordinate(CLLocationCoordinate2DMake(mapView.centerCoordinate.latitude,mapView.centerCoordinate.longitude));
                 [_mapView removeOverlays:_mapView.overlays];//移除所有推荐线路
                [self QueryEquipmentNear:mapView];
            }
            
        }

        
    }
    
}

#pragma mark 查询附近设备
- (void)QueryEquipmentNear:(MAMapView *)mapView{
    if (_mapView.userLocation.location!=nil) {
         CLLocationCoordinate2D oldCoordinate = _mapView.userLocation.coordinate;//获取用户当前位置信息
        [SVProgressHUD showWithStatus:@"正在查找附近的设备,请稍后..."];
        [HomeRequest TheDeviceNearTheQuery_equipment_longitude:[NSString stringWithFormat:@"%f",oldCoordinate.longitude] equipment_latitude:[NSString stringWithFormat:@"%f",oldCoordinate.latitude] block:^(NSDictionary *dic) {
            NearTheEquipmentBaseClass *class=[[NearTheEquipmentBaseClass alloc]initWithDictionary:[self deleteEmpty:dic]];
            self.dataLatitudeAndLongitude=[self deleteEmpty:dic];
            if ([stringFormat(class.code) isEqualToString:@"3"]) {
                [mapView removeAnnotations:mapView.annotations];
                [self MrPin:mapView];
            }
        }];
    }

}
#pragma mark 插入大头针
-(void)MrPin:(MAMapView *)mapView{

    NearTheEquipmentBaseClass *class=[[NearTheEquipmentBaseClass alloc]initWithDictionary:self.dataLatitudeAndLongitude];
    for (int i=0; i<class.equipment.count; i++) {
        NearTheEquipmentEquipment *equipment=class.equipment[i];
        //扎大头针
        MAPointAnnotation *APin = [[MAPointAnnotation alloc] init];
        APin.coordinate = CLLocationCoordinate2DMake([stringFormat(equipment.equipmentLatitude) floatValue], [stringFormat(equipment.equipmentLongitude) floatValue]);
        APin.title = stringFormat(equipment.equipmentName);
        APin.subtitle = stringFormat(equipment.equipmentAddress);
        
        [_mapView addAnnotation:APin];
    }

}
#pragma mark 路径规划
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
    [self showNaviRouteswalking];
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

/**
 * @brief 发生错误时,会调用代理的此方法
 * @param driveManager 驾车导航管理类
 * @param error 错误信息
 */
- (void)driveManager:(AMapNaviDriveManager *)driveManager error:(NSError *)error{
     [SVProgressHUD showErrorWithStatus:error.domain];
}

/**
 * @brief 驾车路径规划成功后的回调函数
 * @param driveManager 驾车导航管理类
 */
- (void)driveManagerOnCalculateRouteSuccess:(AMapNaviDriveManager *)driveManager{
//显示路径或开启导航
    [self showNaviRoutesDriving];
    NSLog(@"驾车路径规划成功");
}

/**
 * @brief 驾车路径规划失败后的回调函数
 * @param error 错误信息,error.code参照 AMapNaviCalcRouteState .
 * @param driveManager 驾车导航管理类
 */
- (void)driveManager:(AMapNaviDriveManager *)driveManager onCalculateRouteFailure:(NSError *)error{
     [SVProgressHUD showErrorWithStatus:error.domain];
}

#pragma mark 开始公交搜索
- (void)searchRoutePlanningBus
{
    self.startAnnotation.coordinate = self.startCoordinate;
    self.destinationAnnotation.coordinate = self.destinationCoordinate;
    
    
    AMapTransitRouteSearchRequest *navi = [[AMapTransitRouteSearchRequest alloc] init];
    
    navi.requireExtension = YES;
    navi.city             = @"chengdu";
    navi.strategy=0;
    navi.nightflag=YES;
    
    /* 出发点. */
    navi.origin = [AMapGeoPoint locationWithLatitude:self.startCoordinate.latitude
                                           longitude:self.startCoordinate.longitude];
    NSLog(@"出发点经纬度%f--%f",self.startCoordinate.latitude,self.startCoordinate.longitude);
    /* 目的地. */
    navi.destination = [AMapGeoPoint locationWithLatitude:self.destinationCoordinate.latitude
                                                longitude:self.destinationCoordinate.longitude];
    NSLog(@"目的地经纬度%f--%f",self.destinationCoordinate.latitude,self.destinationCoordinate.longitude);
    
    [self.search AMapTransitRouteSearch:navi];
    
}
#pragma mark /* 路径规划搜索回调. */
- (void)onRouteSearchDone:(AMapRouteSearchBaseRequest *)request response:(AMapRouteSearchResponse *)response{
    NSLog(@"路径规划搜索回调...");
    self.route = response.route;
    if (response.count > 0)
    {
        [self presentCurrentCourse];
    }else{
        [SVProgressHUD showInfoWithStatus:@"抱歉,未找到公交结果"];
    }
}
#pragma mark /* 清空地图上已有的路线. */
- (void)clear
{
    [self.naviRoute removeFromMapView];
}
#pragma mark /* 展示当前路线方案. */
- (void)presentCurrentCourse
{
    
    self.naviRoute = [MANaviRoute naviRouteForTransit:self.route.transits[0] startPoint:[AMapGeoPoint locationWithLatitude:self.startAnnotation.coordinate.latitude longitude:self.startAnnotation.coordinate.longitude] endPoint:[AMapGeoPoint locationWithLatitude:self.destinationAnnotation.coordinate.latitude longitude:self.destinationAnnotation.coordinate.longitude]];
    [self.naviRoute addToMapView:_mapView];
    
    /* 缩放地图使其适应polylines的展示. */
    [_mapView setVisibleMapRect:[CommonUtility mapRectForOverlays:self.naviRoute.routePolylines]edgePadding:UIEdgeInsetsMake(20, 20, 20, 20)animated:YES];
}
- (void)addDefaultAnnotations
{
    MAPointAnnotation *startAnnotation = [[MAPointAnnotation alloc] init];
    startAnnotation.coordinate = self.startCoordinate;
    startAnnotation.title      = (NSString*)RoutePlanningViewControllerStartTitle;
    startAnnotation.subtitle   = [NSString stringWithFormat:@"{%f, %f}", self.startCoordinate.latitude, self.startCoordinate.longitude];
    self.startAnnotation = startAnnotation;
    
    MAPointAnnotation *destinationAnnotation = [[MAPointAnnotation alloc] init];
    destinationAnnotation.coordinate = self.destinationCoordinate;
    destinationAnnotation.title      = (NSString*)RoutePlanningViewControllerDestinationTitle;
    destinationAnnotation.subtitle   = [NSString stringWithFormat:@"{%f, %f}", self.destinationCoordinate.latitude, self.destinationCoordinate.longitude];
    self.destinationAnnotation = destinationAnnotation;
    
    [_mapView addAnnotation:startAnnotation];
    [_mapView addAnnotation:destinationAnnotation];
}
#pragma mark 显示路径(步行)
- (void)showNaviRouteswalking
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

    
    //[_mapView showAnnotations:_mapView.annotations animated:NO];
}
#pragma mark 显示路径 (驾车)
- (void)showNaviRoutesDriving
{
    if ([self.driveManager.naviRoutes count] <= 0)
    {
        return;
    }
    
    [_mapView removeOverlays:_mapView.overlays];
    [self.routeIndicatorInfoArray removeAllObjects];
    
    //将路径显示到地图上
    for (NSNumber *aRouteID in [self.driveManager.naviRoutes allKeys])
    {
        AMapNaviRoute *aRoute = [[self.driveManager naviRoutes] objectForKey:aRouteID];
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
        [selectablePolyline setRouteID:[aRouteID integerValue]];
        
        [_mapView addOverlay:selectablePolyline];
        free(coords);
        
    }
    
   // [_mapView showAnnotations:_mapView.annotations animated:NO];
    
    [self selectNaviRouteWithID:[[self.routeIndicatorInfoArray firstObject] routeID]];
}
- (void)selectNaviRouteWithID:(NSInteger)routeID
{
    //在开始导航前进行路径选择
    if ([self.driveManager selectNaviRouteWithRouteID:routeID])
    {
        [self selecteOverlayWithRouteID:routeID];
    }
    else
    {
        NSLog(@"路径选择失败!");
    }
}

- (void)selecteOverlayWithRouteID:(NSInteger)routeID
{
    [_mapView.overlays enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id<MAOverlay> overlay, NSUInteger idx, BOOL *stop)
     {
         if ([overlay isKindOfClass:[SelectableOverlay class]])
         {
             SelectableOverlay *selectableOverlay = overlay;
             
             /* 获取overlay对应的renderer. */
             MAPolylineRenderer * overlayRenderer = (MAPolylineRenderer *)[_mapView rendererForOverlay:selectableOverlay];
             
             if (selectableOverlay.routeID == routeID)
             {
                 /* 设置选中状态. */
                 selectableOverlay.selected = YES;
                 
                 /* 修改renderer选中颜色. */
                 overlayRenderer.fillColor   = selectableOverlay.selectedColor;
                 overlayRenderer.strokeColor = selectableOverlay.selectedColor;
                 
                 /* 修改overlay覆盖的顺序. */
                 [_mapView exchangeOverlayAtIndex:idx withOverlayAtIndex:_mapView.overlays.count - 1];
             }
             else
             {
                 /* 设置选中状态. */
                 selectableOverlay.selected = NO;
                 
                 /* 修改renderer选中颜色. */
                 overlayRenderer.fillColor   = selectableOverlay.regularColor;
                 overlayRenderer.strokeColor = selectableOverlay.regularColor;
             }
             
             [overlayRenderer glRender];
         }
     }];
}
/**
 * @brief 单击地图回调，返回经纬度
 * @param mapView 地图View
 * @param coordinate 经纬度
 */
- (void)mapView:(MAMapView *)mapView didSingleTappedAtCoordinate:(CLLocationCoordinate2D)coordinate{

   [UIView animateWithDuration:0.3 animations:^{
       _apinView.nulls=@"a";
       [_mapView removeOverlays:_mapView.overlays];//移除所有推荐线路
       _apinView.frame=CGRectMake(0, -100, WIDTH, 95);
   }];
    
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
