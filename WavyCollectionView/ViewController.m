//
//  ViewController.m
//  WavyCollectionView
//
//  Created by Noor Alhoussari on 2017-06-15.
//  Copyright © 2017 Noor Alhoussari. All rights reserved.
//

#import "ViewController.h"
#import "TextCell.h"
#import "WavyFlowLayout.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:myCell];
    
    WavyFlowLayout *wavyFlowLayout = [[WavyFlowLayout alloc]init];
    [self.collectionView setCollectionViewLayout:wavyFlowLayout];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    TextCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"myCell" forIndexPath:indexPath];
//    cell.cellLabel = (UILabel*)[cell viewWithTag:100];
    cell.cellLabel.text = [NSString stringWithFormat:@"cell %ld", (long)indexPath.item];
    
    return cell;
}


@end
