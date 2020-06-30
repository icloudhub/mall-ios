//
//  SelectStationVC.h
//  LifeBox
//
//  Created by admin on 2020/6/10.
//  Copyright © 2020 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StationData.h"
NS_ASSUME_NONNULL_BEGIN
typedef void(^SelectStationVCBlock)(StationData *stationData);

@interface SelectStationVC : UIViewController

@property(strong, nonatomic) NSString *shopId;

@property(copy, nonatomic) SelectStationVCBlock selectStationVCBlock;

@property(strong, nonatomic) NSArray *dalaList;

@end

NS_ASSUME_NONNULL_END
