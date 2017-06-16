//
//  WavyFlowLayout.m
//  WavyCollectionView
//
//  Created by Noor Alhoussari on 2017-06-15.
//  Copyright © 2017 Noor Alhoussari. All rights reserved.
//

#import "WavyFlowLayout.h"

@interface WavyFlowLayout ()

@property (nonatomic, strong) NSArray *layoutAttributes;

//@property UICollectionViewScrollDirection scrollDirection;
//@property CGSize itemSize;
//@property CGFloat minimumInteritemSpacing;

@end

@implementation WavyFlowLayout

- (void) prepareLayout{
    
    self.minimumInteritemSpacing = CGFLOAT_MAX;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.itemSize = CGSizeMake(100, 50);

}

//method that allows you to specify attributes for cells and views that are in the specified rectangle.
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    //Need to copy attres from super to avoid cashed frame mismatch
    NSArray <UICollectionViewLayoutAttributes *> *superAttrs = [super layoutAttributesForElementsInRect:rect];
    
    NSMutableArray<UICollectionViewLayoutAttributes *> *newAttrs = [[NSMutableArray alloc] init];
    
    for(UICollectionViewLayoutAttributes *attributes in superAttrs){
        if (CGRectIntersectsRect(attributes.frame, rect) == YES){
            
            int randomY = arc4random_uniform(self.collectionView.bounds.size.height);
            CGFloat y = randomY;
            attributes.frame = CGRectMake(attributes.frame.origin.x, y, attributes.frame.size.width, attributes.frame.size.height);
            [newAttrs addObject: attributes];

        }
    }
    return newAttrs;
}

@end
