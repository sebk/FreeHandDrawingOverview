//
//  SmoothLineView.h
//  FreeHandDrawing
//
//  Created by Levi Nunnink on 8/15/11.
//  Copyright 2011 culturezoo. All rights reserved.
//  Project Smooth-Line-View
//

#import <UIKit/UIKit.h>

@interface SmoothLineView : UIView {
@private
    CGPoint currentPoint;
    CGPoint previousPoint1;
    CGPoint previousPoint2;
}

@property (nonatomic, retain) UIColor *lineColor;
@property (nonatomic, readwrite) CGFloat lineWidth;
@property (nonatomic, readwrite) CGMutablePathRef path;

@end
