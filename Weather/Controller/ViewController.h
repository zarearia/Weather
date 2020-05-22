//
//  ViewController.h
//  Weather
//
//  Created by Aria Zare on 5/11/20.
//  Copyright © 2020 ariazare. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;

@end
