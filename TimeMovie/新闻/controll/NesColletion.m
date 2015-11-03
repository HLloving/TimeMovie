//
//  NesColletion.m
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/23.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import "NesColletion.h"
#import "NewsImage.h"
#import "BaseTabBarController.h"
#import "NewsimageViewController.h"

@interface NesColletion ()
{

    NSMutableArray *array;
    NSMutableArray *_imagearray;


}
@end

@implementation NesColletion

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"图片";
    [self creatview];
    [self loadData];
    BaseTabBarController *base=[[BaseTabBarController alloc]init];
    base.downview.frame=CGRectMake(0, 0, 0, 0);
//    self.tabBarController.tabBar.frame=CGRectMake(0, 0, 0, 0);
    // Do any additional setup after loading the view.
}
-(void)loadData{

    NSMutableArray *data=[MovieJson loadData:@"image_list副本"];
    array=[[NSMutableArray alloc]init];
    _imagearray=[[NSMutableArray alloc]init];
    for (NSMutableDictionary *dic in data) {
        NewsImage *newimage=[[NewsImage alloc]initContentWithDic:dic];
        [_imagearray addObject:dic[@"image"]];
        [array addObject:newimage];
    }

}
-(void)creatview{
    UICollectionViewFlowLayout *flowlayout=[[UICollectionViewFlowLayout alloc]init];
    flowlayout.minimumInteritemSpacing=5;
    flowlayout.minimumLineSpacing=10;
    CGFloat a=(kScreenWidth-10*5)/5;
    flowlayout.itemSize=CGSizeMake(a, a);
//    flowlayout.estimatedItemSize=UIEdgeInsetsMake(10, 10, 10, 10);

    UICollectionView *collection=[[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowlayout];
    
    collection.dataSource=self;
    collection.delegate=self;
    [collection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:collection];
    
    
    
    


}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{


    return array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    NewsImage *news=array[indexPath.item];
    NSString *urling=news.image;
    NSURL *url=[NSURL URLWithString:urling];
    UIImageView *imageview=[[UIImageView alloc]initWithFrame:cell.bounds];
    [imageview sd_setImageWithURL:url];
    [cell.contentView addSubview:imageview];
    cell.layer.borderColor=[UIColor purpleColor].CGColor;
    cell.layer.borderWidth=3;
    cell.layer.cornerRadius=10;
    cell.layer.masksToBounds=YES;
    return cell;


}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    NewsimageViewController *new=[[NewsimageViewController alloc]init];
//    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:new];
    new.index=indexPath;
    new.array=_imagearray;
    new.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:new animated:YES ];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
