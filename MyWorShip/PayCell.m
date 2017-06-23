//
//  PayCell.m
//  MyWorShip
//
//  Created by 123 on 2017/6/22.
//  Copyright © 2017年 123. All rights reserved.
//

#import "PayCell.h"

@implementation PayCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _name=[[UILabel alloc]init];
        _name.textColor=[MyClass colorWithHexString:@"000000"];
        _name.font=[UIFont systemFontOfSize:15];
        [self.contentView addSubview:_name];
        _name.sd_layout.leftSpaceToView(self.contentView, 18).topSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).widthIs(150);
        
        
        _rightIcon=[[UIImageView alloc]init];
        [self.contentView addSubview:_rightIcon];
        _rightIcon.sd_layout.rightSpaceToView(self.contentView, 17).topSpaceToView(self.contentView, 17).bottomSpaceToView(self.contentView, 17).widthIs(0);
        
        _money=[[UILabel alloc]init];
        _money.textColor=[MyClass colorWithHexString:@"000000"];
        _money.font=[UIFont systemFontOfSize:17];
        _money.textAlignment=NSTextAlignmentRight;
        [self.contentView addSubview:_money];
        _money.sd_layout.rightSpaceToView(_rightIcon, 0).topEqualToView(_name).bottomEqualToView(_name).widthIs(200);
        
    }
    return self;
}
-(void)setImgName:(NSString *)imgName{
    _rightIcon.image=[UIImage imageNamed:@"icon_right"];
    _rightIcon.sd_layout.widthIs(15);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
