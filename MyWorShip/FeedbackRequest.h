//
//  FeedbackRequest.h
//  MyWorShip
//
//  Created by 123 on 2017/6/9.
//  Copyright © 2017年 123. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeedbackRequest : NSObject
/*
 *意见反馈提交
 */
+(void)FeedbackToSubmit:(NSString *)feedback_content feedback_type:(NSInteger)feedback_type equipment_uuid:(NSString *)equipment_uuid feedback_image:(NSString *)feedback_image block:(void(^)(NSDictionary *dic))block;
/*
 *上传图片
 */
+(void)ToUploadPictures_feedback_image:(NSData *)feedback_image block:(void(^)(NSDictionary *dic))block;
@end
