//
//  TeasingViewController.m
//  MyWorShip
//
//  Created by 123 on 2017/5/25.
//  Copyright © 2017年 123. All rights reserved.
//

#import "TeasingViewController.h"
#import "FeedbackRequest.h"
@interface TeasingViewController ()<UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    NSArray *_typeArray;//放置名字的数组
    UIView *_typeView;//放置故障类型btn的view
    UIView *_imgView;//上传的图片的view
    UIScrollView *_scrollView;
    NSMutableArray *_imgArray;//用户选择的图片
    UIView *_positionAndNoteView;//卫生间位置和备注
    UITextField *_position;//位置
    UITextField *_note;//备注
}
@end

@implementation TeasingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"吐槽";
    self.imgPath=[[NSMutableArray alloc]init];
    self.view.backgroundColor=[self colorWithHexString:@"f3f5f7"];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:[self colorWithHexString:@"ffffff"]}];
    [self.navigationController.navigationBar setBarTintColor:[[UIColor blackColor]colorWithAlphaComponent:0.9]];
    MyButton *leftCancelItem=[MyButton buttonWithType:UIButtonTypeCustom];
    [leftCancelItem setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateNormal];
    [leftCancelItem addTarget:self  action:@selector(onCancelClick) forControlEvents:UIControlEventTouchUpInside];
    [leftCancelItem sizeToFit];
    UIBarButtonItem *informationCardItem = [[UIBarButtonItem alloc] initWithCustomView:leftCancelItem];
    self.navigationItem.leftBarButtonItems  = @[informationCardItem];
    _scrollView=[[UIScrollView alloc]init];
    _scrollView.backgroundColor=[self colorWithHexString:@"f3f5f7"];
    _scrollView.frame=self.view.bounds;
    [self.view addSubview:_scrollView];
    _scrollView.contentSize=CGSizeMake(0, 600);
    [self CreateAView];
    // Do any additional setup after loading the view.
}
#pragma mark 创建视图
-(void)CreateAView{
    _imgArray=[[NSMutableArray alloc]init];
    _typeArray=@[@"卫生间堵了",@"不可以冲水",@"门坏了",@"没有纸",@"没有卫生巾",@"二维码失效",@"其他"];
    UILabel *typeName1=[[UILabel alloc]init];
    typeName1.text=@"请选择故障类型";
    typeName1.textColor=[self colorWithHexString:@"000000"];
    typeName1.font=[UIFont systemFontOfSize:12];
    [_scrollView addSubview:typeName1];
    typeName1.sd_layout.leftSpaceToView(_scrollView, 25).topSpaceToView(_scrollView, 0).rightSpaceToView(_scrollView, 0).heightIs(40);
    
    _typeView=[[UIView alloc]init];
    _typeView.backgroundColor=[UIColor whiteColor];
    [_scrollView addSubview:_typeView];
    _typeView.sd_layout.leftSpaceToView(_scrollView, 0).rightSpaceToView(_scrollView, 0).topSpaceToView(typeName1, 0).heightIs(220);
    for (int i=0; i<_typeArray.count; i++) {
        MyButton *btn=[MyButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:_typeArray[i] forState:UIControlStateNormal];
        btn.tag=i+1;
        [btn addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitleColor:[self colorWithHexString:@"000000"] forState:UIControlStateNormal];
        [btn setTitleColor:[self colorWithHexString:@"ffffff"] forState:UIControlStateSelected];
        btn.backgroundColor=[UIColor whiteColor];
        btn.titleLabel.font=[UIFont systemFontOfSize:15];
        [btn.layer setBorderColor:[self colorWithHexString:@"#d7d7d7"].CGColor];
        [btn.layer setBorderWidth:1];
        [btn.layer setMasksToBounds:YES];
        btn.layer.cornerRadius = 3;
        btn.layer.masksToBounds = 3;
        float xyu=(self.view.frame.size.width-300-20)/2;
        float x=xyu+(150+20)*(i%2);
        float y=15+(35+16)*(i/2);
        btn.frame=CGRectMake(x, y, 150, 35);
        [_typeView addSubview:btn];
    }
    
    UILabel *typeName2=[[UILabel alloc]init];
    typeName2.text=@"拍摄卫生间周边环境,便于维修师傅找到卫生间";
    typeName2.textColor=[self colorWithHexString:@"000000"];
    typeName2.font=[UIFont systemFontOfSize:12];
    [_scrollView addSubview:typeName2];
    typeName2.sd_layout.leftSpaceToView(_scrollView, 25).topSpaceToView(_typeView, 0).rightSpaceToView(_scrollView, 0).heightIs(40);
    
    _imgView=[[UIView alloc]init];
    _imgView.backgroundColor=[UIColor whiteColor];
    [_scrollView addSubview:_imgView];
    _imgView.sd_layout.leftEqualToView(_typeView).topSpaceToView(typeName2, 0).rightEqualToView(_typeView).heightIs(100);
    
    //添加图片
    MyButton *imgAddBtn=[MyButton buttonWithType:UIButtonTypeCustom];
    [imgAddBtn setBackgroundImage:[UIImage imageNamed:@"btn_add"] forState:UIControlStateNormal];
    [imgAddBtn addTarget:self action:@selector(onAddImageBtnClick) forControlEvents:UIControlEventTouchUpInside];
    imgAddBtn.tag=157388;
    [_imgView addSubview:imgAddBtn];
    imgAddBtn.sd_layout.leftSpaceToView(_imgView, 26).topSpaceToView(_imgView, 14.5).bottomSpaceToView(_imgView, 14.5).widthIs(73);
    
    _positionAndNoteView=[[UIView alloc]init];
    _positionAndNoteView.backgroundColor=[UIColor whiteColor];
    [_scrollView addSubview:_positionAndNoteView];
    _positionAndNoteView.sd_layout.leftSpaceToView(_scrollView, 0).rightSpaceToView(_scrollView, 0).topSpaceToView(_imgView, 12).heightIs(105);
    
    _position=[[UITextField alloc]init];
    _position.placeholder=@"卫生间位置";
    _position.textColor=[self colorWithHexString:@"000000"];
    _position.font=[UIFont systemFontOfSize:12];
    [_positionAndNoteView addSubview:_position];
    _position.sd_layout.leftSpaceToView(_positionAndNoteView, 28).topSpaceToView(_positionAndNoteView, 0).rightSpaceToView(_positionAndNoteView, 0).heightIs(50);
    
    UILabel *line=[[UILabel alloc]init];
    line.backgroundColor=[self colorWithHexString:@"#d7d7d7"];
    [_positionAndNoteView addSubview:line];
    line.sd_layout.leftSpaceToView(_positionAndNoteView, 25.5).topSpaceToView(_position, 0.5).rightSpaceToView(_positionAndNoteView, 25).heightIs(0.5);
    
    _note=[[UITextField alloc]init];
    _note.placeholder=@"备注";
    _note.textColor=[self colorWithHexString:@"000000"];
    _note.font=[UIFont systemFontOfSize:12];
    [_positionAndNoteView addSubview:_note];
    _note.sd_layout.leftSpaceToView(_positionAndNoteView, 28).topSpaceToView(_position, 2).rightSpaceToView(_positionAndNoteView, 0).heightIs(50);
    
    UIButton *GOBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    GOBtn.backgroundColor=[self colorWithHexString:@"ff4c59"];
    GOBtn.layer.cornerRadius = 3;
    GOBtn.layer.masksToBounds = 3;
    [GOBtn addTarget:self action:@selector(onGoBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [GOBtn setTitle:@"提交" forState:UIControlStateNormal];
    [GOBtn setTitleColor:[self colorWithHexString:@"ffffff"] forState:UIControlStateNormal];
    [_scrollView addSubview:GOBtn];
    GOBtn.sd_layout.leftSpaceToView(_scrollView, 18.5).topSpaceToView(_positionAndNoteView, 18.5).rightSpaceToView(_scrollView, 18.5).heightIs(50);
    
}
#pragma mark 点击故障类型执行以下方法
-(void)onButtonClick:(MyButton *)btn{
    if (btn.selected) {
        btn.backgroundColor=[UIColor whiteColor];
    }else{
        btn.backgroundColor=[self colorWithHexString:@"ff4c59"];
    }
    btn.selected=!btn.selected;
}
#pragma mark 点击添加图片执行该方法
-(void)onAddImageBtnClick{
    UIAlertController *aler=[UIAlertController alertControllerWithTitle:@"温馨提示" message:@"请选择方式" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *TakingPictures=[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
        if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
        {
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.delegate = self;
            //设置拍照后的图片可被编辑
            picker.allowsEditing = YES;
            picker.sourceType = sourceType;
            [self presentViewController:picker animated:YES completion:nil];
            
        }else
        {
            NSLog(@"模拟其中无法打开照相机,请在真机中使用");
        }
        
    }];
    //添加
    [aler addAction:TakingPictures];
    UIAlertAction *PhotoAlbum=[UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self ChooseTheLocalPhoto];
    }];
    //添加
    [aler addAction:PhotoAlbum];
    UIAlertAction *cacle=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }];
    //添加
    [aler addAction:cacle];
    //最后一步
    [self presentViewController:aler animated:YES completion:nil];
    

}
//打开本地照片
-(void)ChooseTheLocalPhoto{
    UIImagePickerController *contro =[[UIImagePickerController alloc]init];
    contro.sourceType =UIImagePickerControllerSourceTypePhotoLibrary;
    contro.delegate =self;
    contro.allowsEditing = YES;
    
    [self presentViewController:contro animated:YES completion:nil];
    
}

