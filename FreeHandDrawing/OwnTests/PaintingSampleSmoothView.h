//
//  PaintingSampleSmoothView.h
//  FreeHandDrawing
//
//  Created by Sean Christmann on 10/7/11.
//  Project PaintingSampleSmooth
//

#import <UIKit/UIKit.h>
#import "PaintSuperview.h"

@interface PaintingSampleSmoothView : PaintSuperview {
    void *cacheBitmap;
    float hue;
    
    CGPoint point0;
    CGPoint point1;
    CGPoint point2;
    CGPoint point3;
}

@property(nonatomic, readwrite) CGContextRef cacheContext;



- (BOOL) initContext:(CGSize)size;
- (void) drawToCache;

@end
