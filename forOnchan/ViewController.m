//
//  ViewController.m
//  forOnchan
//
//  Created by yoshikik on 2014/11/13.
//  Copyright (c) 2014年 Yoshiki Kawakita. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [button setBackgroundImage:[UIImage imageNamed:@"icon.png"] forState:UIControlStateNormal];
    
    
      CGRect rect1 = [[UIScreen mainScreen] bounds];
      button.frame = CGRectMake(0, 0, 100, 100);
      button.center = CGPointMake(rect1.size.width/2, rect1.size.height/2);
    
    [self playMovie];
   }




- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation) interfaceOrientation duration:(NSTimeInterval)duration
{
    if ((interfaceOrientation == UIInterfaceOrientationLandscapeLeft)
        || (interfaceOrientation == UIInterfaceOrientationLandscapeRight)){
        NSLog(@"現在の画面の向き: 横向き");
        CGRect rect1 = [[UIScreen mainScreen] bounds];
        button.center = CGPointMake(rect1.size.width/2, rect1.size.height/2);
    }else{
        NSLog(@"現在の画面の向き: 縦向き");
        CGRect rect1 = [[UIScreen mainScreen] bounds];
        button.center = CGPointMake(rect1.size.width/2, rect1.size.height/2);
    }
    
}


- (void)playMovie {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"makky" ofType:@"mov"];//この行のファイル名を変更！
    NSURL *url = [NSURL fileURLWithPath:path];
    MPMoviePlayerController *player = [[MPMoviePlayerController alloc] initWithContentURL:url];
    
    
    self.player = player;
    
    // viewに追加
    CGRect rect1 = [[UIScreen mainScreen] bounds];
    [player.view setFrame:CGRectMake(rect1.size.width/2, rect1.size.height/2, 0, 0)];
    [self.view addSubview:player.view];
     NSLog(@"hoge");
 
    
}


-(IBAction)full{
        self.player.fullscreen               = YES;
}


- (void)finishPreload:(NSNotification *)aNotification {
    MPMoviePlayerController *player = [aNotification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMediaPlaybackIsPreparedToPlayDidChangeNotification
                                                  object:player];
    [player play];
    NSLog(@"hogege");
   
}


- (void)finishPlayback:(NSNotification *)aNotification {
    MPMoviePlayerController *player = [aNotification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:player];
    [player stop];
    //[player release];
    [self playMovie];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
