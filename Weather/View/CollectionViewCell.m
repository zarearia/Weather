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

    //City Name Label
    UILabel *cityNameLabel = [[UILabel alloc] init];
    cityNameLabel.text = @"Copenhagen";
    cityNameLabel.textAlignment = NSTextAlignmentCenter;
    UITraitCollection *traitCollection = [UITraitCollection currentTraitCollection];
    if(traitCollection.horizontalSizeClass == 1) {
        [cityNameLabel setFont:[UIFont fontWithName:@"AppleSDGothicNeo-SemiBold" size:25]];
    } else {
        [cityNameLabel setFont:[UIFont fontWithName:@"AppleSDGothicNeo-SemiBold" size:45]];
    }
    cityNameLabel.textColor = [UIColor whiteColor];
    cityNameLabel.translatesAutoresizingMaskIntoConstraints = NO;

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

    /*exp: constraints -> hourlyForecastStack to view*/
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

    /*exp: constraints -> cityNameLabel*/
    /******************************/
    NSLayoutConstraint *cityNameLabelToViewConstTop = [NSLayoutConstraint constraintWithItem:cityNameLabel
                                                                          attribute:NSLayoutAttributeTop
                                                                          relatedBy:NSLayoutRelationEqual
                                                                          toItem:_view
                                                                          attribute:NSLayoutAttributeTopMargin
                                                                          multiplier:1
                                                                          constant:0];

    NSLayoutConstraint *cityNameLabelToHourlyForecastStackConstBottom = [NSLayoutConstraint constraintWithItem:cityNameLabel
                                                                                            attribute:NSLayoutAttributeBottom
                                                                                            relatedBy:NSLayoutRelationEqual
                                                                                            toItem:hourlyForecastStack
                                                                                            attribute:NSLayoutAttributeTopMargin
                                                                                            multiplier:1
                                                                                            constant:0];

    NSLayoutConstraint *cityNameLabelToViewConstLeading = [NSLayoutConstraint constraintWithItem:cityNameLabel
                                                                              attribute:NSLayoutAttributeLeading
                                                                              relatedBy:NSLayoutRelationEqual
                                                                              toItem:_view
                                                                              attribute:NSLayoutAttributeLeadingMargin
                                                                              multiplier:1
                                                                              constant:0];

    NSLayoutConstraint *cityNameLabelToViewConstTrailing = [NSLayoutConstraint constraintWithItem:cityNameLabel
                                                                               attribute:NSLayoutAttributeTrailing
                                                                               relatedBy:NSLayoutRelationEqual
                                                                               toItem:_view
                                                                               attribute:NSLayoutAttributeTrailingMargin
                                                                               multiplier:1
                                                                               constant:0];
    /******************************/

    [_view addSubview:hourlyForecastStack];
    [_view addSubview:cityNameLabel];
    [_view addConstraints:@[hourlyForecastStackToViewConstLeading, hourlyForecastStackToViewConstTrailing,
            hourlyForecastStackToViewConstHeight, hourlyForecastStackToViewConstBottom, cityNameLabelToViewConstTop,
            cityNameLabelToHourlyForecastStackConstBottom, cityNameLabelToViewConstLeading,
            cityNameLabelToViewConstTrailing]];

    /************************************************************************************************/



    NSArray *viewConstsArray = [[NSArray alloc] initWithArray:@[topViewCons, leadingViewCons, trailingViewCons, bottomViewCons]];

    [self addConstraints:viewConstsArray];

}

@end



















