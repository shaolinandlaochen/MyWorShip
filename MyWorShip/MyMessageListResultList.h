//
//  MyMessageListResultList.h
//
//  Created by   on 2017/6/6
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MyMessageListResultList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double readState;
@property (nonatomic, assign) double messageTarget;
@property (nonatomic, assign) double delState;
@property (nonatomic, assign) double resultListIdentifier;
@property (nonatomic, assign) double messageCategory;
@property (nonatomic, strong) NSString *messageText;
@property (nonatomic, assign) id messageTime;
@property (nonatomic, strong) NSString *messageTitle;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
