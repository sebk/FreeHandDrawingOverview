//
//  PaintSuperview.h
//  FreeHandDrawing
//
//  Created by Sebastian Kruschwitz on 9/28/12.
//
//

#import <UIKit/UIKit.h>

#define DEFAULT_COLOR [UIColor blackColor]
#define DEFAULT_WIDTH 10.0f

//A view to set some attributes and/or methods for all Views that are used for drawing
@interface PaintSuperview : UIView

@property (nonatomic, readwrite) CGFloat lineWidth;
@property (nonatomic, retain) UIColor *lineColor;

@end
