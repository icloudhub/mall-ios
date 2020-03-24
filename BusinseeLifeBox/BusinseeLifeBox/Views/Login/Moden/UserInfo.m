//
//  UserInfo.m
//  UGOCMagicbox
//
//  Created by MBA on 2019/12/5.
//  Copyright © 2019 UG. All rights reserved.
//

#import "UserInfo.h"
static UserInfo *userinfo = nil;

@implementation UserInfo

+(instancetype)share{
    if (!userinfo) {
        NSDictionary *endinfo = [[NSUserDefaults standardUserDefaults]objectForKey:@"enduserinfo"];

        if (endinfo) {
            UserInfo *temdata = [UserInfo modelWithDictionary:endinfo];
            if (temdata.autoSave) {
                userinfo = temdata;
            }
        }
        if (!userinfo) {
            userinfo = [UserInfo new];
            userinfo.autoSave = YES;
        }

        [[NSNotificationCenter defaultCenter] addObserver:userinfo selector:@selector(applicationDidEnterBackground) name:UIApplicationDidEnterBackgroundNotification  object:nil];
    }
    return userinfo;
}




-(void)clear{
    _name = nil;
    _token = nil;
    _password = nil;
}


-(void)applicationDidEnterBackground{
    
    NSDictionary *dic = [self modelToJSONObject];
    [[NSUserDefaults standardUserDefaults]setObject:dic forKey:@"enduserinfo"];
    
}
@end
