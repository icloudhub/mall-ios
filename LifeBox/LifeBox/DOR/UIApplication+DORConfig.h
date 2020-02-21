//
//  UIApplication+DORConfig.h
//  LifeBox
//
//  Created by admin on 2019/8/11.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>
#ifdef DEBUG
#import <DoraemonKit/DoraemonPluginProtocol.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (DORConfig)

-(void)configDor;

@end



@interface DorAlert : NSObject<DoraemonPluginProtocol>
@end

@interface DorSwagger : NSObject<DoraemonPluginProtocol>
@end
@interface DorSearchSwagger : NSObject<DoraemonPluginProtocol>
@end
@interface DorLoginViewController : NSObject<DoraemonPluginProtocol>
@end
@interface DorRegisterViewController : NSObject<DoraemonPluginProtocol>
@end

@interface DorGoodsDefViewController : NSObject<DoraemonPluginProtocol>
@end
@interface DorConfigController : NSObject<DoraemonPluginProtocol>
@end

@interface DorConfigServiceproVC : NSObject<DoraemonPluginProtocol>
@end

@interface DorGoodsClassesVC : NSObject<DoraemonPluginProtocol>
@end


NS_ASSUME_NONNULL_END
#endif
