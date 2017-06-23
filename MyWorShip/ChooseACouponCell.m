//
//  ChooseACouponCell.m
//  MyWorShip
//
//  Created by 123 on 2017/6/23.
//  Copyright © 2017年 123. All rights reserved.
//

#import "ChooseACouponCell.h"

@implementation ChooseACouponCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _name=[[UILabel alloc]init];
        _name.textColor=[MyClass colorWithHexString:@"000000"];
        _name.font=[UIFont systemFontOfSize:13];
        _name.textAlignment=NSTextAlignmentCenter;
        [self.contentView addSubview:_name];
        _name.sd_layout.leftSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).topSpaceToView(self.contentView, 0);
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
