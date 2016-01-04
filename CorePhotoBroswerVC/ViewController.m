//
//  ViewController.m
//  CorePhotoBroswerVC
//
//  Created by 成林 on 15/5/4.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

#import "ViewController.h"
#import "PhotoBroswerVC.h"


@interface ViewController ()

@property (nonatomic,strong) NSArray *images;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
}

- (IBAction)browserAction:(UIButton *)sender {
    [self networkImageShow:0];
}

/*
 *  展示网络图片
 */
-(void)networkImageShow:(NSUInteger)index{
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    [PhotoBroswerVC show:self type:PhotoBroswerVCTypeZoom index:index photoModelBlock:^NSArray *{
        
        
        NSArray *networkImages=@[
                          @"http://img.pconline.com.cn/images/upload/upc/tx/itbbs/1308/19/c3/24613975_1376859905025.jpg",
                          @"http://img.pconline.com.cn/images/upload/upc/tx/wallpaper/1402/08/c0/31073074_1391823903156.jpg",
                          @"http://img.club.pchome.net/kdsarticle/2014/04/21/6758499a484626476bb30b35d54dd3fb.jpg",
                          @"http://abc.2008php.com/2014_Website_appreciate/2015-01-22/20150122012424.jpg",
                          @"http://www.forestry.gov.cn/uploadfile/lyjj/2011-12/image/2011-12-7-62ac6bb510114530b722abde63979e42.jpg",
                          @"http://img.gzdsw.com/2013/0909/20130909111149224.jpg",
                          @"http://www.deskcar.com/desktop/fengjing/2015329224504/8.jpg",
                          @"http://att2.citysbs.com/hangzhou/2013/10/04/11/2784x1856-110411_15811380855851074_7f985550d0b486f2661b047c0a25bad4.jpg",
                          @"http://abc.2008php.com/2013_Website_appreciate/2013-11-03/20131103232949.jpg"
                          ];
        
        NSMutableArray *modelsM = [NSMutableArray arrayWithCapacity:networkImages.count];
        for (NSUInteger i = 0; i< networkImages.count; i++) {
            PhotoModel *pbModel=[[PhotoModel alloc] init];
            pbModel.mid = i + 1;
            pbModel.image_HD_U = networkImages[i];
            pbModel.sourceImageView = [[UIImageView alloc] init];
            [modelsM addObject:pbModel];
        }
        
        return modelsM;
    }];
}

@end
