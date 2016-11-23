//
//  AppDelegate.m
//  DWDFPSExample
//
//  Created by dianwoda on 16/11/23.
//  Copyright © 2016年 dianwoda. All rights reserved.
//

#import "AppDelegate.h"
#import "DWDFPSLabel.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    DWDFPSLabel *label = [DWDFPSLabel sharedInstance];
    [self.window addSubview:label];
    return YES;
}



@end
