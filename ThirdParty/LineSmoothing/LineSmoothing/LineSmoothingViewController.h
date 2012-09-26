//
//  LineSmoothingViewController.h
//  LineSmoothing
//
//  Created by Tony Ngo on 9/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LineSmoothingViewController : UIViewController {
    CGPoint previousPoint;
    NSMutableArray *drawnPoints;
    UIImage *cleanImage;
}

@property (nonatomic, readwrite, retain) IBOutlet UIImageView *imageView;

/** Draws a line to an image and returns the resulting image */
- (UIImage *)drawLineFromPoint:(CGPoint)fromPoint toPoint:(CGPoint)toPoint image:(UIImage *)image;

/** Draws a path to an image and returns the resulting image */
- (UIImage *)drawPathWithPoints:(NSArray *)points image:(UIImage *)image;

/** Ramer–Douglas–Peucker algorithm */
- (NSArray *)douglasPeucker:(NSArray *)points epsilon:(float)epsilon;

/** Returns the perpendicular distance from a point to a line */
- (float)perpendicularDistance:(CGPoint)point lineA:(CGPoint)lineA lineB:(CGPoint)lineB;

/** Returns an array of vertices that include interpolated positions. */
- (NSArray *)catmullRomSpline:(NSArray *)points segments:(int)segments;

@end
