//
// Created by Aria Zare on 5/30/20.
// Copyright (c) 2020 ariazare. All rights reserved.
//

#import "Networking.h"
#import "NetworkingAPIKey.h"
#import "AddPageViewController.h"

@implementation Networking

+ (void)autoCompleteSearch:(NSString *)searchedText response:(__strong NSArray **)responseArray {
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setValue:[NetworkingAPIKey apiKey] forKey:@"apikey"];
    [params setValue:searchedText forKey:@"q"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    __block NSArray *citiesArray = [[NSArray alloc]init];
    __strong __block NSArray **citiesArrayP = &citiesArray;
    citiesArrayP = responseArray;

    [manager GET:@"http://dataservice.accuweather.com/locations/v1/cities/autocomplete"
             parameters:params
             headers:nil
             progress:nil
             success:^(NSURLSessionTask *task, id responseObject) {
                 *citiesArrayP = responseObject;
                 NSLog(@"Success");
                 [[NSNotificationCenter defaultCenter] postNotificationName:@"AutoCompleteSearchNotification"
                                                       object:self];

             }
             failure:^(NSURLSessionTask *operation, NSError *error) {
                 NSLog(@"failed");
                 NSLog(@"Error: %@", error);

                 /*TODO: Remove NSNotificationCenter here*/

             }];
}

@end