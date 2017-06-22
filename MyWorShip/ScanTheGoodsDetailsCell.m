//
//  ScanTheGoodsDetailsCell.m
//  MyWorShip
//
//  Created by 123 on 2017/6/6.
//  Copyright © 2017年 123. All rights reserved.
//

#import "ScanTheGoodsDetailsCell.h"

@implementation ScanTheGoodsDetailsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        _image=[[UIImageView alloc]init];
        [self.contentView addSubview:_image];
        _image.sd_layout.leftSpaceToView(self.contentView, 5).topSpaceToView(self.contentView, 7).bottomSpaceToView(self.contentView, 7).widthIs(116);
        
        _name=[[UITextView alloc]init];
        [_name setEditable:NO];
        _name.textColor=[MyClass colorWithHexString:@"000000"];
        _name.font=[UIFont systemFontOfSize:14];
        [self.contentView addSubview:_name];
        _name.sd_layout.leftSpaceToView(_image, 7).topSpaceToView(self.contentView, 12).rightSpaceToView(self.contentView, 15).heightIs(35);
        
        _money=[[UILabel alloc]init];
        _money.textColor=[MyClass colorWithHexString:@"ff4c59"];
        _money.font=[UIFont systemFontOfSize:17];
        [self.contentView addSubview:_money];
        _money.sd_layout.leftSpaceToView(_image, 7).topSpaceToView(_name, 9);
        
        _VIPmoney=[[UILabel alloc]init];
        _VIPmoney.textColor=[MyClass colorWithHexString:@"808080"];
        _VIPmoney.font=[UIFont systemFontOfSize:14];
        [self.contentView addSubview:_VIPmoney];
        _VIPmoney.sd_layout.leftSpaceToView(_money, 7).bottomEqualToView(_money);
        
        _context=[[UILabel alloc]init];
        _context.textColor=[MyClass colorWithHexString:@"a3a3a3"];
        _context.font=[UIFont systemFontOfSize:13];
        [self.contentView addSubview:_context];
        _context.sd_layout.leftEqualToView(_money).bottomSpaceToView(self.contentView, 18).widthIs(120).heightIs(14);
        
        
        _buyBtn=[MyButton buttonWithType:UIButtonTypeCustom];
        [_buyBtn setTitle:@"立即购买" forState:UIControlStateNormal];
        [_buyBtn setTitleColor:[MyClass colorWithHexString:@"ffffff"] forState:UIControlStateNormal];
        _buyBtn.titleLabel.font=[UIFont systemFontOfSize:13];
        _buyBtn.layer.cornerRadius=5;
        _buyBtn.layer.masksToBounds=5;
        _buyBtn.backgroundColor=[MyClass colorWithHexString:@"ff4c59"];
        [self.contentView addSubview:_buyBtn];
        _buyBtn.sd_layout.rightSpaceToView(self.contentView, 16).bottomSpaceToView(self.contentView, 8).widthIs(75).heightIs(27);
        
        
    }
    return self;
}

-(void)setModel:(EquipmentCommodityResultList *)model{
    _name.text=stringFormat(model.commodityName);
    
    _money.text=[NSString stringWithFormat:@"¥%.2f",model.commoditySellprice];
    CGSize moneySize=[MyClass StringHeight:_money.text Lblfont:17 heightOfTheMinus:0];
    _money.sd_layout.widthIs(moneySize.width).autoHeightRatio(0);
    
    _VIPmoney.text=[NSString stringWithFormat:@"VIP:¥%.2f元",model.commodityVipSellprice];
    CGSize VIPSize=[MyClass StringHeight:_VIPmoney.text Lblfont:14 heightOfTheMinus:0];
    _VIPmoney.sd_layout.widthIs(VIPSize.width).autoHeightRatio(0);
    
    _context.text=[NSString stringWithFormat:@"已售:%.0f 剩余:%.0f ",model.commoditySales,model.commodityReserves];
    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
