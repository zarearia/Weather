//
// Created by Aria Zare on 5/18/20.
// Copyright (c) 2020 ariazare. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface WeatherConditionView : UIStackView

@property NSString *imageName;
@property NSString *time;
@property NSInteger tempInC;
@property (readonly) NSInteger tempInF;

-(WeatherConditionView *)init: (NSString *)imageName tempInC:(NSInteger)tempInC;
-(WeatherConditionView *)initWithTime: (NSString *)imageName tempInC:(NSInteger)tempInC time:(NSString *)time;

@end