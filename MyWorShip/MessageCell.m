//
//  MessageCell.m
//  MyWorShip
//
//  Created by 123 on 2017/5/25.
//  Copyright © 2017年 123. All rights reserved.
//

#import "MessageCell.h"

@implementation MessageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _name=[[UILabel alloc]init];
        _name.textColor=[MyClass colorWithHexString:@"000000"];
        _name.font=[UIFont systemFontOfSize:15];
        [self.contentView addSubview:_name];
        _name.sd_layout.leftSpaceToView(self.contentView, 35).topSpaceToView(self.contentView, 18).widthIs(65).autoHeightRatio(0);
        
        _context=[[UILabel alloc]init];
        _context.textColor=[MyClass colorWithHexString:@"a3a3a3"];
        _context.font=[UIFont systemFontOfSize:13];
        _context.numberOfLines=0;
        [self.contentView addSubview:_context];
        
        
        _time=[[UILabel alloc]init];
        _time.textAlignment=NSTextAlignmentRight;
        _time.textColor=[MyClass colorWithHexString:@"a3a3a3"];
        _time.font=[UIFont systemFontOfSize:12];
        [self.contentView addSubview:_time];
        
        
        _red=[[UILabel alloc]init];
        _red.layer.cornerRadius = 4;
        _red.layer.masksToBounds = 4;
        [self.contentView addSubview:_red];
        _red.sd_layout.leftSpaceToView(self.contentView, 20).topSpaceToView(_name, 10).widthIs(8).heightIs(8);
        
        
    }
    return self;
}


-(void)setModel:(MyMessageListResultList *)model{
    _name.text=[NSString stringWithFormat:@"%@",model.messageTitle];
    _name.sd_layout.leftSpaceToView(self.contentView, 35).topSpaceToView(self.contentView, 18).widthIs(65).autoHeightRatio(0);
    if (model.readState==0) {
        _red.backgroundColor=[UIColor redColor];
    }else{
    _red.backgroundColor=[UIColor clearColor];
    }
    
    _time.text=[NSString stringWithFormat:@"%@",model.messageTime];
    _time.sd_layout.rightSpaceToView(self.contentView, 17).topSpaceToView(self.contentView, 20).leftSpaceToView(_name, 10).autoHeightRatio(0);
    _context.text=model.messageText;
    CGSize size=[MyClass StringHeight:_context.text Lblfont:13 heightOfTheMinus:65];
    if (size.height<16) {
        _context.sd_layout.leftSpaceToView(self.contentView, 35).topSpaceToView(_name, 8.5).rightSpaceToView(self.contentView, 30).autoHeightRatio(0);
    }else{
        _context.sd_layout.leftSpaceToView(self.contentView, 35).topSpaceToView(_name, 8.5).rightSpaceToView(self.contentView, 30).heightIs(32);
    
    }
     [self setupAutoHeightWithBottomView:_context bottomMargin:16];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
