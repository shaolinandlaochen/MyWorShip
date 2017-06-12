//
//  ScrollViewCell.m
//  MyWorShip
//
//  Created by 123 on 2017/6/8.
//  Copyright © 2017年 123. All rights reserved.
//

#import "ScrollViewCell.h"

@implementation ScrollViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _scrollView=[SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, 0, 0) delegate:self placeholderImage:[UIImage imageNamed:@""]];
        _scrollView.autoScroll=YES;
        _scrollView.autoScrollTimeInterval =5;
        _scrollView.pageControlDotSize=CGSizeMake(8, 8);
        _scrollView.currentPageDotColor=[MyClass colorWithHexString:@"#de0024"];
        _scrollView.pageDotColor=[MyClass colorWithHexString:@"#f3f5f7"];
        [self.contentView addSubview:_scrollView];
        _scrollView.sd_layout.leftSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).topSpaceToView(self.contentView, 0).heightIs(WIDTH);
        
        
    }
    return self;
}
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    [_delegate cycleScrollView_didSelectItemAtIndex:index];
}

-(void)setModel:(GoodsDetilBaseClass *)model{

    NSArray *imgPath=[stringFormat(model.comm.commodityImages) componentsSeparatedByString:@","];
    _imgUrlArray=[[NSMutableArray alloc]init];
    for (int i=0; i<imgPath.count; i++) {
        [_imgUrlArray addObject:[NSString stringWithFormat:@"%@%@%@",model.imgSrc,model.comm.commodityImagesPath,imgPath[i]]];
    }
    _scrollView.imageURLStringsGroup=_imgUrlArray;
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
