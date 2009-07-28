//
//  PluggedInAppDelegate.m
//  PluggedIn
//
//  Created by Neil on 28/07/2009.
//  Copyright 2009 Neil Cowburn. All rights reserved.
//

#import "PluggedInAppDelegate.h"
#import "PluggedInViewController.h"

@implementation PluggedInAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
