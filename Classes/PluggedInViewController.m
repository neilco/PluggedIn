//
//  PluggedInViewController.m
//  PluggedIn
//
//  Created by Neil on 28/07/2009.
//  Copyright 2009 Neil Cowburn. All rights reserved.
//

#import "PluggedInViewController.h"
#import "UIDevice+PluggedIn.h"

@implementation PluggedInViewController

@synthesize plugView, autoLockLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
	
	// Register for the UIDeviceBatteryStateDidChanged notifications
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(batteryStateDidChange:)
												 name:UIDeviceBatteryStateDidChangeNotification object:nil];
	
	// Enable battery monitoring so we received the above notification
	[UIDevice currentDevice].batteryMonitoringEnabled = YES;
	
	// Update the UI to reflect the current state of the auto-lock and power connectivity
	[self updateAutoLockState];
	[self setDisplayPlug:[UIDevice isPluggedIn]];
}

- (void)viewDidUnload {
	[UIDevice currentDevice].batteryMonitoringEnabled = NO;
}

- (void)batteryStateDidChange:(NSNotification *)notification {	
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults boolForKey:@"disable_autolock_preference"]) {
		// Toggle the idle time based upon the current power state of the device.
		// If the idle time is disabled, the screen will not dim, nor will it lock. 
		[UIApplication sharedApplication].idleTimerDisabled = [UIDevice isPluggedIn];
		
		// Update the UI to reflect the current state of the auto-lock and power connectivity
		[self updateAutoLockState];		
		[self setDisplayPlug:[UIDevice isPluggedIn]];
	}
}

- (void)updateAutoLockState {
	self.autoLockLabel.text = [UIApplication sharedApplication].isIdleTimerDisabled ? @"Auto-Locked: Disabled" : @"Auto-Lock: Enabled";
}

- (void)setDisplayPlug:(BOOL)shouldDisplayPlug {
	CGRect rect = shouldDisplayPlug ? CGRectMake(73.0, 220.0, 174.0, 240.0) : CGRectMake(73.0, 480.0, 174.0, 240.0); 
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationBeginsFromCurrentState:YES];
	plugView.frame = rect;
	[UIView commitAnimations];
}

@end
