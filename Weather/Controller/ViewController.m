//
//  ViewController.m
//  Weather
//
//  Created by Aria Zare on 5/11/20.
//  Copyright © 2020 ariazare. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
#import "ViewController+Design.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self design];

    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"cellId"];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;

    self.view.backgroundColor = [UIColor redColor];

    /*Test*/
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setValue:@"duN95xGsAyeiDWRYEFCKDdViSzQPwV2B" forKey:@"apikey"];
    [params setValue:@"Tokyo" forKey:@"q"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager GET:@"http://dataservice.accuweather.com/locations/v1/cities/autocomplete"
             parameters:params
             headers:nil
             progress:nil
             success:^(NSURLSessionTask *task, id responseObject) {
                 NSLog(@"Success");
                 NSLog(@"JSON: %@", responseObject);
             }
             failure:^(NSURLSessionTask *operation, NSError *error) {
                 NSLog(@"failed");
                 NSLog(@"Error: %@", error);
             }];

    NSLog(@"Run");

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];

    [cell design];

    return cell;
}


@end


