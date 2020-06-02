//
// Created by Aria Zare on 5/31/20.
// Copyright (c) 2020 ariazare. All rights reserved.
//

#import "AddPageViewController.h"
#import "AddPageViewController+Design.h"
#import "Networking.h"

@interface AddPageViewController()

@property NSArray *citiesArray;

@end


@implementation AddPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self design];

//    *_citiesArray = [[NSArray alloc] init];
    self.searchTextField.delegate = self;

}


/*MARK: SearchTextFields methods*/
/********************************************************************************************/

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"Return pressed, end of editing");

    [[NSNotificationCenter defaultCenter] addObserver:self
                                          selector:@selector(getResponse:)
                                          name:@"AutoCompleteSearchNotification"
                                          object:nil];

    _citiesArray = [[NSArray alloc]init];
    [Networking autoCompleteSearch:textField.text response:&_citiesArray];

    [textField resignFirstResponder];
    return YES;
}
- (void)textFieldDidChangeSelection:(UITextField *)textField {
    NSLog(@"text Changed");
}
/********************************************************************************************/

// Test
- (void)getResponse:(NSNotification *)notification {
    if ([[notification name] isEqualToString:@"AutoCompleteSearchNotification"]){
        NSLog(@"Response from textField: %@", _citiesArray);
        [[NSNotificationCenter defaultCenter] removeObserver:self
                                              name:@"AutoCompleteSearchNotification"
                                              object:nil];
    }
}

@end









































