//
// Created by Aria Zare on 5/13/20.
// Copyright (c) 2020 ariazare. All rights reserved.
//

#import "ViewController+Design.h"



@implementation ViewController (Design)

-(void)design {

    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc] init];
    CGFloat width = UIScreen.mainScreen.bounds.size.width / 2 - 30;
    flowLayout.itemSize = CGSizeMake(width, width);
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 20, 0, 20);

    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
}

@end