//
//  UseGuideContextTableViewCell.m
//  MyWorShip
//
//  Created by 123 on 2017/5/27.
//  Copyright © 2017年 123. All rights reserved.
//

#import "UseGuideContextTableViewCell.h"

@implementation UseGuideContextTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _context=[[UILabel alloc]init];
        _context.textColor=[MyClass colorWithHexString:@"000000"];
        _context.font=[UIFont systemFontOfSize:14];
        [self.contentView addSubview:_context];
        _context.sd_layout.leftSpaceToView(self.contentView, 16).topSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 1);
        
        UIView *line1=[[UIView alloc]init];
        line1.backgroundColor=[MyClass colorWithHexString:@"d7d7d7"];
        [self.contentView addSubview:line1];
        line1.sd_layout.leftSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).heightIs(1);
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
