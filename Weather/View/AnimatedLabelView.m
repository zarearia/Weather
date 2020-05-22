//
// Created by Aria Zare on 5/19/20.
// Copyright (c) 2020 ariazare. All rights reserved.
//

#import "AnimatedLabelView.h"

@interface AnimatedLabelView()

@property (nonatomic, weak) NSLayoutConstraint *labelToSelfLeading;

@end

@implementation AnimatedLabelView

/*MARK: Initializers*/
/************************************************************************************************/

-(AnimatedLabelView *)init {
    self = [super init];
    if(self) {
        _label = [[UILabel alloc] init];

        [self addLabelWithConstraints];
    }
    return self;
}

-(AnimatedLabelView *)initWithLabel:(UILabel *)label {
    self = [super init];
    if(self){
        _label = label;
        [self addLabelWithConstraints];
    }
    return self;
}

/************************************************************************************************/


/*Mark: Adding Label To Self With Constraints*/
/************************************************************************************************/
-(void)addLabelWithConstraints{

    NSLayoutConstraint *labelToSelfTop = [NSLayoutConstraint constraintWithItem:_label
                                                             attribute:NSLayoutAttributeTop
                                                             relatedBy:NSLayoutRelationEqual
                                                             toItem:self
                                                             attribute:NSLayoutAttributeTopMargin
                                                             multiplier:1
                                                             constant:0];

    NSLayoutConstraint *labelToSelfBottom = [NSLayoutConstraint constraintWithItem:_label
                                                                attribute:NSLayoutAttributeBottom
                                                                relatedBy:NSLayoutRelationEqual
                                                                toItem:self
                                                                attribute:NSLayoutAttributeBottomMargin
                                                                multiplier:1
                                                                constant:0];

    _labelToSelfLeading = [NSLayoutConstraint constraintWithItem:_label
                                                                 attribute:NSLayoutAttributeLeading
                                                                 relatedBy:NSLayoutRelationEqual
                                                                 toItem:self
                                                                 attribute:NSLayoutAttributeLeadingMargin
                                                                 multiplier:1
                                                                 constant:0];

    NSLayoutConstraint *labelToSelfTrailing = [NSLayoutConstraint constraintWithItem:_label
                                                                  attribute:NSLayoutAttributeTrailing
                                                                  relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                                  toItem:self
                                                                  attribute:NSLayoutAttributeTrailingMargin
                                                                  multiplier:1
                                                                  constant:0];

    _label.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_label];
    self.clipsToBounds = YES;
    [self addConstraints:@[labelToSelfTop, labelToSelfBottom, _labelToSelfLeading, labelToSelfTrailing]];

}
/************************************************************************************************/

/*TODO: Animation*/
/************************************************************************************************/

-(void)startAnimation {

    [self layoutIfNeeded];
    [_label layoutIfNeeded];

    NSLog(@"%f", self.frame.size.width);
    NSLog(@"%f", _label.frame.size.width);

    CGFloat textUnderlay =  _label.frame.size.width - self.frame.size.width + _label.frame.origin.x;

//    if(textUnderlay >= 0) {
        _labelToSelfLeading.constant = -textUnderlay;
        [self updateConstraints];

        [UIView animateWithDuration:3 animations:^{
            CGRect rect = _label.frame;
            rect.origin.x -= textUnderlay;
            _label.frame = rect;
        } completion:^(BOOL finished){
            CGRect rect = _label.frame;
            rect.origin.x += textUnderlay - 8;
            _label.frame = rect;
        }];
//    }
}

/************************************************************************************************/



@end