//
//  ArrayDrawingView.h
//  FreeHandDrawing
//
//  Created by Sebastian Kruschwitz on 28.09.12.
//
//

#import <UIKit/UIKit.h>
#import "PaintSuperview.h"

@interface ArrayDrawingView : PaintSuperview {
    UIBezierPath *currentPath;
    NSMutableDictionary *currentDict;
    NSMutableArray *pathArray;
}


@end
