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
        imgTimeIcon.sd_layout.leftSpaceToView(self.contentView, 8.5).topSpaceToView(self.contentView, 11).heightIs(12).widthIs(12);
        
        _time=[[UILabel alloc]init];
        _time.textColor=[MyClass colorWithHexString:@"000000"];
        _time.font=[UIFont systemFontOfSize:15];
        [self.contentView addSubview:_time];
        _time.sd_layout.leftSpaceToView(imgTimeIcon, 4.5).topSpaceToView(self.contentView, 11).rightSpaceToView(self.contentView, 100).heightIs(12);
        
        _money=[[UILabel alloc]init];
        _money.textAlignment=NSTextAlignmentRight;
        _money.textColor=[MyClass colorWithHexString:@"000000"];
        [self.contentView addSubview:_money];
        _money.sd_layout.rightSpaceToView(self.contentView, 8.5).topSpaceToView(self.contentView, 9).heightIs(15.5).widthIs(100);
        
        UIView *line=[[UIView alloc]init];
        line.backgroundColor=[MyClass colorWithHexString:@"d7d7d7"];
        [self.contentView addSubview:line];
        line.sd_layout.leftSpaceToView(self.contentView, 0).topSpaceToView(self.contentView, 33).rightSpaceToView(self.contentView, 0).heightIs(0.5);
        
        _name=[[UILabel alloc]init];
        _name.textColor=[MyClass colorWithHexString:@"a3a3a3"];
        _name.font=[UIFont systemFontOfSize:12];
        [self.contentView addSubview:_name];
        _name.sd_layout.leftSpaceToView(self.contentView, 10).topSpaceToView(line, 15).rightSpaceToView(self.contentView, 10).heightIs(12);
        

        
        _location=[[UILabel alloc]init];
        _location.textColor=[MyClass colorWithHexString:@"a3a3a3"];
        _location.font=[UIFont systemFontOfSize:12];
        [self.contentView addSubview:_location];
        _location.sd_layout.leftSpaceToView(self.contentView, 10).topSpaceToView(_name, 13).rightSpaceToView(self.contentView, 10).heightIs(12);

        
        
        UIImageView *line_order=[[UIImageView alloc]init];
        line_order.image=[UIImage imageNamed:@"line_order"];
        [self.contentView addSubview:line_order];
        line_order.sd_layout.leftSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 46).heightIs(1);
        
        _stateBtn=[MyButton buttonWithType:UIButtonTypeCustom];
        _stateBtn.titleLabel.font=[UIFont systemFontOfSize:14];
        [self.contentView addSubview:_stateBtn];
        _stateBtn.sd_layout.rightSpaceToView(self.contentView, 9).topSpaceToView(line_order, 9).bottomSpaceToView(self.contentView, 9).widthIs(75);
        
        
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
