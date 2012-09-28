//
//  DrawLinesTest.m
//  FreeHandDrawing
//
//  Created by Sebastian Kruschwitz on 28.09.12.
//
//

#import "DrawLinesTest.h"

#define LINEWIDTH 10

@implementation DrawLinesTest

static const CGFloat kPointMinDistance = 5;
static const CGFloat kPointMinDistanceSquared = kPointMinDistance * kPointMinDistance;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        myPath = [[UIBezierPath alloc]init];
        myPath.lineCapStyle = kCGLineCapRound;
        myPath.lineJoinStyle = kCGLineJoinRound;
        myPath.miterLimit = 0;
        myPath.lineWidth = LINEWIDTH;
        _lineColor = [UIColor blackColor];
        
        
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    if (rect.size.width == 1024 && rect.size.height == 768) {
        NSLog(@"drawRect: %@", NSStringFromCGRect(rect));
        rect = CGRectZero;
    }
    
    CGContextSaveGState(UIGraphicsGetCurrentContext());
    
    [_lineColor setStroke];
    [myPath strokeWithBlendMode:kCGBlendModeNormal alpha:1.0];
    
    CGContextRestoreGState(UIGraphicsGetCurrentContext());
}


#pragma mark - Touch Methods

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *myTouch = [touches anyObject];
    
    previousPoint = [myTouch previousLocationInView:self];
    currentPoint = [myTouch locationInView:self];
    
    [myPath moveToPoint:currentPoint];
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *myTouch = [touches anyObject];
    
    /* check if the point is farther than min dist from previous */
    CGPoint point = [myTouch locationInView:self];
    CGFloat dx = point.x - currentPoint.x;
    CGFloat dy = point.y - currentPoint.y;
    if ((dx * dx + dy * dy) < kPointMinDistanceSquared) {
        return;
    }
    
    previousPoint = [myTouch previousLocationInView:self];
    currentPoint = [myTouch locationInView:self];
    
    [myPath addQuadCurveToPoint:currentPoint controlPoint:previousPoint];
    
    CGRect dirtyPoint1 = CGRectMake(previousPoint.x-10, previousPoint.y-10, 20, 20);
    CGRect dirtyPoint2 = CGRectMake(currentPoint.x-10, currentPoint.y-10, 20, 20);
    [self setNeedsDisplayInRect:CGRectUnion(dirtyPoint1, dirtyPoint2)];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
}


@end
