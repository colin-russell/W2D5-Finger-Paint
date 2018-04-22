//
//  TopView.h
//  W2D5 Finger Paint
//
//  Created by Colin on 2018-04-20.
//  Copyright © 2018 Colin Russell. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TopViewDelegate <NSObject>

- (UIColor *)colorToUse;

@end

@interface TopView : UIView

@property (nonatomic, weak) id<TopViewDelegate> delegate;

@end
