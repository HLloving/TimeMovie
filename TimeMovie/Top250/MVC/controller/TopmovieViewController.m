//
//  TopmovieViewController.m
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/25.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import "TopmovieViewController.h"
#import "TopMovieTableViewCell.h"
#import "Topmovie.h"
#import "HeadView.h"
#import <MediaPlayer/MediaPlayer.h>

@interface TopmovieViewController ()
{
    UILabel *_titlelable;
    UITableView *_tableView;
    NSMutableArray *_topData;
    
    BOOL isShow;
}
@end

@implementation TopmovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"电影详情";
    [self creatview];
    [self loadData];

    // Do any additional setup after loading the view.
}
-(void)loadData{
    
    NSDictionary *dic=[MovieJson loadData:@"movie_comment"];
    NSArray *array=dic[@"list"];
    _topData=[[NSMutableArray alloc]init];
    for (NSDictionary *dictonary in array) {
        Topmovie *top=[[Topmovie alloc]initContentWithDic:dictonary];
        [_topData addObject:top];
        
    }
    
    
    
    
    
}
-(void)creatview{

    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];



}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   Topmovie *topMovie=_topData[indexPath.row];
    
    if (topMovie.isShow==YES) {
        
        NSString *str=topMovie.content;
        CGSize maxSize=CGSizeMake(kScreenWidth-80, 0);
        NSDictionary *attributes=@{NSFontAttributeName:[UIFont systemFontOfSize:17]};
        CGRect rect=[str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
        return rect.size.height+150;
    }
    else{
    return 100;
    
    }
    

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _topData.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TopMovieTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"mycell"];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"TopMovieTableViewCell" owner:self options:nil]lastObject];
    }
    cell.topMovie=_topData[indexPath.row];

    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    HeadView *headView=[[[NSBundle mainBundle]loadNibNamed:@"HeadView" owner:nil options:nil]lastObject];
    NSMutableDictionary *movieDetail=[MovieJson loadData:@"movie_detail"];
    headView .movieName.text=movieDetail[@"titleCn"];
    NSString *str=[[NSString alloc]init];
    NSArray *type=movieDetail[@"type"];
    for (int i=0; i<type.count; i++) {
        str=[NSString stringWithFormat:@"类型：%@ %@ ",str,type[i]];
        
    }
    headView.movieType.text=str;
    NSString *str2=[[NSString alloc]init];
    NSArray *directors=movieDetail[@"directors"];
    for (int i=0; i<directors.count; i++) {
        str2=[NSString stringWithFormat:@"导演：%@  ",directors[i]];
        
        
    }
    headView.director.text=str2;
    NSString *str3=[[NSString alloc]init];
    NSArray *actors=movieDetail[@"actors"];
    for (int i=0; i<actors.count; i++) {
        str3=[NSString stringWithFormat:@"演员：%@ %@",str3,actors[i]];
        
        
    }
    headView.actor.text=str3;
    
    
    headView.year.text=movieDetail[@"year"];
    NSString *imageStr=movieDetail[@"image"];
    [headView.movieImage sd_setImageWithURL:[NSURL URLWithString:imageStr]];
    
    NSArray *images=movieDetail[@"images"];
    for (int i=0; i<images.count; i++) {
        NSString *uring=images[i];
        NSURL *url=[NSURL URLWithString:uring];
        UIImageView *imagesView=[[UIImageView alloc]initWithFrame:CGRectMake(0+i*65, 10, 60, 70)];
        [imagesView sd_setImageWithURL:url];
        headView.scorll.contentSize=CGSizeMake(400, 80);
        [headView.scorll addSubview:imagesView];
        
        
        UIButton *button=[[UIButton alloc]initWithFrame:headView.movieImage.bounds];
        headView.movieImage.userInteractionEnabled=YES;
        [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
        [headView.movieImage addSubview:button];
        
    }
   

    return headView;

}
-(void)buttonAction{
    MPMoviePlayerViewController *player=[[MPMoviePlayerViewController alloc]initWithContentURL:[NSURL URLWithString:@"http://vf1.mtime.cn/Video/2012/04/23/mp4/120423212602431929.mp4"]];
    [self.navigationController pushViewController:player animated:YES ];


}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{




    return 183;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Topmovie *top=_topData[indexPath.row];
 top.isShow=!top.isShow;
    [_tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];


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
