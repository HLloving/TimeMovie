//
//  NewsimageViewController.m
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/24.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import "NewsimageViewController.h"
#import "NewsimageCollectionViewCell.h"
@interface NewsimageViewController ()
{
    UICollectionView *collectionview;
    BOOL isHidden;
}
@end

@implementation NewsimageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"图片浏览";
    
    
    
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg_all-64"] forBarMetrics:UIBarMetricsDefault];
//    UIButton *leftbutton=[UIButton buttonWithType:UIButtonTypeCustom];
//    leftbutton.frame=CGRectMake(0, 0, 49, 49);
//    [leftbutton setTitle:@"返回" forState:UIControlStateNormal];
//    [leftbutton addTarget:self action:@selector(leftbuttonAction) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *left=[[UIBarButtonItem alloc]initWithCustomView:leftbutton];
//    self.navigationItem.leftBarButtonItem=left;
    
    
    
    [self creatview];
    [collectionview scrollToItemAtIndexPath:_index atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    [[NSNotificationCenter defaultCenter ]addObserver:self selector:@selector(hiddenNavigationBar) name:@"hiddenNavigationBar" object:nil];
    
    
    
    // Do any additional setup after loading the view.
}
-(void)dealloc{

    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
-(void)hiddenNavigationBar{
    isHidden=!isHidden;
    [self.navigationController setNavigationBarHidden:isHidden animated:YES];
    
    UIApplication *app=[UIApplication sharedApplication];
    [app setStatusBarHidden:isHidden withAnimation:UIStatusBarAnimationFade];

}
-(void)leftbuttonAction{

    [self dismissViewControllerAnimated:YES completion:nil];

}
-(void)creatview{
    UICollectionViewFlowLayout *flowlayout=[[UICollectionViewFlowLayout alloc]init];
    flowlayout.minimumInteritemSpacing=10;
    flowlayout.itemSize=CGSizeMake(kScreenWidth-10, kScreenHeight-64) ;
    flowlayout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    flowlayout.sectionInset=UIEdgeInsetsMake(0, 0, 0, 0);
    
   collectionview=[[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowlayout];
    collectionview.showsHorizontalScrollIndicator=NO;
    collectionview.showsVerticalScrollIndicator=NO;
    collectionview .dataSource=self;
    collectionview .delegate=self;
    collectionview .pagingEnabled=YES;
    collectionview.backgroundColor=[UIColor clearColor];

    [collectionview registerClass:[NewsimageCollectionViewCell class] forCellWithReuseIdentifier:@"newcell"];
    
    [self.view addSubview:collectionview];













}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{


    return _array.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
 NewsimageCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"newcell" forIndexPath:indexPath];
    cell.backgroundColor=[UIColor redColor];
    cell.url=_array[indexPath.item];
    cell.backgroundColor=[UIColor clearColor];
   
    
    return cell;

}
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{

    NewsimageCollectionViewCell *newcell=[[NewsimageCollectionViewCell alloc]init];
    newcell=(NewsimageCollectionViewCell *)cell;
    [newcell back];


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