//当选择一张图片后进入这里(系统的只能一张一张的选择图片)
-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    //当选择的类型是图片
    if ([type isEqualToString:@"public.image"])
    {
        //先把图片转成NSData
        UIImage* image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        //关闭相册界面
        [picker.presentingViewController dismissViewControllerAnimated:YES completion:nil];
        [_imgArray addObject:image];
        [self layoutOfTheUserSelectedImages];
        [self ToUploadPictures:image];

        
    }
}
#pragma mark 布局用户所选择的图片
-(void)layoutOfTheUserSelectedImages{
    for (int i=0; i<_imgArray.count; i++) {
        float x=26+(73+10.5)*(i%3);
        MyButton *btn=[MyButton buttonWithType:UIButtonTypeCustom];
        btn.tag=i+1;
        btn.frame=CGRectMake(x, 14.5, 73, 73);
        [btn setBackgroundImage:_imgArray[i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(onRemovImageClick:) forControlEvents:UIControlEventTouchUpInside];
        [_imgView addSubview:btn];
    }
    if (_imgArray.count<1) {
       ((MyButton *)[_imgView viewWithTag:157388]).sd_layout.leftSpaceToView(_imgView, 26).topSpaceToView(_imgView, 14.5).bottomSpaceToView(_imgView, 14.5).widthIs(73);
    }else if (_imgArray.count==1){
     ((MyButton *)[_imgView viewWithTag:157388]).sd_layout.leftSpaceToView(_imgView, 109).topSpaceToView(_imgView, 14.5).bottomSpaceToView(_imgView, 14.5).widthIs(73);
    }else if (_imgArray.count==2){
         ((MyButton *)[_imgView viewWithTag:157388]).sd_layout.leftSpaceToView(_imgView, 192).topSpaceToView(_imgView, 14.5).bottomSpaceToView(_imgView, 14.5).widthIs(73);
    }else if (_imgArray.count==3){
        ((MyButton *)[_imgView viewWithTag:157388]).sd_layout.leftSpaceToView(_imgView, 1192).topSpaceToView(_imgView, 14.5).bottomSpaceToView(_imgView, 14.5).widthIs(73);
    }
    
   
}
#pragma mark 删除图片
-(void)onRemovImageClick:(MyButton *)btn{
    UIAlertController *aler=[UIAlertController alertControllerWithTitle:@"温馨提示" message:@"是否删除" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *TakingPictures=[UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

        [_imgArray removeObjectAtIndex:btn.tag-1];
        for(MyButton *button in [_imgView subviews])
        {
            if (button.tag!=157388) {
                [button removeFromSuperview];
            }
        }
        [self layoutOfTheUserSelectedImages];
    }];
    //添加
    [aler addAction:TakingPictures];

    UIAlertAction *cacle=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }];
    //添加
    [aler addAction:cacle];
    //最后一步
    [self presentViewController:aler animated:YES completion:nil];

}
/*
 -(void)image:(UIImage *)img{
 [SVProgressHUD showWithStatus:@"正在上传图片"];
 NSData *data = UIImageJPEGRepresentation(img, 0.3);
 }
 */
