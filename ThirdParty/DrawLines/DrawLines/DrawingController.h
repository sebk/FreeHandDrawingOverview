//
//  DrawingController.h
//  DrawLines
//
//  Created by Reetu Raj on 11/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyLineDrawingView.h"
#import "MyPatternBrush.h"

@interface DrawingController : UIViewController {
    
    IBOutlet UISegmentedControl *segmentBar;
    
}
@property(nonatomic,retain)    IBOutlet UISegmentedControl *segmentBar;
@end
