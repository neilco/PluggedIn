//
//  PluggedInAppDelegate.h
//  PluggedIn
//
//  Created by Neil on 28/07/2009.
//  Copyright 2009 Neil Cowburn. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PluggedInViewController;

@interface PluggedInAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    PluggedInViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet PluggedInViewController *viewController;

@end

