//
// Created by Aria Zare on 5/13/20.
// Copyright (c) 2020 ariazare. All rights reserved.
//

#import "CollectionViewCell.h"
#import "WeatherConditionView.h"
#import "AnimatedLabelView.h"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
                green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
                blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
                alpha:1.0]

@interface CollectionViewCell()

@property (nonatomic, strong) UIView *view;

@end

@implementation CollectionViewCell

-(void)design {

    /*MARK: View Design*/
    /************************************************************************************************/

    /*exp: initiating the view*/
    _view = [[UIView alloc] init];
    _view.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_view];
    _view.backgroundColor = [UIColor redColor];
    _view.backgroundColor = UIColorFromRGB(0x35A7FF);
    _view.layer.cornerRadius = 8;
    _view.layer.masksToBounds = YES;


    /*exp: adding constraints -> view to its cell*/
    NSLayoutConstraint *topViewCons = [NSLayoutConstraint constraintWithItem:_view
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                          toItem:self
                                                          attribute:NSLayoutAttributeTopMargin
                                                          multiplier:1
                                                          constant:-10];

    NSLayoutConstraint *leadingViewCons = [NSLayoutConstraint constraintWithItem:_view
                                                              attribute:NSLayoutAttributeLeading
                                                              relatedBy:NSLayoutRelationEqual
                                                              toItem:self
                                                              attribute:NSLayoutAttributeLeadingMargin
                                                              multiplier:1
                                                              constant:-10];

    NSLayoutConstraint *trailingViewCons = [NSLayoutConstraint constraintWithItem:_view
                                                               attribute:NSLayoutAttributeTrailing
                                                               relatedBy:NSLayoutRelationEqual
                                                               toItem:self
                                                               attribute:NSLayoutAttributeTrailingMargin
                                                               multiplier:1
                                                               constant:10];

    NSLayoutConstraint *bottomViewCons = [NSLayoutConstraint constraintWithItem:_view
                                                             attribute:NSLayoutAttributeBottom
                                                             relatedBy:NSLayoutRelationEqual
                                                             toItem:self
                                                             attribute:NSLayoutAttributeBottomMargin
                                                             multiplier:1
                                                             constant:5];

    /************************************************************************************************/

    /*MARK: SubViews Design*/
    /************************************************************************************************/

    /*exp: Top Half of the design*/

    //View
    UIView *currentWeatherView = [[UIView alloc] init];
    currentWeatherView.translatesAutoresizingMaskIntoConstraints = NO;

    //Stack
    UIStackView *cityAndTimeStack = [[UIStackView alloc] init];
    cityAndTimeStack.translatesAutoresizingMaskIntoConstraints = NO;
    [currentWeatherView addSubview:cityAndTimeStack];
    cityAndTimeStack.alignment = UIStackViewAlignmentLeading;
    cityAndTimeStack.distribution = UIStackViewDistributionFillEqually;
    cityAndTimeStack.axis = UILayoutConstraintAxisVertical;

    //Stack SubViews
    UILabel *cityNameLabel = [[UILabel alloc] init];
    cityNameLabel.text = @"Copenhagen";
    [cityNameLabel setFont:[UIFont fontWithName:@"AppleSDGothicNeo-SemiBold" size:25]];
    cityNameLabel.textColor = [UIColor whiteColor];
    AnimatedLabelView *animatedCityLabel = [[AnimatedLabelView alloc] initWithLabel:cityNameLabel];

    UILabel *timeLabel = [[UILabel alloc] init];
    timeLabel.text = @"9:41 am";
    [timeLabel setFont:[UIFont fontWithName:@"AppleSDGothicNeo-SemiBold" size:19]];
    timeLabel.textColor = [UIColor whiteColor];

    [cityAndTimeStack addArrangedSubview:animatedCityLabel];
    [cityAndTimeStack addArrangedSubview:timeLabel];


    //WeatherConditionView (Views right side)
    WeatherConditionView *currentWeatherConditionView = [[WeatherConditionView alloc] init:@"meteorology"
                                                                             tempInC:0];
    currentWeatherConditionView.translatesAutoresizingMaskIntoConstraints = NO;
    [currentWeatherView addSubview:currentWeatherConditionView];

    /*exp: Bottom Half*/
    /******************************/

    //Stack
    UIStackView *hourlyForecastStack = [[UIStackView alloc] init];
    hourlyForecastStack.alignment = UIStackViewAlignmentFill;
    hourlyForecastStack.axis = UILayoutConstraintAxisHorizontal;
    hourlyForecastStack.distribution = UIStackViewDistributionFillEqually;
    hourlyForecastStack.translatesAutoresizingMaskIntoConstraints = NO;

    //Stack subViews
    WeatherConditionView *nextHourView1 = [[WeatherConditionView alloc] initWithTime:@"meteorology"
                                                                        tempInC:0
                                                                        time:@"12 am"];

    WeatherConditionView *nextHourView2 = [[WeatherConditionView alloc] initWithTime:@"meteorology"
                                                                        tempInC:0
                                                                        time:@"12 am"];

    WeatherConditionView *nextHourView3 = [[WeatherConditionView alloc] initWithTime:@"meteorology"
                                                                        tempInC:0
                                                                        time:@"12 am"];

    [hourlyForecastStack addArrangedSubview:nextHourView1];
    [hourlyForecastStack addArrangedSubview:nextHourView2];
    [hourlyForecastStack addArrangedSubview:nextHourView3];

    /******************************/

    /*exp: constraints -> stack to view*/
    /******************************/

    NSLayoutConstraint *hourlyForecastStackToViewConstLeading = [NSLayoutConstraint constraintWithItem:hourlyForecastStack
                                                                              attribute:NSLayoutAttributeLeading
                                                                              relatedBy:NSLayoutRelationEqual
                                                                              toItem:_view
                                                                              attribute:NSLayoutAttributeLeadingMargin
                                                                              multiplier:1
                                                                              constant:0];

    NSLayoutConstraint *hourlyForecastStackToViewConstTrailing = [NSLayoutConstraint constraintWithItem:hourlyForecastStack
                                                                              attribute:NSLayoutAttributeTrailing
                                                                              relatedBy:NSLayoutRelationEqual
                                                                              toItem:_view
                                                                              attribute:NSLayoutAttributeTrailingMargin
                                                                              multiplier:1
                                                                              constant:0];

    NSLayoutConstraint *hourlyForecastStackToViewConstHeight = [NSLayoutConstraint constraintWithItem:hourlyForecastStack
                                                                              attribute:NSLayoutAttributeHeight
                                                                              relatedBy:NSLayoutRelationEqual
                                                                              toItem:_view
                                                                              attribute:NSLayoutAttributeHeight
                                                                              multiplier:0.4
                                                                              constant:0];

    NSLayoutConstraint *hourlyForecastStackToViewConstBottom = [NSLayoutConstraint constraintWithItem:hourlyForecastStack
                                                                              attribute:NSLayoutAttributeBottom
                                                                              relatedBy:NSLayoutRelationEqual
                                                                              toItem:_view
                                                                              attribute:NSLayoutAttributeBottomMargin
                                                                              multiplier:1
                                                                              constant:5];

    /******************************/

    /*exp: constraints -> currentWeatherView to view and stack*/
    /******************************/

    NSLayoutConstraint *currentWeatherViewToViewTop = [NSLayoutConstraint constraintWithItem:currentWeatherView
                                                                          attribute:NSLayoutAttributeTop
                                                                          relatedBy:NSLayoutRelationEqual
                                                                          toItem:_view
                                                                          attribute:NSLayoutAttributeTopMargin
                                                                          multiplier:1
                                                                          constant:0];

    NSLayoutConstraint *currentWeatherViewToStackBottom = [NSLayoutConstraint constraintWithItem:currentWeatherView
                                                                          attribute:NSLayoutAttributeBottom
                                                                          relatedBy:NSLayoutRelationEqual
                                                                          toItem:hourlyForecastStack
                                                                          attribute:NSLayoutAttributeTopMargin
                                                                          multiplier:1
                                                                          constant:0];

    NSLayoutConstraint *currentWeatherViewToViewLeading = [NSLayoutConstraint constraintWithItem:currentWeatherView
                                                                          attribute:NSLayoutAttributeLeading
                                                                          relatedBy:NSLayoutRelationEqual
                                                                          toItem:_view
                                                                          attribute:NSLayoutAttributeLeadingMargin
                                                                          multiplier:1
                                                                          constant:0];

    NSLayoutConstraint *currentWeatherViewToViewTrainling = [NSLayoutConstraint constraintWithItem:currentWeatherView
                                                                          attribute:NSLayoutAttributeTrailing
                                                                          relatedBy:NSLayoutRelationEqual
                                                                          toItem:_view
                                                                          attribute:NSLayoutAttributeTrailingMargin
                                                                          multiplier:1
                                                                          constant:0];

    /******************************/

    /*exp: constraints -> currentWeatherConditionView to CurrentWeatherView*/
    /******************************/

    NSLayoutConstraint *currentWeatherConditionViewToCurrentWeatherViewTrailing = [NSLayoutConstraint constraintWithItem:currentWeatherConditionView
                                                                                                      attribute:NSLayoutAttributeTrailing
                                                                                                      relatedBy:NSLayoutRelationEqual
                                                                                                      toItem:currentWeatherView
                                                                                                      attribute:NSLayoutAttributeTrailingMargin
                                                                                                      multiplier:1
                                                                                                      constant:0];
    NSLayoutConstraint *currentWeatherConditionViewToCurrentWeatherViewHeight = [NSLayoutConstraint constraintWithItem:currentWeatherConditionView
                                                                                                    attribute:NSLayoutAttributeWidth
                                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                                    toItem:currentWeatherView
                                                                                                    attribute:NSLayoutAttributeWidth
                                                                                                    multiplier:0.3
                                                                                                    constant:0];
    NSLayoutConstraint *currentWeatherConditionViewToCurrentWeatherViewTop = [NSLayoutConstraint constraintWithItem:currentWeatherConditionView
                                                                                                 attribute:NSLayoutAttributeTop
                                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                                 toItem:currentWeatherView
                                                                                                 attribute:NSLayoutAttributeTopMargin
                                                                                                 multiplier:1
                                                                                                 constant:0];
    NSLayoutConstraint *currentWeatherConditionViewToCurrentWeatherViewBottom = [NSLayoutConstraint constraintWithItem:currentWeatherConditionView
                                                                                                    attribute:NSLayoutAttributeBottom
                                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                                    toItem:currentWeatherView
                                                                                                    attribute:NSLayoutAttributeBottomMargin
                                                                                                    multiplier:1
                                                                                                    constant:0];

    /******************************/

    /*exp: constraints -> cityAndTimeStack*/
    /******************************/

    //To CurrentWeatherView
    NSLayoutConstraint *cityAndTimeStackToCurrentWeatherViewLeading = [NSLayoutConstraint constraintWithItem:cityAndTimeStack
                                                                                          attribute:NSLayoutAttributeLeading
                                                                                          relatedBy:NSLayoutRelationEqual
                                                                                          toItem:currentWeatherView
                                                                                          attribute:NSLayoutAttributeLeadingMargin
                                                                                          multiplier:1
                                                                                          constant:0];

    NSLayoutConstraint *cityAndTimeStackToCurrentWeatherViewTop = [NSLayoutConstraint constraintWithItem:cityAndTimeStack
                                                                                      attribute:NSLayoutAttributeTop
                                                                                      relatedBy:NSLayoutRelationEqual
                                                                                      toItem:currentWeatherView
                                                                                      attribute:NSLayoutAttributeTopMargin
                                                                                      multiplier:1
                                                                                      constant:0];

    NSLayoutConstraint *cityAndTimeStackToCurrentWeatherViewBottom = [NSLayoutConstraint constraintWithItem:cityAndTimeStack
                                                                                         attribute:NSLayoutAttributeBottom
                                                                                         relatedBy:NSLayoutRelationEqual
                                                                                         toItem:currentWeatherView
                                                                                         attribute:NSLayoutAttributeBottomMargin
                                                                                         multiplier:1
                                                                                         constant:0];

    //To CurrentWeatherConditionView
    NSLayoutConstraint *cityAndTimeStackToCurrentWeatherConditionViewTrailing = [NSLayoutConstraint constraintWithItem:cityAndTimeStack
                                                                                                    attribute:NSLayoutAttributeTrailing
                                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                                    toItem:currentWeatherConditionView
                                                                                                    attribute:NSLayoutAttributeLeadingMargin
                                                                                                    multiplier:1
                                                                                                    constant:0];

    /******************************/

    /*Mark: Test*/
    NSLayoutConstraint *testConstraint = [NSLayoutConstraint constraintWithItem:animatedCityLabel
                                                             attribute:NSLayoutAttributeHeight
                                                             relatedBy:NSLayoutRelationEqual
                                                             toItem:timeLabel
                                                             attribute:NSLayoutAttributeHeight
                                                             multiplier:1
                                                             constant:0];

    NSLayoutConstraint *testConstraint2 = [NSLayoutConstraint constraintWithItem:animatedCityLabel
                                                             attribute:NSLayoutAttributeTrailing
                                                             relatedBy:NSLayoutRelationEqual
                                                             toItem:cityAndTimeStack
                                                             attribute:NSLayoutAttributeTrailingMargin
                                                             multiplier:1
                                                             constant:0];

    [_view addSubview:hourlyForecastStack];
    [_view addSubview:currentWeatherView];
    [_view addConstraints:@[hourlyForecastStackToViewConstLeading, hourlyForecastStackToViewConstTrailing,
            hourlyForecastStackToViewConstHeight, hourlyForecastStackToViewConstBottom, currentWeatherViewToViewTop,
            currentWeatherViewToStackBottom, currentWeatherViewToViewLeading, currentWeatherViewToViewTrainling,
            currentWeatherConditionViewToCurrentWeatherViewTrailing,
            currentWeatherConditionViewToCurrentWeatherViewHeight, currentWeatherConditionViewToCurrentWeatherViewTop,
            currentWeatherConditionViewToCurrentWeatherViewBottom, cityAndTimeStackToCurrentWeatherViewLeading,
            cityAndTimeStackToCurrentWeatherViewTop, cityAndTimeStackToCurrentWeatherViewBottom,
            cityAndTimeStackToCurrentWeatherConditionViewTrailing, testConstraint, testConstraint2]];

    [animatedCityLabel startAnimation];

    /************************************************************************************************/



    NSArray *viewConstsArray = [[NSArray alloc] initWithArray:@[topViewCons, leadingViewCons, trailingViewCons, bottomViewCons]];

    [self addConstraints:viewConstsArray];

}

@end



















