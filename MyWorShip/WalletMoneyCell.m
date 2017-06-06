//
//  WalletMoneyCell.m
//  MyWorShip
//
//  Created by 123 on 2017/5/26.
//  Copyright © 2017年 123. All rights reserved.
//

#import "WalletMoneyCell.h"

@implementation WalletMoneyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UILabel *lbl=[[UILabel alloc]init];
        lbl.text=@"我的余额(元)";
        lbl.textAlignment=NSTextAlignmentCenter;
        lbl.font=[UIFont systemFontOfSize:12];
        lbl.textColor=[MyClass colorWithHexString:@"a3a3a3"];
        [self.contentView addSubview:lbl];
        lbl.sd_layout.leftSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).topSpaceToView(self.contentView, 39).autoHeightRatio(0);
        
        
        _money=[[UILabel alloc]init];
        _money.textAlignment=NSTextAlignmentCenter;
        _money.font=[UIFont systemFontOfSize:45];
        _money.textColor=[MyClass colorWithHexString:@"000000"];
        [self.contentView addSubview:_money];
        _money.sd_layout.leftSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).topSpaceToView(lbl, 11.5).heightIs(35);
        
        
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
