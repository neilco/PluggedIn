//
//  UIDevice+Power.m
//  PowerTests
//
//  Created by Neil on 28/07/2009.
//  Copyright 2009 Neil Cowburn. All rights reserved.
//

#import "UIDevice+PluggedIn.h"


@implementation UIDevice (Power)

+ (BOOL)isPluggedIn {
	BOOL isPluggedIn = NO;
	BOOL shouldDisableMonitoring = NO;
	
	UIDevice *device = [UIDevice currentDevice];
	
	// If the battery monitoring flag has been set external to this
	// method call, then do not alter it
	if (!device.isBatteryMonitoringEnabled) {
		device.batteryMonitoringEnabled = shouldDisableMonitoring = YES;
	} 
	
	if (device.batteryState == UIDeviceBatteryStateFull || device.batteryState == UIDeviceBatteryStateCharging) {
		isPluggedIn = YES;
	}
	
	// If this method call set the battery monitoring flag, clean up
	if (shouldDisableMonitoring) {
		device.batteryMonitoringEnabled = NO;
	}
	
	return isPluggedIn;
}

@end
