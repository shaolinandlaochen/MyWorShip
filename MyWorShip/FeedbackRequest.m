//
//  FeedbackRequest.m
//  MyWorShip
//
//  Created by 123 on 2017/6/9.
//  Copyright © 2017年 123. All rights reserved.
//

#import "FeedbackRequest.h"

@implementation FeedbackRequest
/*
 *意见反馈提交
 */
+(void)FeedbackToSubmit:(NSString *)feedback_content feedback_type:(NSString *)feedback_type equipment_uuid:(NSString *)equipment_uuid feedback_image:(NSString *)feedback_image block:(void(^)(NSDictionary *dic))block{
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
    [dic setObject:feedback_content forKey:@"feedback_content"];
    [dic setObject:feedback_type forKey:@"feedback_type"];
    [dic setObject:equipment_uuid forKey:@"equipment_uuid"];
    [dic setObject:feedback_image forKey:@"feedback_image"];
    NSDictionary *dataDic=[MyClass ReceiveTheOriginalData:dic];//去添加时间戳等数据然后返回签名后的数据
    [RequestClass getUrl:@"feedback" Dic:dataDic block:^(NSDictionary *dic) {
        NSLog(@"意见反馈提交:%@",dic);
        block(dic);
        
    }];
}
/*
 *上传图片
 */
+(void)ToUploadPictures_feedback_image:(NSData *)feedback_image block:(void(^)(NSDictionary *dic))block{
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];
    securityPolicy.allowInvalidCertificates = YES;
    securityPolicy.validatesDomainName = NO;
    manager.securityPolicy = securityPolicy;
    manager.responseSerializer =[AFHTTPResponseSerializer serializer];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // 设置时间格式
    formatter.dateFormat = @"yyyyMMddHHmmss";
    NSString *str = [formatter stringFromDate:[NSDate date]];
    NSString *fileName = [NSString stringWithFormat:@"%@.png", str];
    NSMutableDictionary *diccc=[[NSMutableDictionary alloc]init];
    [manager POST:[NSString stringWithFormat:@"%@feedbackimagesupload",RequestUrl] parameters:diccc constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:feedback_image name:@"file" fileName:[NSString stringWithFormat:@"%@.jpg",fileName] mimeType:@"image/jpeg"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        NSLog(@"图片上传进度%f",uploadProgress.fractionCompleted);
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dicdic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"--////图片上传---%@",dicdic);
        block(dicdic);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"------图片上传%@",error);
    }];
}
@end