#pragma mark 输入框结束编辑
- (void)textFieldDidEndEditing:(UITextField *)textField{

}
#pragma mark 提交
-(void)onGoBtnClick{
    NSString *IDStr=@"";
    for (int i=0; i<_typeArray.count; i++) {
        
        if (((MyButton *)[self.view viewWithTag:i+1]).selected) {
            if ([IDStr isEqualToString:@""]) {
                IDStr=[NSString stringWithFormat:@"%d",i];
            }else{
            IDStr=[NSString stringWithFormat:@"%d,%@",i,IDStr];
            }
        }
        
    }
    NSString *imgPathString=@"";
    for (int i=0; i<self.imgPath.count; i++) {
        if ([imgPathString length]<1) {
            imgPathString=[NSString stringWithFormat:@"%@",self.imgPath[i]];
        }else{
        imgPathString=[NSString stringWithFormat:@"%@,%@",self.imgPath[i],imgPathString];
        }
    }
    [SVProgressHUD showWithStatus:loading];
    [FeedbackRequest FeedbackToSubmit:_note.text feedback_type:IDStr equipment_uuid:@"123" feedback_image:imgPathString block:^(NSDictionary *dic) {
        LoginsIsBaseClass *class=[[LoginsIsBaseClass alloc]initWithDictionary:[self deleteEmpty:dic]];
        if ([stringFormat(class.code) isEqualToString:@"8"]) {
            [self.navigationController popViewControllerAnimated:YES];
            [SVProgressHUD showSuccessWithStatus:class.msg];
        }else{
            [SVProgressHUD showErrorWithStatus:class.msg];
        }
        
    }];

}
#pragma mark 返回
-(void)onCancelClick{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark 上传图片
-(void)ToUploadPictures:(UIImage *)img{
    [SVProgressHUD showWithStatus:@"正在加载图片"];
    NSData *data = UIImageJPEGRepresentation(img, 0.3);
    [FeedbackRequest ToUploadPictures_feedback_image:data block:^(NSDictionary *dic) {
        self.dic=[self deleteEmpty:dic];
        if ([self.dic objectForKey:@"feedback_image"]!=nil&&![[self.dic objectForKey:@"feedback_image"] isEqual:[NSNull null]]) {
            [self.imgPath addObject:[NSString stringWithFormat:@"%@",[self.dic objectForKey:@"feedback_image"]]];
        }
        
        [SVProgressHUD dismiss];
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
