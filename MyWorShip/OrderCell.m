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
        
        UILabel *lbl1=[[UILabel alloc]init];
        lbl1.text=@"购买消费";
        lbl1.textColor=[MyClass colorWithHexString:@"a3a3a3"];
        lbl1.font=[UIFont systemFontOfSize:12];
        [self.contentView addSubview:lbl1];
        lbl1.sd_layout.leftSpaceToView(self.contentView, 8.5).bottomSpaceToView(self.contentView, 13).widthIs(50).heightIs(12);
        
        _money=[[UILabel alloc]init];
        _money.textColor=[MyClass colorWithHexString:@"ff4c59"];
        [self.contentView addSubview:_money];
        _money.sd_layout.leftSpaceToView(lbl1, 13).bottomEqualToView(lbl1).widthIs(75).heightIs(20);
        
        _location=[[UILabel alloc]init];
        _location.textColor=[MyClass colorWithHexString:@"a3a3a3"];
        _location.font=[UIFont systemFontOfSize:12];
        [self.contentView addSubview:_location];
        _location.sd_layout.leftSpaceToView(_money, 10).topEqualToView(lbl1).rightSpaceToView(self.contentView, 10).heightIs(12);
        
        
        
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end