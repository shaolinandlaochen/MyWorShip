//
//  MessageListHeaderView.m
//  MyWorShip
//
//  Created by 123 on 2017/5/25.
//  Copyright © 2017年 123. All rights reserved.
//

#import "MessageListHeaderView.h"

@implementation MessageListHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        self.backgroundColor=[MyClass colorWithHexString:@"f3f5f7"];
        _time=[[UILabel alloc]init];
        _time.textAlignment=NSTextAlignmentCenter;
        _time.backgroundColor=[MyClass colorWithHexString:@"eaeaea"];
        _time.layer.cornerRadius = 9;
        _time.layer.masksToBounds = 9;
        _time.textColor=[MyClass colorWithHexString:@"a3a3a3"];
        _time.font=[UIFont systemFontOfSize:12];
        [self addSubview:_time];
    }
    return self;
}
-(void)setTimeString:(NSString *)timeString{
    _time.text=timeString;
    CGSize size=[MyClass StringHeight:timeString Lblfont:12 heightOfTheMinus:0];
    _time.sd_layout.leftSpaceToView(self, (WIDTH-size.width-10)/2).topSpaceToView(self, 10).rightSpaceToView(self, (WIDTH-size.width-10)/2).bottomSpaceToView(self, 9.5);
}
@end
