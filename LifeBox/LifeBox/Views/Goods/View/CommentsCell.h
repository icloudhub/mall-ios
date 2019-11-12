//
//  CommentsCell.h
//  LifeBox
//
//  Created by Lucky on 2019/9/26.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface CommentsCell : UITableViewCell

-(void)reloadUI:(ProductCommentModel*)commdata;
@end

NS_ASSUME_NONNULL_END
