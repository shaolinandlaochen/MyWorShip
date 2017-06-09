//
//  VIPConsumptionCell.m
//  MyWorShip
//
//  Created by 123 on 2017/6/9.
//  Copyright © 2017年 123. All rights reserved.
//

#import "VIPConsumptionCell.h"

@implementation VIPConsumptionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _allAcount=[[UILabel alloc]init];
        _allAcount.font=[UIFont systemFontOfSize:14];
        _allAcount.textColor=[MyClass colorWithHexString:@"010101"];
        [self.contentView addSubview:_allAcount];
        _allAcount.sd_layout.leftSpaceToView(self.contentView, 17).rightSpaceToView(self.contentView, 17).topSpaceToView(self.contentView, 16).heightIs(14);
        
        _context=[[UILabel alloc]init];
        _context.font=[UIFont systemFontOfSize:13];
        [self.contentView addSubview:_context];
        _context.sd_layout.leftEqualToView(_allAcount).rightEqualToView(_allAcount).topSpaceToView(_allAcount, 8).heightIs(14);
    }
    return self;
}
-(void)setNumber:(NSInteger)number{
_allAcount.text=@"VIP特权消费商品免费消费次数:200次";
    NSString *string1=@"已消费次数";
    NSString *string2=@"剩余消费次数";
    NSString *str1=@"2次";
    NSString *str2=@"8次";
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@%@%@",string1,str1,string2,str2]];
    
    [str addAttribute:NSForegroundColorAttributeName value:[MyClass colorWithHexString:@"a3a3a3"] range:NSMakeRange(0,[string1 length])];
    [str addAttribute:NSForegroundColorAttributeName value:[MyClass colorWithHexString:@"ff7b84"] range:NSMakeRange([string1 length],[str1 length])];
    [str addAttribute:NSForegroundColorAttributeName value:[MyClass colorWithHexString:@"a3a3a3"] range:NSMakeRange([string1 length]+[str1 length],[string2 length])];
    [str addAttribute:NSForegroundColorAttributeName value:[MyClass colorWithHexString:@"ff7b84"] range:NSMakeRange([string1 length]+[str1 length]+[string2 length],[str2 length])];
    
    _context.attributedText = str;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
