//
//  UseGuideNameTableViewCell.m
//  MyWorShip
//
//  Created by 123 on 2017/5/27.
//  Copyright © 2017年 123. All rights reserved.
//

#import "UseGuideNameTableViewCell.h"

@implementation UseGuideNameTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _name=[[UILabel alloc]init];
        _name.textColor=[MyClass colorWithHexString:@"000000"];
        _name.font=[UIFont systemFontOfSize:12];
        _name.textAlignment=NSTextAlignmentCenter;
        [self.contentView addSubview:_name];
        _name.sd_layout.leftSpaceToView(self.contentView, 0).topSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 1).bottomSpaceToView(self.contentView, 1);
        
        UIView *line1=[[UIView alloc]init];
        line1.backgroundColor=[MyClass colorWithHexString:@"d7d7d7"];
        [self.contentView addSubview:line1];
        line1.sd_layout.leftSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).heightIs(1);
        
        UIView *line2=[[UIView alloc]init];
        line2.backgroundColor=[MyClass colorWithHexString:@"d7d7d7"];
        [self.contentView addSubview:line2];
        line2.sd_layout.bottomSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).topSpaceToView(self.contentView, 0).widthIs(1);
        
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
