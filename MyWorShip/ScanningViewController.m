//
//  ScanningViewController.m
//  MyWorShip
//
//  Created by 123 on 2017/5/24.
//  Copyright © 2017年 123. All rights reserved.
//

#import "ScanningViewController.h"

@interface ScanningViewController ()<ZXCaptureDelegate>

@end

@implementation ScanningViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[self colorWithHexString:@"f3f5f7"];
    self.centerView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    //[self.centerView setImage:[UIImage imageNamed:@"shape_fold"]];
    self.centerView.backgroundColor=[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.2];
    self.centerView.center=self.view.center;
    [self.view addSubview:self.centerView];
    
    self.capture = [[ZXCapture alloc] init];
    self.capture.camera = self.capture.back;
    self.capture.focusMode = AVCaptureFocusModeContinuousAutoFocus;
    self.capture.rotation = 90.0f;
    self.capture.layer.frame = self.view.bounds;
    [self.view.layer addSublayer:self.capture.layer];
    
    [self.view bringSubviewToFront:self.centerView];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=YES;
    self.capture.delegate = self;
    self.capture.layer.frame = self.view.bounds;
    
    CGAffineTransform captureSizeTransform = CGAffineTransformMakeScale(320 / self.view.frame.size.width, 480 / self.view.frame.size.height);
    self.capture.scanRect = CGRectApplyAffineTransform(self.centerView.frame, captureSizeTransform);
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

[self dismissViewControllerAnimated:YES completion:^{
    //震动提示
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return toInterfaceOrientation == UIInterfaceOrientationPortrait;
}

- (NSString *)barcodeFormatToString:(ZXBarcodeFormat)format {
    switch (format) {
        case kBarcodeFormatAztec:
            return @"Aztec";
        case kBarcodeFormatCodabar:
            return @"CODABAR";
        case kBarcodeFormatCode39:
            return @"Code 39";
        case kBarcodeFormatCode93:
            return @"Code 93";
        case kBarcodeFormatCode128:
            return @"Code 128";
        case kBarcodeFormatDataMatrix:
            return @"Data Matrix";
        case kBarcodeFormatEan8:
            return @"EAN-8";
        case kBarcodeFormatEan13:
            return @"EAN-13";
        case kBarcodeFormatITF:
            return @"ITF";
        case kBarcodeFormatPDF417:
            return @"PDF417";
        case kBarcodeFormatQRCode:
            return @"QR Code";
        case kBarcodeFormatRSS14:
            return @"RSS 14";
        case kBarcodeFormatRSSExpanded:
            return @"RSS Expanded";
        case kBarcodeFormatUPCA:
            return @"UPCA";
        case kBarcodeFormatUPCE:
            return @"UPCE";
        case kBarcodeFormatUPCEANExtension:
            return @"UPC/EAN extension";
        default:
            return @"Unknown";
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)captureResult:(ZXCapture *)capture result:(ZXResult *)result {
    if (!result){
        return;
    }
    
    NSString *formatString = [self barcodeFormatToString:result.barcodeFormat];
    NSLog(@"%@",[NSString stringWithFormat:@"条码格式:%@ \n内容:%@", formatString, result.text]);
    [self.capture stop];
    //震动提示
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
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
