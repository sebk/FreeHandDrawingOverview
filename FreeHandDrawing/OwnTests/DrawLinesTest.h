//
//  DrawLinesTest.h
//  FreeHandDrawing
//
//  Created by Reetu Raj on 11/05/11.
//  Project "DrawLines"
//
//

#import <UIKit/UIKit.h>
#import "PaintSuperview.h"

@interface DrawLinesTest : PaintSuperview {
    UIBezierPath *myPath;
    
    CGPoint currentPoint;
    CGPoint previousPoint;
}



@end
