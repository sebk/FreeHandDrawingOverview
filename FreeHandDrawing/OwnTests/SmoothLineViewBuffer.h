//
//  SmoothLineViewBuffer.h
//  FreeHandDrawing
//
//  Created by Sebastian Kruschwitz on 28.09.12.
//
//

#import <UIKit/UIKit.h>

@interface SmoothLineViewBuffer : UIView {
@private
    CGPoint currentPoint;
    CGPoint previousPoint1;
    CGPoint previousPoint2;
    
    CGContextRef offScreenBuffer;
}

@property (nonatomic, retain) UIColor *lineColor;
@property (nonatomic, readwrite) CGFloat lineWidth;

-(void)initNewBuffer;

-(void)erase;

@end
