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


