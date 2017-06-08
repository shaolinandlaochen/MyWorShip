//
//  PersonalDataView.m
//  MyWorShip
//
//  Created by 123 on 2017/5/24.
//  Copyright © 2017年 123. All rights reserved.
//

#import "PersonalDataView.h"

@implementation PersonalDataView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        
        _iconHead=[[MyButton alloc]init];
        [self addSubview:_iconHead];
        _iconHead.sd_layout.leftSpaceToView(self, 30).topSpaceToView(self, 30).heightIs(63).widthIs(63);
        
        _name=[[UILabel alloc]init];
        _name.font=[UIFont systemFontOfSize:17];
        _name.textColor=[MyClass colorWithHexString:@"000000"];
        [self addSubview:_name];
        _name.sd_layout.leftSpaceToView(_iconHead, 20).topSpaceToView(self, 45);
        
        _vipImage=[[UIImageView alloc]init];
        [self addSubview:_vipImage];
        _vipImage.sd_layout.leftSpaceToView(_name, 2).topSpaceToView(self, 47).widthIs(15.5).heightIs(15.5);
        
        _money=[[UILabel alloc]init];
        _money.textColor=[MyClass colorWithHexString:@"a3a3a3"];
        _money.font=[UIFont systemFontOfSize:12];
        [self addSubview:_money];
        _money.sd_layout.leftEqualToView(_name).topSpaceToView(_name, 8).widthIs(100).autoHeightRatio(0);
        
        UIView *line=[[UIView alloc]init];
        line.backgroundColor=[MyClass colorWithHexString:@"d7d7d7"];
        [self addSubview:line];
        line.sd_layout.leftSpaceToView(self, 0).rightSpaceToView(self, 0).bottomSpaceToView(self, 0).heightIs(0.5);
    }
    return self;
}
-(void)setTitle:(NSString *)title{
    CGSize size=[MyClass StringHeight:title Lblfont:17 heightOfTheMinus:0];
    _name.text=title;
    _name.sd_layout.widthIs(size.width).autoHeightRatio(0);
    
}
@end
