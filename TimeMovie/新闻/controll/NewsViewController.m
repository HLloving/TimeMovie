//
//  NewsViewController.m
//  
//
//  Created by 黄翔宇 on 15/8/19.
//
//

#import "NewsViewController.h"
#import "News.h"
#import "NewsTableViewCell.h"
#import "NesColletion.h"
#import "UIViewExt.h"
#import "Cinema.h"
#import "News_detailViewController.h"
@interface NewsViewController ()
{
    NSMutableArray *array;
    UITableView *_tableview;
    NSArray *a;
    UIImageView *headerimage;
    UIView *view;
    NSMutableArray *_cinemaData;
}
@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"新闻";
    
    [self creattableview];
    [self loadData];
    
   
    
    // Do any additional setup after loading the view.
}
-(void)loadData{
  

    NSMutableArray *data=[MovieJson loadData:@"news_list"];
    array=[[NSMutableArray alloc]init];
    for (NSMutableDictionary *dic in data) {
        News *new=[[News alloc]initContentWithDic:dic];
        [array addObject:new];
     
    }
    
    
    

}

-(void)creattableview{
    _tableview=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableview.dataSource=self;
    _tableview.delegate=self;
    _tableview.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_tableview];
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return array.count-1;


}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier=@"mycell";
    NewsTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"NewsTableViewCell" owner:self options:nil]lastObject];
    }
    cell.backgroundColor=[UIColor clearColor];
    cell.news=array[indexPath.row+1];
    
    int i= [cell.news.type intValue];
    if (i==1) {
        UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 375, 100)];
        
        [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];

    }
    
   
   
    
    
    return cell;



}
-(void)buttonAction{
    



}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 100;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    if (section==0) {
         return 150;
    }

    return 0;

}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 150)];
    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(5, 130,self.view.frame.size.width , 20)];
    News *n=[[News alloc]init];
 
    
    
    
    
    n=array[0];
    lable.text=n.title;
    lable.textColor=[UIColor whiteColor];
    
    
    headerimage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 375, 150)];
    NSString *urling=n.image;
    NSURL *url=[NSURL URLWithString:urling];
    [headerimage sd_setImageWithURL:url];
    [view addSubview:headerimage];
    [headerimage addSubview:lable];
    return view;





}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    News *new=array[indexPath.row+1];
    int i=[new.type intValue];
    if (i==1) {
        NesColletion *new=[[NesColletion alloc]init];
        
        [self.navigationController pushViewController:new animated:YES];
        new.hidesBottomBarWhenPushed=YES;
    }else if (i==0){
    
        News_detailViewController *newsDetail=[[News_detailViewController alloc]init];
        [self.navigationController pushViewController:newsDetail animated:YES];
        newsDetail.hidesBottomBarWhenPushed=YES;
    
    
    
    
    }
    








}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{


    return 110;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat yOffset=scrollView.contentOffset.y+64;
//    CGFloat new=150-yOffset;
//    CGFloat old=150;
//   CGFloat scale=new/old;
    if (yOffset<0) {
//        CGAffineTransform tran=CGAffineTransformMakeScale(scale, scale);
//        headerimage.transform=tran;
//        headerimage.top=yOffset*2;
        headerimage.frame=CGRectMake(yOffset, yOffset*2, 375-yOffset*2, 150-yOffset*2);
       
        
    }
   
    
    




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
