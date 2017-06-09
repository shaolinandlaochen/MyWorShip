//
//  PreferentialCell.m
//  MyWorShip
//
//  Created by 123 on 2017/5/25.
//  Copyright © 2017年 123. All rights reserved.
//

#import "PreferentialCell.h"

@implementation PreferentialCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _bjImage=[[UIImageView alloc]init];
        [self.contentView addSubview:_bjImage];
        _bjImage.sd_layout.leftSpaceToView(self.contentView, 18).topSpaceToView(self.contentView, 10).rightSpaceToView(self.contentView, 18).bottomSpaceToView(self.contentView, 0);
        
        _typeImage=[[UIImageView alloc]init];
        [self.contentView addSubview:_typeImage];
        _typeImage.sd_layout.leftSpaceToView(self.contentView, 136).topSpaceToView(self.contentView, 18).widthIs(60).heightIs(39);
        
        _money=[[UILabel alloc]init];
        [self.contentView addSubview:_money];
        _money.sd_layout.leftSpaceToView(self.contentView, 22.5).topSpaceToView(self.contentView, 47).widthIs(100).bottomSpaceToView(self.contentView, 29);
        
        _conditions=[[UILabel alloc]init];
        _conditions.textColor=[MyClass colorWithHexString:@"a3a3a3"];
        _conditions.font=[UIFont systemFontOfSize:12];
        [self.contentView addSubview:_conditions];
        _conditions.sd_layout.leftEqualToView(_money).topSpaceToView(_money, 5).widthIs(200).heightIs(13);
        
        _name=[[UILabel alloc]init];
        _name.textAlignment=NSTextAlignmentRight;
        _name.font=[UIFont systemFontOfSize:18];
        [self.contentView addSubview:_name];
        _name.sd_layout.rightSpaceToView(self.contentView, 36).topSpaceToView(self.contentView, 41.5).autoHeightRatio(0).leftSpaceToView(_money, 10);
        
        _time=[[UILabel alloc]init];
        _time.textAlignment=NSTextAlignmentRight;
        _time.font=[UIFont systemFontOfSize:12];
        [self.contentView addSubview:_time];
        _time.sd_layout.rightSpaceToView(self.contentView, 36).topSpaceToView(_name, 8.5).bottomSpaceToView(self.contentView, 25).leftEqualToView(_name);
        
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
