//
//  LineSegment.h
//  W2D5 Finger Paint
//
//  Created by Colin on 2018-04-20.
//  Copyright © 2018 Colin Russell. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface LineSegment : NSObject

@property (nonatomic, readonly) CGPoint firstPoint;
@property (nonatomic, readonly) CGPoint secondPoint;
- (instancetype)initWithFirstPoint:(CGPoint)first secondPoint:(CGPoint)second;

@end
