//
//  GoodsCell.m
//  MyWorShip
//
//  Created by 123 on 2017/5/27.
//  Copyright © 2017年 123. All rights reserved.
//

#import "GoodsCell.h"

@implementation GoodsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _img=[[UIImageView alloc]init];
        [self.contentView addSubview:_img];
        _img.sd_layout.leftSpaceToView(self.contentView, 18.5).topSpaceToView(self.contentView, 13).heightIs(19).widthIs(17);
        
        _name=[[UILabel alloc]init];
        _name.textColor=[MyClass colorWithHexString:@"000000"];
        _name.font=[UIFont systemFontOfSize:15];
        [self.contentView addSubview:_name];
        _name.sd_layout.leftSpaceToView(_img, 6).topSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).widthIs(WIDTH/3);
        
        _money=[[UILabel alloc]init];
        _money.textColor=[MyClass colorWithHexString:@"000000"];
        _money.font=[UIFont systemFontOfSize:15];
        _money.textAlignment=NSTextAlignmentRight;
        [self.contentView addSubview:_money];
        _money.sd_layout.rightSpaceToView(self.contentView, 17).topSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).widthIs(WIDTH/3);
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
