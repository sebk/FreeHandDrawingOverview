//
//  SmoothLineViewBuffer.h
//  FreeHandDrawing
//
//  Created by Sebastian Kruschwitz on 28.09.12.
//
//

#import <UIKit/UIKit.h>
#import "PaintSuperview.h"

@interface SmoothLineViewBuffer : PaintSuperview {
@private
    CGPoint currentPoint;
    CGPoint previousPoint1;
    CGPoint previousPoint2;
    
    CGContextRef offScreenBuffer;
}



-(void)initNewBuffer;

-(void)erase;

@end
