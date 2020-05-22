//
// Created by Aria Zare on 5/19/20.
// Copyright (c) 2020 ariazare. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface AnimatedLabelView : UIView

@property UILabel *label;

-(AnimatedLabelView *)initWithLabel: (UILabel *)label;
-(void)startAnimation;


@end