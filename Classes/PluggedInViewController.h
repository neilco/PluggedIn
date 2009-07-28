//
//  PluggedInViewController.h
//  PluggedIn
//
//  Created by Neil on 28/07/2009.
//  Copyright 2009 Neil Cowburn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PluggedInViewController : UIViewController {
	IBOutlet UIImageView *plugView;
	IBOutlet UILabel *autoLockLabel;
}

@property (nonatomic, retain) UIImageView *plugView;
@property (nonatomic, retain) UILabel *autoLockLabel;

- (void)updateAutoLockState;
- (void)setDisplayPlug:(BOOL)shouldDisplayPlug;

@end

