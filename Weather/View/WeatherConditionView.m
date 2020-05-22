//
// Created by Aria Zare on 5/18/20.
// Copyright (c) 2020 ariazare. All rights reserved.
//

#import "WeatherConditionView.h"

@interface WeatherConditionView()

@property UIImageView *imageView;
@property UILabel *tempLabel;
@property UILabel *timeLabel;

@end

@implementation WeatherConditionView

/*MARK: Initializers*/
/************************************************************************************************/

//TODO: add Farenhite

/*exp: without time*/
-(WeatherConditionView *)init:(NSString *)imageName tempInC:(NSInteger)tempInC
{
    self = [super init];
    if(self) {
        //order is important 1: design Stack, 2: designIconAndTemp
        [self designStack];
        [self designIconAndTemp:imageName temp:tempInC];
        [self labelStyle:_tempLabel fontSize:25];
        [self createImageViewToTempLabelConstraint];
    }
    return self;
}

/*exp: with time*/
-(WeatherConditionView *)initWithTime:(NSString *)imageName tempInC:(NSInteger)tempInC time:(NSString *)time {
    self = [super init];
    if(self) {
        //order is important 1: design Stack, 2: designTime, 3: designIconAndTemp
        [self designStack];
        [self designTime:time];
        [self designIconAndTemp:imageName temp:tempInC];
        [self createConstraints];
    }
    return self;
}

/************************************************************************************************/

/*MARK: Design*/
/************************************************************************************************/
/*exp: Constraints are seperated from the rest*/

-(void)designStack{
    self.alignment = UIStackViewAlignmentCenter;
    self.axis = UILayoutConstraintAxisVertical;
    self.distribution = UIStackViewDistributionFillProportionally;
    self.spacing = 5;
}

-(void)designIconAndTemp:(NSString *)imageName temp:(NSInteger)temp{

    _imageView = [[UIImageView alloc] init];
    _imageView.image = [UIImage imageNamed:imageName];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;

    _tempLabel = [[UILabel alloc] init];
    _tempLabel.text = [NSString stringWithFormat:@"%d", temp];
    [self labelStyle:_tempLabel fontSize:15];
    [self addArrangedSubview:_imageView];
    [self addArrangedSubview:_tempLabel];
}

-(void)designTime: (NSString *)time{
    _timeLabel = [[UILabel alloc] init];
    _timeLabel.text = time;
    [self labelStyle:_timeLabel fontSize:15];
    [self addArrangedSubview:_timeLabel];
}


-(void)createConstraints{

    /*exp: constraints*/
    /****************/
    //TempLabel to timeLabel
    NSLayoutConstraint *tempLabelToTimeLabelHeight = [NSLayoutConstraint constraintWithItem:_tempLabel
                                                                   attribute:NSLayoutAttributeHeight
                                                                   relatedBy:NSLayoutRelationEqual
                                                                   toItem:_timeLabel
                                                                   attribute:NSLayoutAttributeHeight
                                                                   multiplier:1
                                                                   constant:0];

    //ImageView to tempLabel
    NSLayoutConstraint *tempLabelToImageView = [NSLayoutConstraint constraintWithItem:_imageView
                                                                        attribute:NSLayoutAttributeHeight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                        toItem:_timeLabel
                                                                        attribute:NSLayoutAttributeHeight
                                                                        multiplier:2.5
                                                                        constant:0];
    /****************/

    NSArray *constraintsArray = @[tempLabelToTimeLabelHeight, tempLabelToImageView];
    [self addConstraints:constraintsArray];

}

-(void)createImageViewToTempLabelConstraint {
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_imageView
                                            attribute:NSLayoutAttributeHeight
                                            relatedBy:NSLayoutRelationEqual
                                            toItem:_tempLabel
                                            attribute:NSLayoutAttributeHeight
                                            multiplier:1.5
                                            constant:0]];
}

- (void)labelStyle:(UILabel *)label fontSize:(int)fontSize {
    UITraitCollection *traitCollection = [UITraitCollection currentTraitCollection];
    if(traitCollection.horizontalSizeClass == 2){
        fontSize += 10;
    }
    [label setFont:[UIFont fontWithName:@"AppleSDGothicNeo-SemiBold" size:fontSize]];
    label.textColor = [UIColor whiteColor];
}

/************************************************************************************************/

@end

























