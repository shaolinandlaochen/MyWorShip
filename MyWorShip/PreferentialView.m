//
//  PreferentialView.m
//  MyWorShip
//
//  Created by 123 on 2017/5/25.
//  Copyright © 2017年 123. All rights reserved.
//

#import "PreferentialView.h"

@implementation PreferentialView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        self.backgroundColor=[UIColor whiteColor];
        for (int i=0; i<3; i++) {
            MyButton *btn=[MyButton buttonWithType:UIButtonTypeCustom];
            btn.titleLabel.font=[UIFont systemFontOfSize:15];
            btn.tag=i+1;
            [btn addTarget:self action:@selector(onButtonCLick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
            btn.sd_layout.leftSpaceToView(self, WIDTH/3*i).topSpaceToView(self, 0).bottomSpaceToView(self, 2).widthIs(WIDTH/3);
            
            UILabel *line=[[UILabel alloc]init];
            line.backgroundColor=[UIColor clearColor];
            line.tag=i+10;
            [self addSubview:line];
            line.sd_layout.leftSpaceToView(self, WIDTH/3*i).topSpaceToView(btn, 0).heightIs(1.5).widthIs(WIDTH/3);
            
        }
        
    }
    return self;
}
-(void)onButtonCLick:(MyButton *)btn{
    [_delegate state:btn.tag-1];
}
-(void)setArray:(NSArray *)array{
    for (int i=0; i<array.count; i++) {
        [((MyButton *)[self viewWithTag:i+1]) setTitle:array[i] forState:UIControlStateNormal];
        
    }
}
-(void)setIdx:(NSInteger)idx{
    for (int i=0; i<3; i++) {
        [((MyButton *)[self viewWithTag:i+1]) setTitleColor:[MyClass colorWithHexString:@"000000"] forState:UIControlStateNormal];
        ((UILabel *)[self viewWithTag:i+10]).backgroundColor=[UIColor clearColor];
    }
     [((MyButton *)[self viewWithTag:idx+1]) setTitleColor:[MyClass colorWithHexString:@"ff4c59"] forState:UIControlStateNormal];
      ((UILabel *)[self viewWithTag:idx+10]).backgroundColor=[MyClass colorWithHexString:@"ff4c59"];
}
@end
