//
//  OrderCell.m
//  MyWorShip
//
//  Created by 123 on 2017/5/26.
//  Copyright © 2017年 123. All rights reserved.
//

#import "OrderCell.h"

@implementation OrderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        

        
        UIImageView *imgTimeIcon=[[UIImageView alloc]init];
        imgTimeIcon.image=[UIImage imageNamed:@"icon_time"];
        [self.contentView addSubview:imgTimeIcon];
        imgTimeIcon.sd_layout.leftSpaceToView(self.contentView, 8.5).topSpaceToView(self.contentView, 9.5).heightIs(12).widthIs(12);
        
        _time=[[UILabel alloc]init];
        _time.textColor=[MyClass colorWithHexString:@"000000"];
        _time.font=[UIFont systemFontOfSize:15];
        [self.contentView addSubview:_time];
        _time.sd_layout.leftSpaceToView(imgTimeIcon, 4.5).topSpaceToView(self.contentView, 10).rightSpaceToView(self.contentView, 10).heightIs(12);
        
        _name=[[UILabel alloc]init];
        _name.text=@"购买消费";
        _name.textColor=[MyClass colorWithHexString:@"a3a3a3"];
        _name.font=[UIFont systemFontOfSize:12];
        [self.contentView addSubview:_name];
        _name.sd_layout.leftSpaceToView(self.contentView, 8.5).bottomSpaceToView(self.contentView, 13).widthIs(50).heightIs(12);
        
        _money=[[UILabel alloc]init];
        _money.textColor=[MyClass colorWithHexString:@"ff4c59"];
        [self.contentView addSubview:_money];
        _money.sd_layout.leftSpaceToView(_name, 13).bottomEqualToView(_name).widthIs(75).heightIs(20);
        
        _location=[[UILabel alloc]init];
        _location.textColor=[MyClass colorWithHexString:@"a3a3a3"];
        _location.font=[UIFont systemFontOfSize:12];
        [self.contentView addSubview:_location];
        _location.sd_layout.leftSpaceToView(_money, 10).topEqualToView(_name).rightSpaceToView(self.contentView, 10).heightIs(12);
        
        _imgRight=[[UIImageView alloc]init];
        [self.contentView addSubview:_imgRight];
        _imgRight.sd_layout.rightSpaceToView(self.contentView, 18.5).topSpaceToView(self.contentView, 24).bottomSpaceToView(self.contentView, 24).widthIs(22);
        
        _state=[[UILabel alloc]init];
        _state.textAlignment=NSTextAlignmentRight;
        _state.font=[UIFont systemFontOfSize:12];
        [self.contentView addSubview:_state];
        _state.sd_layout.rightSpaceToView(_imgRight, 1).topEqualToView(_imgRight).bottomEqualToView(_imgRight).widthIs(55);
        
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
