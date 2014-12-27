//
//  ViewController.h
//  forOnchan
//
//  Created by yoshikik on 2014/11/13.
//  Copyright (c) 2014年 Yoshiki Kawakita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController : UIViewController
{
    IBOutlet UIButton *button;
    IBOutlet UILabel *label;
}
@property (strong, nonatomic) MPMoviePlayerController *player;
-(IBAction)full;

@end
