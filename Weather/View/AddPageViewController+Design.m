//
// Created by Aria Zare on 5/31/20.
// Copyright (c) 2020 ariazare. All rights reserved.
//

#import "AddPageViewController+Design.h"


@implementation AddPageViewController (Design)

- (void)design {

    /*MARK: Search TextField*/
    /*************************************************************************/
    self.view.backgroundColor = [UIColor whiteColor];
    self.searchTextField = [[UISearchTextField alloc] init];
    self.searchTextField.translatesAutoresizingMaskIntoConstraints = NO;
    [self.searchTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.view addSubview:self.searchTextField];

    /*exp: constraints*/
    /*****************************/
    NSLayoutConstraint *searchTextFieldToViewTop = [NSLayoutConstraint constraintWithItem:self.searchTextField
                                                                       attribute:NSLayoutAttributeTop
                                                                       relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.view
                                                                       attribute:NSLayoutAttributeTopMargin
                                                                       multiplier:1
                                                                       constant:0];

    NSLayoutConstraint *searchTextFieldToViewLeading = [NSLayoutConstraint constraintWithItem:self.searchTextField
                                                                           attribute:NSLayoutAttributeLeading
                                                                           relatedBy:NSLayoutRelationEqual
                                                                           toItem:self.view
                                                                           attribute:NSLayoutAttributeLeadingMargin
                                                                           multiplier:1
                                                                           constant:0];

    NSLayoutConstraint *searchTextFieldToViewTrailing = [NSLayoutConstraint constraintWithItem:self.searchTextField
                                                                            attribute:NSLayoutAttributeTrailing
                                                                            relatedBy:NSLayoutRelationEqual
                                                                            toItem:self.view
                                                                            attribute:NSLayoutAttributeTrailingMargin
                                                                            multiplier:1
                                                                            constant:0];

    NSLayoutConstraint *searchTextFieldToViewBottom = [NSLayoutConstraint constraintWithItem:self.searchTextField
                                                                          attribute:NSLayoutAttributeBottom
                                                                          relatedBy:NSLayoutRelationEqual
                                                                          toItem:self.view
                                                                          attribute:NSLayoutAttributeTopMargin
                                                                          multiplier:1
                                                                          constant:50];

    [self.view addConstraints:@[searchTextFieldToViewTop, searchTextFieldToViewLeading, searchTextFieldToViewTrailing,
            searchTextFieldToViewBottom]];

}

@end