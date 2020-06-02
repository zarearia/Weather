//
// Created by Aria Zare on 5/30/20.
// Copyright (c) 2020 ariazare. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>


@interface Networking : NSObject

+(void)autoCompleteSearch: (NSString *)searchedText
       response: (__strong NSArray **)responseArray;

@end