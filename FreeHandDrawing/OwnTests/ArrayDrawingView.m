//
//  ArrayDrawingView.m
//  FreeHandDrawing
//
//  Created by Sebastian Kruschwitz on 28.09.12.
//
//

#import "ArrayDrawingView.h"

@implementation ArrayDrawingView

static const CGFloat kPointMinDistance = 5;
static const CGFloat kPointMinDistanceSquared = kPointMinDistance * kPointMinDistance;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        pathArray = [NSMutableArray array];
        self.lineWidth = DEFAULT_WIDTH;
        self.lineColor = DEFAULT_COLOR;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesBegan");
    
    UIBezierPath *myPath = [[UIBezierPath alloc] init];
    myPath.lineWidth = self.lineWidth;
    myPath.lineCapStyle = kCGLineCapRound;
    myPath.lineJoinStyle = kCGLineJoinRound;
    myPath.miterLimit = 0;
    
    //CGPoint touchPoint = [[touches anyObject] locationInView:self];
    UITouch *myTouch = [[touches allObjects]objectAtIndex:0];
    [myPath moveToPoint:[myTouch locationInView:self]];
    //[myPath addLineToPoint:CGPointMake(touchPoint.x+1, touchPoint.y+1)];
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setObject:myPath forKey:@"Path"];
    [dict setObject:self.lineColor forKey:@"Colors"];
    [pathArray addObject:dict];
    //[self setNeedsDisplay];
    
    currentPath = myPath;
    currentDict = dict;
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesMoved");
    
    UITouch *myTouch = [[touches allObjects] objectAtIndex:0];
    
    /* check if the point is farther than min dist from previous */
    CGPoint point = [myTouch locationInView:self];
    CGFloat dx = point.x - [myTouch previousLocationInView:self].x;
    CGFloat dy = point.y - [myTouch previousLocationInView:self].y;
    if ((dx * dx + dy * dy) < kPointMinDistanceSquared) {
        return;
    }
    
    CGPoint currentPoint = point;
    CGPoint previousPoint = [myTouch previousLocationInView:self];
    [currentPath addQuadCurveToPoint:point controlPoint:previousPoint];
    
    CGRect dirtyPoint1 = CGRectMake(previousPoint.x-10, previousPoint.y-10, 20, 20);
    CGRect dirtyPoint2 = CGRectMake(currentPoint.x-10, currentPoint.y-10, 20, 20);
    [self setNeedsDisplayInRect:CGRectUnion(dirtyPoint1, dirtyPoint2)];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    //UITouch *touch = [touches anyObject];
    //[currentPath addLineToPoint:[touch locationInView:self]];
    //[self setNeedsDisplay];
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [self touchesEnded:touches withEvent:event];
}

CGPoint getMidPoint(CGPoint p1, CGPoint p2) {
    return CGPointMake((p1.x + p2.x) * 0.5, (p1.y + p2.y) * 0.5);
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    for (NSMutableDictionary *dict in pathArray) {
        UIBezierPath *path = [dict objectForKey:@"Path"];
        UIColor *color = [dict objectForKey:@"Colors"];
        [color setStroke];
        [path stroke];
    }
}


@end
