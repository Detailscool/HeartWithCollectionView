//
//  FlowLayout.m
//  CircleWithCollectionView
//
//  Created by Detailscool on 16/1/8.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

#import "FlowLayout.h"

@implementation FlowLayout


- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    [super layoutAttributesForElementsInRect:rect];
    
    NSMutableArray * mtbArr = [NSMutableArray array];
    
    for (int i = 0; i < [self.collectionView numberOfItemsInSection:0]; i++) {
        NSIndexPath * idx = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes * attr = [self layoutAttributesForItemAtIndexPath:idx];
        [mtbArr addObject:attr];
    }
    return mtbArr;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{

    [super layoutAttributesForItemAtIndexPath:indexPath];
    
    UICollectionViewLayoutAttributes * attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];

    CGPoint circleCenter = CGPointMake(self.collectionView.frame.size.width*0.5, self.collectionView.frame.size.height*0.5);
    
    CGFloat angle = M_PI * 2 / [self.collectionView numberOfItemsInSection:0];
    
    CGFloat finalAngel = angle * indexPath.item;
    
    //控制心形大小参数
    CGFloat factor = 180;
    
    
    
    // 第一种心形
//        CGFloat viewCenterX = circleCenter.x + factor/2.5 * (2*cos(finalAngel)-cos(2*finalAngel))+50;
//        CGFloat viewCenterY = circleCenter.y + factor/2.5 * (2*sin(finalAngel)-sin(2*finalAngel));
    
    
    
    // 第二种心形
    CGFloat viewCenterX = circleCenter.x + factor*cos(finalAngel);
    CGFloat viewCenterY = self.collectionView.frame.size.height - (circleCenter.y + factor*(sin(finalAngel)+ pow(ABS(cos(finalAngel)), 2/3.0)));
    
    
    
    
    attr.center = CGPointMake(viewCenterX, viewCenterY);
    attr.size = CGSizeMake(50, 50);
    
    return attr;
}
@end
