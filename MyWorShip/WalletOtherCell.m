//
//  WalletOtherCell.m
//  MyWorShip
//
//  Created by 123 on 2017/5/26.
//  Copyright © 2017年 123. All rights reserved.
//

#import "WalletOtherCell.h"

@implementation WalletOtherCell

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
        _name.sd_layout.leftSpaceToView(self.contentView, 18).topSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 150);
        
        UIImageView *img=[[UIImageView alloc]init];
        img.image=[UIImage imageNamed:@"icon_right"];
        [self.contentView addSubview:img];
        img.sd_layout.rightSpaceToView(self.contentView, 18.5).topSpaceToView(self.contentView, 18.5).bottomSpaceToView(self.contentView, 18.5).widthIs(6.5);
        
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
