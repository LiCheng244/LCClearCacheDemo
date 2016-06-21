//
//  ViewController.m
//  ClearCacheDemo
//
//  Created by LiCheng on 16/6/2.
//  Copyright © 2016年 Li_Cheng. All rights reserved.
//


#import "ViewController.h"
#import "ClearCacheTool.h"
#define filePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *cacheSizeL;

@end

@implementation ViewController

/**
 *
 */
/**
*  
*/

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *cacheSize = [ClearCacheTool getCacheSizeWithFilePath:filePath];
    self.cacheSizeL.text = cacheSize;
    
}
- (IBAction)clearCacheClick:(id)sender {
    
    BOOL isClearSuccess = [ClearCacheTool clearCacheWithFilePath:filePath];
    
    if (isClearSuccess) {
        NSLog(@"清除成功");
        NSString *cacheSize = [ClearCacheTool getCacheSizeWithFilePath:filePath];
        self.cacheSizeL.text = cacheSize;
    }else{
        NSLog(@"清除失败");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
