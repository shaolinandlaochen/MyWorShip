//
//  GoodsDetilListComment.h
//
//  Created by   on 2017/6/9
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface GoodsDetilListComment : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *baseNickname;
@property (nonatomic, assign) double commoditySerial;
@property (nonatomic, assign) double listCommentIdentifier;
@property (nonatomic, assign) double orderSerial;
@property (nonatomic, strong) NSString *commentReply;
@property (nonatomic, strong) NSString *commentContent;
@property (nonatomic, assign) double commentGrade;
@property (nonatomic, strong) NSString *commentTime;
@property (nonatomic, strong) NSString *commentReplyTime;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
