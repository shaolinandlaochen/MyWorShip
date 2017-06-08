//
//  AnnouncementCell.m
//  MyWorShip
//
//  Created by 123 on 2017/5/25.
//  Copyright © 2017年 123. All rights reserved.
//

#import "AnnouncementCell.h"

@implementation AnnouncementCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _name=[[UILabel alloc]init];
        _name.textColor=[MyClass colorWithHexString:@"000000"];
        _name.font=[UIFont systemFontOfSize:17];
        [self.contentView addSubview:_name];
        
        _context=[[UILabel alloc]init];
        _context.textColor=[MyClass colorWithHexString:@"000000"];
        _context.font=[UIFont systemFontOfSize:14];
        _context.numberOfLines=0;
        [self.contentView addSubview:_context];
    }
    return self;
}
-(void)setNameString:(NSString *)nameString{

    _name.text=nameString;
    _name.sd_layout.leftSpaceToView(self.contentView, 20).topSpaceToView(self.contentView, 26).rightSpaceToView(self.contentView, 20).heightIs(16);
}
-(void)setContextString:(NSString *)contextString{
    _context.text=contextString;
    _context.sd_layout.leftSpaceToView(self.contentView, 20).topSpaceToView(_name, 25).rightSpaceToView(self.contentView, 20).bottomSpaceToView(self.contentView, 29);
}
-(void)setModel:(AnnouncementListResultList *)model{
    _name.text=stringFormat(model.noticeTitle);
    _name.sd_layout.leftSpaceToView(self.contentView, 20).topSpaceToView(self.contentView, 26).rightSpaceToView(self.contentView, 20).heightIs(16);
    _context.text=stringFormat(model.noticeContent);
    _context.sd_layout.leftSpaceToView(self.contentView, 20).topSpaceToView(_name, 25).rightSpaceToView(self.contentView, 20).autoHeightRatio(0);
    [self setupAutoHeightWithBottomView:_context bottomMargin:25];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
