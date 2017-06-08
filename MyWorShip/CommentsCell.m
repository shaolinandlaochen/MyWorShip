//
//  CommentsCell.m
//  MyWorShip
//
//  Created by 123 on 2017/6/8.
//  Copyright © 2017年 123. All rights reserved.
//

#import "CommentsCell.h"

@implementation CommentsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    
        UIImageView *headImage=[[UIImageView alloc]init];
        headImage.image=[UIImage imageNamed:@"img_touxiang_pingjia"];
        [self.contentView addSubview:headImage];
        headImage.sd_layout.leftSpaceToView(self.contentView, 9.5).topSpaceToView(self.contentView, 14.5).widthIs(37).heightIs(37);
        
        _name=[[UILabel alloc]init];
        _name.textColor=[MyClass colorWithHexString:@"000000"];
        _name.font=[UIFont systemFontOfSize:17];
        [self.contentView addSubview:_name];
        _name.sd_layout.leftSpaceToView(headImage, 5.5).topSpaceToView(self.contentView, 18.5);
        
        UIImageView *imgVip=[[UIImageView alloc]init];
        imgVip.tag=1994;
        imgVip.image=[UIImage imageNamed:@"img_vip"];
        [self.contentView addSubview:imgVip];
        
        _time=[[UILabel alloc]init];
        _time.textColor=[MyClass colorWithHexString:@"a3a3a3"];
        _time.font=[UIFont systemFontOfSize:13];
        [self.contentView addSubview:_time];
        _time.sd_layout.rightSpaceToView(self.contentView, 17).topSpaceToView(self.contentView, 28);
        
        _context=[[UILabel alloc]init];
        _context.textColor=[MyClass colorWithHexString:@"000000"];
        _context.font=[UIFont systemFontOfSize:13];
        [self.contentView addSubview:_context];
        _context.sd_layout.rightSpaceToView(self.contentView, 25).topSpaceToView(headImage, 16).leftSpaceToView(self.contentView, 51);
        
        
        for (int i=0; i<5; i++) {
            UIImageView *xing=[[UIImageView alloc]init];
            xing.image=[UIImage imageNamed:@"icon_hollow"];
            xing.tag=i+1;
            [self.contentView addSubview:xing];
            float x=4.5+(9+5)*(i%5);
            xing.sd_layout.leftSpaceToView(headImage, x).topSpaceToView(self.contentView, 40).widthIs(9).heightIs(9);
        }
        
    }
    return self;
}

-(void)setModel:(MyMessageListResultList *)model{

    _name.text=@"我是民资";
    CGSize size=[MyClass StringHeight:_name.text Lblfont:17 heightOfTheMinus:0];
    _name.sd_layout.autoHeightRatio(0).widthIs(size.width);
    ((UIImageView *)[self.contentView viewWithTag:1994]).sd_layout.leftSpaceToView(_name, 5).topSpaceToView(self.contentView, 18).widthIs(15.5).heightIs(15.5);
    _time.text=@"2016-02-02 18:05:04";
    CGSize timeSize=[MyClass StringHeight:_time.text Lblfont:13 heightOfTheMinus:0];
    _time.sd_layout.widthIs(timeSize.width).heightIs(timeSize.height);
    _context.text=@"说得对分布式的开发商的爆发式的福克斯山东地方收到了丰盛的复合函数啥都懂if还是地方还是东方红是山东地发挥施蒂利克发还是山东地发挥施蒂利克富华大厦老客户独立思考哈佛收到货佛山店";
    _context.sd_layout.autoHeightRatio(0);
    [self setupAutoHeightWithBottomView:_context bottomMargin:16];
    for (int i=0; i<3; i++) {
        ((UIImageView *)[self.contentView viewWithTag:i+1]).image=[UIImage imageNamed:@"star_solid"];
    }
    
    
}
@end
