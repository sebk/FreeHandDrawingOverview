//
//  LineSmoothingAppDelegate.h
//  LineSmoothing
//
//  Created by Tony Ngo on 9/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LineSmoothingViewController;

@interface LineSmoothingAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet LineSmoothingViewController *viewController;

@end
