//
//  APinOperationView.m
//  MyWorShip
//
//  Created by 123 on 2017/6/15.
//  Copyright © 2017年 123. All rights reserved.
//

#import "APinOperationView.h"

@implementation APinOperationView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {

        
        UIView *viewOne=[[UIView alloc]init];
        viewOne.backgroundColor=[MyClass colorWithHexString:@"f3f5f7"];
        [self addSubview:viewOne];
        viewOne.sd_layout.leftSpaceToView(self, 0).topSpaceToView(self, 0).rightSpaceToView(self, 0).heightIs(50);
        
        UIImageView *bjimg=[[UIImageView alloc]init];
        bjimg.image=[UIImage imageNamed:@"kk_index"];
        [self addSubview:bjimg];
        bjimg.sd_layout.leftSpaceToView(self, 0).topSpaceToView(viewOne, 0).rightSpaceToView(self, 0).bottomSpaceToView(self, -1);
        
        UIImageView *img=[[UIImageView alloc]init];
        img.image=[UIImage imageNamed:@"icon_dizhi"];
        [self addSubview:img];
        img.sd_layout.leftSpaceToView(self, 17).topSpaceToView(self, 17).widthIs(11.5).heightIs(14);
        
        _address=[[UILabel alloc]init];
        _address.textColor=[MyClass colorWithHexString:@"5d6169"];;
        _address.font=[UIFont systemFontOfSize:14];
        [self addSubview:_address];
        _address.sd_layout.leftSpaceToView(img, 11).topSpaceToView(self, 17).rightSpaceToView(self, 22);
        
        NSArray *array=@[@"步行",@"驾车",@"公交"];
        for (int i=0; i<3; i++) {
            float d=(WIDTH-258)/2;
            float x=d+(86+0)*(i%3);
            MyButton *btn=[MyButton buttonWithType:UIButtonTypeCustom];
            btn.tag=i+1;
            [btn setTitle:array[i] forState:UIControlStateNormal];
            [btn setTitleColor:[MyClass colorWithHexString:@"5d6169"] forState:UIControlStateNormal];
            [btn setTitleColor:[MyClass colorWithHexString:@"ff4e54"] forState:UIControlStateSelected];
            btn.titleLabel.font=[UIFont systemFontOfSize:15];
            [btn addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
            btn.sd_layout.leftSpaceToView(self, x).topSpaceToView(viewOne, 15).widthIs(86).heightIs(16);
            
            
            UIView *line=[[UIView alloc]init];
            line.tag=i+10;
            line.backgroundColor=[UIColor clearColor];
            [self addSubview:line];
            float f=d+28;
            float g=f+(30+56)*(i%3);
            line.sd_layout.leftSpaceToView(self, g).bottomSpaceToView(self, 1).widthIs(30).heightIs(2);
        }
        
        
    }
    return self;
}
//点击步行,驾车,公交执行该方法
-(void)onButtonClick:(MyButton *)btn{
    self.index=btn.tag;
    if (btn.selected==NO) {
        for (int i=0; i<3; i++) {
            ((MyButton *)[self viewWithTag:i+1]).selected=NO;
            ((UIView *)[self viewWithTag:i+10]).backgroundColor=[UIColor clearColor];
        }
        btn.selected=YES;
        ((UIView *)[self viewWithTag:btn.tag+9]).backgroundColor=[MyClass colorWithHexString:@"ff4e54"];
        self.state=YES;
    }else{
        self.state=NO;
        btn.selected=NO;
        ((UIView *)[self viewWithTag:btn.tag+9]).backgroundColor=[UIColor clearColor];
    }
    
    [_delegate ClickOnTheLine:self.maannotations myBtn:btn];
    
}
//回复原始状态
-(void)setNulls:(id)nulls{
    for (int i=0; i<3; i++) {
        ((MyButton *)[self viewWithTag:i+1]).selected=NO;
        ((UIView *)[self viewWithTag:i+10]).backgroundColor=[UIColor clearColor];
    }
    self.state=NO;
}
//给地址赋值
-(void)setMaannotations:(MAAnnotationView *)maannotations{
    _address.text=[NSString stringWithFormat:@"%@",maannotations.annotation.subtitle];
}
@end
