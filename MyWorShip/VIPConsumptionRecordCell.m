//
//  VIPConsumptionRecordCell.m
//  MyWorShip
//
//  Created by 123 on 2017/6/15.
//  Copyright © 2017年 123. All rights reserved.
//

#import "VIPConsumptionRecordCell.h"

@implementation VIPConsumptionRecordCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _dian=[[UIView alloc]init];
        _dian.backgroundColor=[MyClass colorWithHexString:@"dadada"];
        _dian.layer.cornerRadius=4.5;
        _dian.layer.masksToBounds=4.5;
        [self addSubview:_dian];
        _dian.sd_layout.leftSpaceToView(self, 19).widthIs(9).heightIs(9).topSpaceToView(self, 35);
        
        _line=[[UIView alloc]init];
        _line.backgroundColor=[MyClass colorWithHexString:@"dadada"];
        [self addSubview:_line];
        
        _timeBig=[[UILabel alloc]init];
        _timeBig.textColor=[MyClass colorWithHexString:@"000000"];
        _timeBig.font=[UIFont systemFontOfSize:14];
        [self addSubview:_timeBig];
        _timeBig.sd_layout.leftSpaceToView(self, 38).topSpaceToView(self, 33);
        
        _timeSmall=[[UILabel alloc]init];
        _timeSmall.textColor=[MyClass colorWithHexString:@"a3a3a3"];
        _timeSmall.font=[UIFont systemFontOfSize:14];
        _timeSmall.textAlignment=NSTextAlignmentCenter;
        [self addSubview:_timeSmall];
        _timeSmall.sd_layout.leftSpaceToView(self, 38).topSpaceToView(_timeBig, 7);
        
        _number=[[UILabel alloc]init];
        _number.textColor=[MyClass colorWithHexString:@"ff606c"];
        _number.font=[UIFont systemFontOfSize:17];
        [self addSubview:_number];
        _number.sd_layout.rightSpaceToView(self, 29).topSpaceToView(self, 29);
        
        _context=[[UILabel alloc]init];
        _context.text=@"本月剩余消费次数";
        _context.font=[UIFont systemFontOfSize:15];
        _context.textColor=[MyClass colorWithHexString:@"000000"];
        [self addSubview:_context];
        CGSize size=[MyClass StringHeight:_context.text Lblfont:15 heightOfTheMinus:0];
        _context.sd_layout.rightSpaceToView(_number, 9).bottomEqualToView(_number).widthIs(size.width).heightIs(size.height);
        
        
        _message=[[UILabel alloc]init];
        _message.textColor=[MyClass colorWithHexString:@"a3a3a3"];
        _message.font=[UIFont systemFontOfSize:13];
        _message.text=@"VIP会员消费成功";
        [self addSubview:_message];
        _message.sd_layout.leftEqualToView(_context).topSpaceToView(_context, 8).rightSpaceToView(self, 0).autoHeightRatio(0);
        

    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setModel:(VIPRecordsResultList *)model{

    NSArray *timeArray=[stringFormat(model.vipTime) componentsSeparatedByString:@" "];
    if (timeArray.count>1) {
        CGSize sizeBig=[MyClass StringHeight:[NSString stringWithFormat:@"%@",timeArray[0]] Lblfont:14 heightOfTheMinus:0];
        _timeBig.text=[NSString stringWithFormat:@"%@",timeArray[0]];
        _timeBig.sd_layout.widthIs(sizeBig.width).heightIs(sizeBig.height);
        
        _timeSmall.text=[NSString stringWithFormat:@"%@",timeArray[1]];
        _timeSmall.sd_layout.widthIs(sizeBig.width).heightIs(sizeBig.height);
    }else{
        if (timeArray.count==1) {
            CGSize sizeBig=[MyClass StringHeight:[NSString stringWithFormat:@"%@",timeArray[0]] Lblfont:14 heightOfTheMinus:0];
            _timeBig.text=[NSString stringWithFormat:@"%@",timeArray[0]];
            _timeBig.sd_layout.widthIs(sizeBig.width).heightIs(sizeBig.height);
        }
    }
    
    _number.text=[NSString stringWithFormat:@"%.0f次",model.vipRemain];
    CGSize numberSize=[MyClass StringHeight:_number.text Lblfont:17 heightOfTheMinus:0];
    _number.sd_layout.widthIs(numberSize.width).heightIs(numberSize.height);
    
    
    
    
}
-(void)setIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        _line.sd_layout.leftSpaceToView(self, 23).topSpaceToView(_dian, 0).widthIs(1).bottomSpaceToView(self, 0);

    }else{
        if (indexPath.row==self.count-1) {
            _line.sd_layout.leftSpaceToView(self, 23).topSpaceToView(self, 0).widthIs(1).bottomSpaceToView(_dian, 0);
        }else{
        _line.sd_layout.leftSpaceToView(self, 23).topSpaceToView(self, 0).widthIs(1).bottomSpaceToView(self, 0);
        }
        

    }
}
@end
