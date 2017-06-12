//
//  GoodsContextCell.m
//  MyWorShip
//
//  Created by 123 on 2017/6/8.
//  Copyright © 2017年 123. All rights reserved.
//

#import "GoodsContextCell.h"

@implementation GoodsContextCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _name=[[UILabel alloc]init];
        _name.textColor=[MyClass colorWithHexString:@"000000"];
        _name.font=[UIFont systemFontOfSize:17];
        _name.numberOfLines=2;
      //  [_name setEditable:NO];
        [self.contentView addSubview:_name];
        _name.sd_layout.leftSpaceToView(self.contentView, 17).topSpaceToView(self.contentView, 12).rightSpaceToView(self.contentView, 17).heightIs(50);
        
        _price=[[UILabel alloc]init];
        _price.textColor=[MyClass colorWithHexString:@"ff4c59"];
        _price.font=[UIFont systemFontOfSize:22];
        [self.contentView addSubview:_price];
        _price.sd_layout.leftEqualToView(_name).topSpaceToView(_name, 20).widthIs(110).heightIs(17);
        
        _listPrice=[[UILabel alloc]init];
        _listPrice.textColor=[MyClass colorWithHexString:@"a3a3a3"];
        _listPrice.font=[UIFont systemFontOfSize:17];
        [self.contentView addSubview:_listPrice];
        _listPrice.sd_layout.leftSpaceToView(_price, 0).bottomEqualToView(_price).heightIs(13).widthIs(90);

        
        _contextNumber=[[UILabel alloc]init];
        _contextNumber.textColor=[MyClass colorWithHexString:@"a3a3a3"];
        _contextNumber.font=[UIFont systemFontOfSize:13];
        _contextNumber.textAlignment=NSTextAlignmentRight;
        [self.contentView addSubview:_contextNumber];
        _contextNumber.sd_layout.rightSpaceToView(self.contentView, 17).topSpaceToView(_name, 23).widthIs(100).heightIs(15);
        
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
