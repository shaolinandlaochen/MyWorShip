//
//  MonthsThanksGoodsPagingList.h
//
//  Created by   on 2017/6/14
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MonthsThanksGoodsPagingList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double currPage;
@property (nonatomic, assign) double totalRecode;
@property (nonatomic, assign) double pageSize;
@property (nonatomic, assign) double totalPage;
@property (nonatomic, strong) NSArray *resultList;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
