//
//  VIPView.m
//  MyWorShip
//
//  Created by 123 on 2017/6/9.
//  Copyright © 2017年 123. All rights reserved.
//

#import "VIPView.h"

@implementation VIPView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    
    if ([super initWithFrame:frame]) {
        
        _name=[[UILabel alloc]init];
        _name.textColor=[MyClass colorWithHexString:@"000000"];
        _name.font=[UIFont systemFontOfSize:16];
        [self addSubview:_name];
        _name.sd_layout.leftSpaceToView(self, 18).topSpaceToView(self, 0).bottomSpaceToView(self, 0).widthIs(200);
        
        
        _button=[MyButton buttonWithType:UIButtonTypeCustom];
        [_button setTitleColor:[MyClass colorWithHexString:@"175ccf"] forState:UIControlStateNormal];
        _button.titleLabel.font=[UIFont systemFontOfSize:12];
        [self addSubview:_button];
        _button.sd_layout.rightSpaceToView(self, 17.5).widthIs(50).topSpaceToView(self, 0).bottomSpaceToView(self, 0);
        
        UIView *line=[[UIView alloc]init];
        line.backgroundColor=[MyClass colorWithHexString:@"d7d7d7"];
        [self addSubview:line];
        line.sd_layout.leftSpaceToView(self, 0).bottomSpaceToView(self, 0).rightSpaceToView(self, 0).heightIs(0.5);
        
    }
    return self;
}
@end
