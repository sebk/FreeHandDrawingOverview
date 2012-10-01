//
//  SmoothLineViewBuffer.m
//  FreeHandDrawing
//
//  Created by Sebastian Kruschwitz on 28.09.12.
//
//

#import "SmoothLineViewBuffer.h"


@interface SmoothLineViewBuffer ()

CGPoint midPoint(CGPoint p1, CGPoint p2);

@end


@implementation SmoothLineViewBuffer

static const CGFloat kPointMinDistance = 5;
static const CGFloat kPointMinDistanceSquared = kPointMinDistance * kPointMinDistance;

/*
- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        self.lineWidth = DEFAULT_WIDTH;
        self.lineColor = DEFAULT_COLOR;
        
        offScreenBuffer = [self setupBuffer];
        _path = CGPathCreateMutable();
    }
    
    return self;
}
 */

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.lineWidth = DEFAULT_WIDTH;
        self.lineColor = DEFAULT_COLOR;
        
        offScreenBuffer = [self setupBuffer];
        _path = CGPathCreateMutable();
        
    }
    
    return self;
}


-(void)initNewBuffer {
    CGImageRef cgImage = CGBitmapContextCreateImage(offScreenBuffer);
    CGContextRelease(offScreenBuffer);
    offScreenBuffer = [self setupBuffer];
    CGContextDrawImage(offScreenBuffer, self.bounds, cgImage);
    [self setNeedsDisplay];
}

-(CGContextRef)setupBuffer {
    CGSize size = self.bounds.size;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, size.width, size.height, 8, size.width*4, colorSpace, kCGImageAlphaPremultipliedLast);
    CGColorSpaceRelease(colorSpace);
    
    CGContextTranslateCTM(context, 0, size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    return context;
}



CGPoint middlePoint(CGPoint p1, CGPoint p2) {
    return CGPointMake((p1.x + p2.x) * 0.5, (p1.y + p2.y) * 0.5);
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    
    previousPoint1 = [touch previousLocationInView:self];
    previousPoint2 = [touch previousLocationInView:self];
    currentPoint = [touch locationInView:self];
    
    [self touchesMoved:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    
    CGPoint point = [touch locationInView:self];
    /* check if the point is farther than min dist from previous */
    CGFloat dx = point.x - currentPoint.x;
    CGFloat dy = point.y - currentPoint.y;
    if ((dx * dx + dy * dy) < kPointMinDistanceSquared) {
        return;
    }
    
    previousPoint2 = previousPoint1;
    previousPoint1 = [touch previousLocationInView:self];
    currentPoint = [touch locationInView:self];
    
    [self drawToBuffer];
    
}


-(void)drawToBuffer {
    CGContextSetLineCap(offScreenBuffer, kCGLineCapRound);
    CGContextSetLineJoin(offScreenBuffer, kCGLineJoinRound);
    CGContextSetAllowsAntialiasing(offScreenBuffer, true);
    CGContextSetShouldAntialias(offScreenBuffer, true);
    CGContextSetInterpolationQuality(offScreenBuffer, kCGInterpolationHigh); //added from me
    CGContextSetMiterLimit(offScreenBuffer, 2.0);
    CGContextSetLineWidth(offScreenBuffer, self.lineWidth);
    CGContextSetStrokeColorWithColor(offScreenBuffer, self.lineColor.CGColor);
    
    CGPoint mid1 = middlePoint(previousPoint1, previousPoint2);
    CGPoint mid2 = middlePoint(currentPoint, previousPoint1);
    CGContextMoveToPoint(offScreenBuffer, mid1.x, mid1.y);
    CGContextAddQuadCurveToPoint(offScreenBuffer, previousPoint1.x, previousPoint1.y, mid2.x, mid2.y);
    CGContextDrawPath(offScreenBuffer, kCGPathStroke);
    
    
    
    CGPathMoveToPoint(_path, NULL, mid1.x, mid1.y);

    
    
    
    CGRect bounds = CGContextGetClipBoundingBox(offScreenBuffer);
    CGRect drawBox = bounds;
    drawBox.origin.x -= self.lineWidth * 2.0;
    drawBox.origin.y -= self.lineWidth * 2.0;
    drawBox.size.width += self.lineWidth * 4.0;
    drawBox.size.height += self.lineWidth * 4.0;
    
    [self setNeedsDisplayInRect:drawBox];
}

- (void)drawRect:(CGRect)rect {
    //if (rect.size.width == 1024 && rect.size.height == 768) {
    //    NSLog(@"drawRect: %@", NSStringFromCGRect(rect));
    //    rect = CGRectZero;
    //}
    
    [[UIColor whiteColor] set];
    UIRectFill(rect);
    
    CGContextSaveGState(offScreenBuffer);
    
    CGImageRef cgImage = CGBitmapContextCreateImage(offScreenBuffer);
    UIImage *uiImage = [[UIImage alloc]initWithCGImage:cgImage];
    CGImageRelease(cgImage);
    
    [uiImage drawInRect:self.bounds];
    
    CGContextRestoreGState(offScreenBuffer);
}


-(void)erase {
    NSLog(@"erase");
    CGContextClearRect(offScreenBuffer, self.bounds);
    [self setNeedsDisplay];
    
}


@end
