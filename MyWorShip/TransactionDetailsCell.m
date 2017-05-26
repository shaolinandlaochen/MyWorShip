//
//  TransactionDetailsCell.m
//  MyWorShip
//
//  Created by 123 on 2017/5/26.
//  Copyright © 2017年 123. All rights reserved.
//

#import "TransactionDetailsCell.h"

@implementation TransactionDetailsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _title=[[UILabel alloc]init];
        _title.textColor=[MyClass colorWithHexString:@"000000"];
        _title.font=[UIFont systemFontOfSize:15];
        [self.contentView addSubview:_title];
        _title.sd_layout.leftSpaceToView(self.contentView, 18).topSpaceToView(self.contentView, 18).rightSpaceToView(self.contentView, 150).heightIs(15);
        
        _time=[[UILabel alloc]init];
        _time.textColor=[MyClass colorWithHexString:@"a3a3a3"];
        _time.font=[UIFont systemFontOfSize:10];
        [self.contentView addSubview:_time];
        _time.sd_layout.leftEqualToView(_title).topSpaceToView(_title, 7).rightEqualToView(_title).bottomSpaceToView(self.contentView, 16);
        
        _money=[[UILabel alloc]init];
        _money.textColor=[MyClass colorWithHexString:@"ff4c59"];
        _money.font=[UIFont systemFontOfSize:18];
        _money.textAlignment=NSTextAlignmentRight;
        [self.contentView addSubview:_money];
        _money.sd_layout.rightSpaceToView(self.contentView, 19).topSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).leftSpaceToView(self.contentView, 220);
        
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
