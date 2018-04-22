//
//  LineSegment.m
//  W2D5 Finger Paint
//
//  Created by Colin on 2018-04-20.
//  Copyright © 2018 Colin Russell. All rights reserved.
//

#import "LineSegment.h"

@implementation LineSegment

- (instancetype)initWithFirstPoint:(CGPoint)first secondPoint:(CGPoint)second;
{
    self = [super init];
    if (self) {
        _firstPoint = first;
        _secondPoint = second;
    }
    return self;
}

@end
