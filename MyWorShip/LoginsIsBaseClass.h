//
//  LoginsIsBaseClass.h
//
//  Created by   on 2017/6/6
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface LoginsIsBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *token;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) NSString *code;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
