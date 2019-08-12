//
//  UIApplication+LOG.m
//  LifeBox
//
//  Created by admin on 2019/8/11.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "UIApplication+LOG.h"



@implementation UIApplication (LOG)

-(void)configlog{
    
    [DDLog addLogger:[DDOSLogger sharedInstance] withLevel:ddLogLevel]; // Uses os_log
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init]; // File Logger
    fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
    [DDLog addLogger:fileLogger withLevel:ddLogLevel];
    
    DDLogVerbose(@"日志初始化成功");
    DDLogDebug(@"Debug");
    DDLogInfo(@"Info");
    DDLogWarn(@"Warn");
    DDLogError(@"Error");
    
}
@end
