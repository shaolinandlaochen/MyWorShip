//
//  VIPCustomerInformationCell.m
//  MyWorShip
//
//  Created by 123 on 2017/6/9.
//  Copyright © 2017年 123. All rights reserved.
//

#import "VIPCustomerInformationCell.h"

@implementation VIPCustomerInformationCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor=[MyClass colorWithHexString:@"ff7b84"];
        UIImageView *img=[[UIImageView alloc]init];
        img.image=[UIImage imageNamed:@"img_touxiang_vip"];
        [self.contentView addSubview:img];
        img.sd_layout.leftSpaceToView(self.contentView, 17.5).topSpaceToView(self.contentView, 22).widthIs(31).heightIs(31);
        
        _name=[[UILabel alloc]init];
        _name.textColor=[MyClass colorWithHexString:@"ffffff"];
        _name.font=[UIFont systemFontOfSize:13];
        [self.contentView addSubview:_name];
        _name.sd_layout.leftSpaceToView(img, 4).topEqualToView(img).bottomEqualToView(img).rightSpaceToView(self.contentView, 10);
        
        
        UIImageView *imgVip=[[UIImageView alloc]init];
        imgVip.image=[UIImage imageNamed:@"kk_vip"];
        [self.contentView addSubview:imgVip];
        imgVip.sd_layout.leftSpaceToView(self.contentView, (WIDTH-252)/2).topSpaceToView(self.contentView, 58).widthIs(252).heightIs(172);
        
        _day=[[UILabel alloc]init];
        //_day.text=@"剩余VIP天数:200天";
        _day.font=[UIFont systemFontOfSize:12];
        _day.textColor=[MyClass colorWithHexString:@"ffffff"];
        _day.textAlignment=NSTextAlignmentCenter;
        [self.contentView addSubview:_day];
        _day.sd_layout.leftSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).topSpaceToView(self.contentView, 114).autoHeightRatio(0);
        
       UILabel * string=[[UILabel alloc]init];
        string.text=@"VIP用户";
        string.font=[UIFont systemFontOfSize:38];
        string.textColor=[MyClass colorWithHexString:@"ffffff"];
        string.textAlignment=NSTextAlignmentCenter;
        [self.contentView addSubview:string];
        string.sd_layout.leftSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).topSpaceToView(_day, 21).autoHeightRatio(0);
        
        
        
    }
    return self;
}
-(void)setModel:(VIPBaseClass *)model{
    
    _day.text=[NSString stringWithFormat:@"剩余VIP天数:%.0f天",model.vipRemainDay];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
