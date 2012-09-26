//
//  MyPatternBrush.m
//  DrawLines
//
//  Created by Reetu Raj on 17/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MyPatternBrush.h"


@implementation MyPatternBrush

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

        self.backgroundColor=[UIColor whiteColor];
        myPath=[[UIBezierPath alloc]init];
        myPath.lineWidth=10;
        brushPattern=[[UIColor alloc]initWithPatternImage:[UIImage imageNamed:@"pattern.jpg"]]; //[UIColor colorWithPatternImage:];

    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [brushPattern setStroke];
    [myPath strokeWithBlendMode:kCGBlendModeNormal alpha:1.0];
    
    // Drawing code
    //[myPath stroke];
}

#pragma mark - Touch Methods
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *mytouch=[[touches allObjects] objectAtIndex:0];
    [myPath moveToPoint:[mytouch locationInView:self]];
    
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *mytouch=[[touches allObjects] objectAtIndex:0];
    [myPath addLineToPoint:[mytouch locationInView:self]];
   
    [self setNeedsDisplay];
    
    
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{

    
}

- (void)dealloc
{
    [brushPattern release];
    [super dealloc];
}

@end
