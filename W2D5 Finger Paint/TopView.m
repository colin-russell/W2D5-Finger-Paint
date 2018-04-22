//
//  BottomView.m
//  W2D5 Finger Paint
//
//  Created by Colin on 2018-04-20.
//  Copyright © 2018 Colin Russell. All rights reserved.
//

#import "TopView.h"
#import "LineSegment.h"

@interface TopView()
@property (nonatomic) NSMutableArray <LineSegment *>* line;
@end

@implementation TopView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        _line = [NSMutableArray new];
    }
    return self;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint first = [touch previousLocationInView:self];
    LineSegment *segment = [[LineSegment alloc] initWithFirstPoint:first secondPoint:first];
    [self.line addObject:segment];
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint second = [touch locationInView:self];
    CGPoint first = [touch previousLocationInView:self];
    NSLog(@"%d: %@, %@", __LINE__, NSStringFromCGPoint(first), NSStringFromCGPoint(second));
    LineSegment *segment = [[LineSegment alloc] initWithFirstPoint:first secondPoint:second];
    [self.line addObject:segment];
    [self setNeedsDisplay];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)drawRect:(CGRect)rect {
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineWidth = 5.0;
    path.lineCapStyle = kCGLineCapRound;
    UIColor *color = [self.delegate colorToUse];
    [color setStroke];
    for (LineSegment *segment in self.line) {
        if (CGPointEqualToPoint(segment.firstPoint, segment.secondPoint)) {
            [path moveToPoint:segment.firstPoint];
            continue;
        }
        [path addLineToPoint:segment.firstPoint];
        [path addLineToPoint:segment.secondPoint];
    }
    [path stroke];
}

- (void)clear {
    [self.line removeAllObjects];
    [self setNeedsDisplay];
}



@end
