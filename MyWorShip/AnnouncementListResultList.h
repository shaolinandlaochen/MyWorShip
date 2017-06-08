//
//  AnnouncementListResultList.h
//
//  Created by   on 2017/6/8
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface AnnouncementListResultList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *noticeTime;
@property (nonatomic, assign) double resultListIdentifier;
@property (nonatomic, assign) double noticeIstop;
@property (nonatomic, strong) NSString *noticeTitle;
@property (nonatomic, strong) NSString *noticeContent;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
