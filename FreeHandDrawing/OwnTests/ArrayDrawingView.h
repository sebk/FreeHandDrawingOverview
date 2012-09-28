//
//  ArrayDrawingView.h
//  FreeHandDrawing
//
//  Created by Sebastian Kruschwitz on 28.09.12.
//
//

#import <UIKit/UIKit.h>

@interface ArrayDrawingView : UIView {
    UIBezierPath *currentPath;
    NSMutableDictionary *currentDict;
    NSMutableArray *pathArray;
}

@property(nonatomic, strong) UIColor *currentColor;

@end
