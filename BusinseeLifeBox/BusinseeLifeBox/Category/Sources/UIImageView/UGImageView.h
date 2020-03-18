//
//  UG_IMAGEView.h
//  UGOCMagicbox
//
//  Created by admin on 2019/12/11.
//  Copyright © 2019 UG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"
#import "UIView+WebCacheOperation.h"
#import "UIView+WebCache.h"
#import "SDWebImageDownloader.h"

NS_ASSUME_NONNULL_BEGIN

@interface UG_IMAGEView : UIImageView

@property(assign, nonatomic) BOOL isround; //是否是圆


- (void)ug_setImageWithURL:(nullable NSURL *)url
placeholderImage:(nullable UIImage *)placeholder
                      size:(CGSize)size
         options:(SDWebImageOptions)options
        progress:(nullable SDWebImageDownloaderProgressBlock)progressBlock
                 completed:(nullable SDExternalCompletionBlock)completedBlock;
@end

NS_ASSUME_NONNULL_END
