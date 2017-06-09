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
        _img.sd_layout.leftSpaceToView(self.contentView, 18).topSpaceToView(self.contentView, 10).heightIs(90).widthIs(90);
        
        _name=[[UILabel alloc]init];
        _name.numberOfLines=2;
        _name.textColor=[MyClass colorWithHexString:@"000000"];
        _name.font=[UIFont systemFontOfSize:14];
        [self.contentView addSubview:_name];
        _name.sd_layout.leftSpaceToView(_img, 18).topSpaceToView(self.contentView, 16).rightSpaceToView(self.contentView, 25);
        
        _money=[[UILabel alloc]init];
        _money.textColor=[MyClass colorWithHexString:@"ff4c59"];
        _money.font=[UIFont systemFontOfSize:14];
        [self.contentView addSubview:_money];
        _money.sd_layout.leftSpaceToView(_img, 18).bottomSpaceToView(self.contentView, 19);
        
        _listMoney=[[UILabel alloc]init];
        _listMoney.textColor=[MyClass colorWithHexString:@"a3a3a3"];
        _listMoney.font=[UIFont systemFontOfSize:13];
        [self.contentView addSubview:_listMoney];
        _listMoney.sd_layout.leftSpaceToView(_money, 13).bottomEqualToView(_money);
        
    }
    return self;
}

-(void)setModel:(MonthsThanksGoodsCommodityall *)model{
    _name.text=stringFormat(model.commodityName);
    _name.sd_layout.autoHeightRatio(0);
    
    _money.text=[NSString stringWithFormat:@"会员价:¥%.2f元",model.commodityVipSellprice];
    CGSize size=[MyClass StringHeight:_money.text Lblfont:14 heightOfTheMinus:0];
    _money.sd_layout.widthIs(size.width).autoHeightRatio(0);
    
    _listMoney.text=[NSString stringWithFormat:@"原价:¥%.2f元",model.commoditySellprice];
    _listMoney.sd_layout.widthIs(100).autoHeightRatio(0);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
