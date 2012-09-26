//
//  MyLineDrawingView.h
//  DrawLines
//
//  Created by Reetu Raj on 11/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MyLineDrawingView : UIView {
 
    NSMutableArray *pathArray;
    NSMutableArray *bufferArray;
    UIBezierPath *myPath;

}
@property(nonatomic,assign) NSInteger undoSteps;

-(void)undoButtonClicked;
-(void)redoButtonClicked;
@end
