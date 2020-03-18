//
//  UG_IMAGEView.m
//  UGOCMagicbox
//
//  Created by admin on 2019/12/11.
//  Copyright © 2019 UG. All rights reserved.
//

#import "UGIMAGEView.h"
#import "SDImageCache.h"
@implementation UG_IMAGEView

-(void)setIsround:(BOOL)isround{
    _isround = isround;
    [self setNeedsLayout];
}
-(void)layoutSubviews{
    [super layoutSubviews];
    if (_isround) {
        self.layer.cornerRadius = CGRectGetWidth(self.bounds)/2;
        self.layer.masksToBounds = YES;
    }
}
- (void)ug_setImageWithURL:(nullable NSURL *)url
placeholderImage:(nullable UIImage *)placeholder
                      size:(CGSize)size
         options:(SDWebImageOptions)options
        progress:(nullable SDWebImageDownloaderProgressBlock)progressBlock
                 completed:(nullable SDExternalCompletionBlock)completedBlock{
    
    SDImageCache *cache = [SDImageCache sharedImageCache];
   
    NSString *fix = [NSString stringWithFormat:@"?width=%.0f&height=%.0f",size.width,size.height];
    NSString *key = [[SDWebImageManager sharedManager] cacheKeyForURL:url];
    key = [NSString stringWithFormat:@"%@%@",key,fix];
    //从缓存中获取图片
    UIImage *image = [cache imageFromCacheForKey:key];
    if (!image) {
        [[SDWebImageManager sharedManager] loadImageWithURL:url options:options progress:progressBlock completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
            UIImage * cacheimag = [image ug_reSize:size];
            [cache storeImage:cacheimag forKey:key completion:nil];
            [self setImage:cacheimag];
        }];
    }
}
@end
