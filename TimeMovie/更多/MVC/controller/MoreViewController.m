//
//  MoreViewController.m
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/19.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()
{
    UILabel *_titlelable;
}
@property (strong, nonatomic) IBOutlet UILabel *sizeLable;
@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"更多";
    _titlelable=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 44)];
    _titlelable.text=self.title;
    _titlelable.textColor=[UIColor whiteColor];
    _titlelable.font=[UIFont systemFontOfSize:20];
    _titlelable.textAlignment=NSTextAlignmentCenter;
    self.navigationItem.titleView=_titlelable;
    
    
    // Do any additional setup after loading the view.
}
-(void)viewDidAppear:(BOOL)animated{

  _sizeLable.text=[NSString stringWithFormat:@"%.2fMB",[self countCacheFileSize]];

}

/**
 *  计算当前应用程序缓存文件的大小之和
 *
 *  @return 文件大小
 */

-(CGFloat)countCacheFileSize{
   //沙盒路径
    NSString *homepath=NSHomeDirectory();
   
    NSArray *pathArray=@[@"/tmp/MediaCache",@"/Library/Caches/com.hackemist.SDWebImageCache.default"];
    
    CGFloat fileSize=0;
    
    //拼接路径
    for (NSString *string in pathArray) {
        
        NSString *filePath=[NSString stringWithFormat:@"%@%@",homepath,string];
        
        //获取文件大小
        fileSize +=[self getFileSize:filePath];
        
    }
    
    return fileSize;

}
/**
 *  根据传入的路径 计算此路径下的文件大小
 *
 *  @param filePath 文件路径
 *
 *  @return 此文件夹下所有文件的总大小  单位MB
 */
-(CGFloat)getFileSize:(NSString *)filePath{
    
    //文件管理器对象 单例
    NSFileManager *manager=[NSFileManager defaultManager];
    
    // 数组 储存文件夹中所有的子文件夹以及文件的名字
    NSArray *fileNames=[manager subpathsAtPath:filePath];
    
    //数值过大需要设置long long型
    long long size=0;
    
    //遍历文件夹
    for (NSString *fileName in fileNames) {
        
        //拼接获取路径
        NSString *subFilePath=[NSString stringWithFormat:@"%@/%@",filePath,fileName];
        
        //获取文件信息
        NSDictionary *dic=[manager attributesOfItemAtPath:subFilePath error:nil];
        
        //获取单个文件的大小
        NSNumber *sizeNumber=dic[NSFileSize];
        
        // 使用一个 long long类型来储存文件大小
        long long subFileSize=[sizeNumber longLongValue];
        
         // 文件大小求和
        size +=subFileSize;
        
    }
    
    return size/1024.0/1024.0;

}
-(void)removePath{
    
    NSString *homepath=NSHomeDirectory();
    
    NSArray *pathArray=@[@"/tmp/MediaCache",@"/Library/Caches/com.hackemist.SDWebImageCache.default"];
   
    
    
    for (NSString *string in pathArray) {
        
        NSString *filePath=[NSString stringWithFormat:@"%@%@",homepath,string];
        
        //文件管理对象
        NSFileManager *manager=[NSFileManager defaultManager];
        NSArray *fileNames=[manager subpathsAtPath:filePath];
        
        //遍历文件夹
        for (NSString *fileName in fileNames) {
            
            //拼接文件路径
            NSString *subFilePath=[NSString stringWithFormat:@"%@/%@",filePath,fileName];
            
            //删除路径
            [manager removeItemAtPath:subFilePath error:nil];
            
            
        }
        
    }
  _sizeLable.text=@"清理中";
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        _sizeLable.text=[NSString stringWithFormat:@"%.2fMB",[self countCacheFileSize]];
    });
    

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"警告" message:@"是否清理缓存" delegate:self cancelButtonTitle:@"否" otherButtonTitles:@"是", nil];
        [alert show];
    }



}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

    if (buttonIndex==1) {
        [self removePath];
        NSLog(@"%ld",buttonIndex);
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
