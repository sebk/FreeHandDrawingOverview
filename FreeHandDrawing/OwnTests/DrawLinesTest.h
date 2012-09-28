//
//  DrawLinesTest.h
//  FreeHandDrawing
//
//  Created by Reetu Raj on 11/05/11.
//  Project "DrawLines"
//
//

#import <UIKit/UIKit.h>

@interface DrawLinesTest : UIView {
    UIBezierPath *myPath;
    
    CGPoint currentPoint;
    CGPoint previousPoint;
}

@property(strong, nonatomic) UIColor *lineColor;

@end
