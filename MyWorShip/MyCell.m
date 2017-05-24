//
//  MyCell.m
//  MyWorShip
//
//  Created by 123 on 2017/5/24.
//  Copyright © 2017年 123. All rights reserved.
//

#import "MyCell.h"

@implementation MyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _img=[[UIImageView alloc]init];
        [self.contentView addSubview:_img];
        _img.sd_layout.leftSpaceToView(self.contentView, 27).topSpaceToView(self.contentView, 16).bottomSpaceToView(self.contentView, 16).widthIs(20);
        
        _name=[[UILabel alloc]init];
        _name.font=[UIFont systemFontOfSize:15];
        [self.contentView addSubview:_name];
        CGSize size=[MyClass StringHeight:@"我的消息" Lblfont:15 heightOfTheMinus:0];
        _name.sd_layout.leftSpaceToView(_img, 10).topEqualToView(_img).bottomEqualToView(_img).widthIs(size.width);
        
        _view =[[UIView alloc]init];
        _view.layer.cornerRadius = 3;
        _view.layer.masksToBounds = 3;
        [self.contentView addSubview:_view];
        _view.sd_layout.leftSpaceToView(_name, 4).topSpaceToView(self.contentView, 16).widthIs(6).heightIs(6);
        
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
