//
//  ViewController.m
//  CircleWithCollectionView
//
//  Created by Detailscool on 16/1/8.
//  Copyright © 2016年 Detailscool. All rights reserved.
//

#import "ViewController.h"
#import "FlowLayout.h"
#import "UIColor+Hex.h"

@interface ViewController ()<UICollectionViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    FlowLayout * flowLayout = [[FlowLayout alloc]init];
//    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
    
    UICollectionView * collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    [self.view addSubview:collectionView];
    
    flowLayout.itemSize = CGSizeMake(50, 50);
//    flowLayout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
    
    collectionView.backgroundColor = [UIColor whiteColor];
    
    collectionView.dataSource = self;
    
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"circle_cell"];
}

#pragma mark - *****************数据源方法*****************

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"circle_cell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor randomColor];
    
    return cell;

}


@end
