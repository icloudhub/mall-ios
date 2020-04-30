//
//  ProductCellData.m
//  BusinseeLifeBox
//
//  Created by admin on 2020/4/27.
//  Copyright © 2020 admin. All rights reserved.
//

#import "ProductCellData.h"

@implementation ProductCellData
-(NSString *)html{
    if ([_type isEqualToString:@"p"]) {
        return @"<p>这是一段文字内容</p>";
    }
    else if ([_type isEqualToString:@"img"]) {
        return @"<img  src=\"https://timgsa.baidu.com/timg?image&amp;quality=80&amp;size=b9999_10000&amp;sec=1588056453658&amp;di=40890dbbaef42553043c3214c3a2fbff&amp;imgtype=0&amp;src=http%3A%2F%2Fe.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2Fd62a6059252dd42a1c362a29033b5bb5c9eab870.jpg\">";
    }else
    {
        return @"<div></div>";
    }
    
}
@end
