//
//  PersonalCenterCell.m
//  MyWorShip
//
//  Created by 123 on 2017/6/7.
//  Copyright © 2017年 123. All rights reserved.
//

#import "PersonalCenterCell.h"

@implementation PersonalCenterCell

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
        _name.sd_layout.leftSpaceToView(self.contentView, 21).topSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).widthIs(100);
        
        UIImageView *rightImage=[[UIImageView alloc]init];
        rightImage.image=[UIImage imageNamed:@"icon_right"];
        [self.contentView addSubview:rightImage];
        rightImage.sd_layout.rightSpaceToView(self.contentView, 10).topSpaceToView(self.contentView, 14).bottomSpaceToView(self.contentView, 13).widthIs(22);
        _context=[[UILabel alloc]init];
        _context.textColor=[MyClass colorWithHexString:@"a3a3a3"];
        _context.font=[UIFont systemFontOfSize:15];
        _context.textAlignment=NSTextAlignmentRight;
        [self.contentView addSubview:_context];
        _context.sd_layout.rightSpaceToView(rightImage, 1).topSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).widthIs(150);
    
        
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
