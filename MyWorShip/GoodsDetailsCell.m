//
//  GoodsDetailsCell.m
//  MyWorShip
//
//  Created by 123 on 2017/6/8.
//  Copyright © 2017年 123. All rights reserved.
//

#import "GoodsDetailsCell.h"

@implementation GoodsDetailsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor=[MyClass colorWithHexString:@"f3f5f7"];
        _webView=[[UIWebView alloc]init];
        _webView.delegate=self;
        [self.contentView addSubview:_webView];
        _webView.sd_layout.leftSpaceToView(self.contentView, 0).topSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0);
    }
    return self;
}
-(void)setCommodity_desc:(NSString *)commodity_desc{
    if ([commodity_desc length]>0) {
        [SVProgressHUD showWithStatus:@"正在加载商品详情"];
        NSString *htmls = [NSString stringWithFormat:@"<html> \n"
                           "<head> \n"
                           "<style type=\"text/css\"> \n"
                           "body {font-size:15px;}\n"
                           "</style> \n"
                           "</head> \n"
                           "<body>"
                           "<script type='text/javascript'>"
                           "window.onload = function(){\n"
                           "var $img = document.getElementsByTagName('img');\n"
                           "for(var p in  $img){\n"
                           " $img[p].style.width = '100%%';\n"
                           "$img[p].style.height ='auto'\n"
                           "}\n"
                           "}"
                           "</script>%@"
                           "</body>"
                           "</html>",commodity_desc];
        _webView.userInteractionEnabled=NO;//禁止点击,禁止滑动,关闭所有交互
        [_webView loadHTMLString:htmls baseURL:nil];
    }else{
        [SVProgressHUD dismiss];
    }
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView     //网页加载完成的时候调用
{
    
    
    //这里是js，主要目的实现对url的获取
    static  NSString * const jsGetImages =
    @"function getImages(){\
    var objs = document.getElementsByTagName(\"img\");\
    var imgScr = '';\
    for(var i=0;i<objs.length;i++){\
    imgScr = imgScr + objs[i].src + '+';\
    };\
    return imgScr;\
    };";
    
    [webView stringByEvaluatingJavaScriptFromString:jsGetImages];//注入js方法
    NSString *urlResurlt = [webView stringByEvaluatingJavaScriptFromString:@"getImages()"];
    self.imageUrl = [NSMutableArray arrayWithArray:[urlResurlt componentsSeparatedByString:@"+"]];
    if (self.imageUrl.count>0) {
        NSString *str=[NSString stringWithFormat:@"%@",self.imageUrl[self.imageUrl.count-1]];
        if ([str length]<10) {//最后一个图片地址长度小于10 证明是个不完整的图片一般正常的都超过10
            [self.imageUrl removeObjectAtIndex:self.imageUrl.count-1];
        }
    }
    
    NSLog(@"*-*-*-*-*-*%@",self.imageUrl);
    
    
    
    
    NSString *js = @"function addImgClickEvent() { \
    var imgs = document.getElementsByTagName('img'); \
    for (var i = 0; i < imgs.length; ++i) { \
    var img = imgs[i]; \
    img.onclick = function () { \
    window.location.href = 'xsq-image:' + this.src; \
    }; \
    } \
    }";
    // 注入JS代码
    [webView stringByEvaluatingJavaScriptFromString:js];
    // 执行所注入的JS代码
    [webView stringByEvaluatingJavaScriptFromString:@"addImgClickEvent();"];
    
    
    
    
    for (id subview in webView.subviews)
        if ([[subview class] isSubclassOfClass: [UIScrollView class]])
            ((UIScrollView *)subview).bounces = NO;
    webView.scrollView.bounces = NO;
    
    
    CGSize fittingSize = [webView sizeThatFits:CGSizeZero];
    NSLog(@"网页高度------:%f",fittingSize.height);
    
    CGFloat height = [[_webView stringByEvaluatingJavaScriptFromString:@"document.body.scrollHeight"]floatValue];
    NSLog(@"网页高度---111111111111111111111---:%f",height);
    _webView.sd_layout.heightIs(height);
    
    
    _webView.userInteractionEnabled=YES;//开启交互
    [_delegate htmlHeight:height+1];
    
    [SVProgressHUD dismiss];
}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    NSString *requestString = [[[request URL] absoluteString]stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //NSLog(@"requestString : %@",requestString);
    
    
    NSArray *components = [requestString componentsSeparatedByString:@"|"];
    //NSLog(@"=components=====%@",components);
    if (components.count>0) {
        NSString *imgstr=[NSString stringWithFormat:@"%@",components[0]];
        
        //查看url字符串中是否包含输入的内容,
        if([imgstr rangeOfString:@"xsq-image:"].location !=NSNotFound)
        {
            NSArray *imgAry=[imgstr componentsSeparatedByString:@"xsq-image:"];
            if (imgAry.count>1) {
                NSString *imgUrl=[NSString stringWithFormat:@"%@",imgAry[1]];
                for (int i=0; i<self.imageUrl.count; i++) {
                    NSString *urlStr=[NSString stringWithFormat:@"%@",self.imageUrl[i]];
                    if ([urlStr isEqualToString:imgUrl]) {
                        [self tapGesture:urlStr];
                    }
                }
                
                
            }
            
        }
    }
    
    
    
    
    return YES;
}


-(void)tapGesture:(NSString *)imgUrl{
    //[_delegate ReviewImagesUrl:imgUrl];
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
