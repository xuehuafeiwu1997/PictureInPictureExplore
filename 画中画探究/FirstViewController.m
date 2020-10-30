//
//  FirstViewController.m
//  画中画探究
//
//  Created by 许明洋 on 2020/10/29.
//使用AVPlayerViewController实现画中画功能

#import "FirstViewController.h"
#import <AVKit/AVKit.h>

@interface FirstViewController ()

@property (nonatomic, strong) AVPlayerViewController *avPlayer;
@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) UIButton *playButton;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if ([AVPictureInPictureController isPictureInPictureSupported]) {
        NSLog(@"该设备支持画中画功能");
        //开启画中画权限
        NSError *error = nil;
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:&error];
        if (error) {
            NSLog(@"请求权限失败的原因为%@",error);
        }
    } else {
        NSLog(@"该设备不支持画中画功能");
    }
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"AVPlayerViewController";
    self.avPlayer.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, 300);
    [self.view addSubview:self.avPlayer.view];
    self.avPlayer.player = self.player;
    self.playButton.frame = CGRectMake((self.view.bounds.size.width - 100) / 2, 320, 100, 50);
    [self.view addSubview:self.playButton];
}

- (AVPlayerViewController *)avPlayer {
    if (_avPlayer) {
        return _avPlayer;
    }
    _avPlayer = [[AVPlayerViewController alloc] init];
    _avPlayer.showsPlaybackControls = YES;
    _avPlayer.allowsPictureInPicturePlayback = YES;
    return _avPlayer;
}

- (AVPlayer *)player {
    if (_player) {
        return _player;
    }
    _player = [[AVPlayer alloc] initWithURL:[NSURL URLWithString:@"https://youku.cdn4-okzy.com/20200618/8130_4b8b9a06/1000k/hls/index.m3u8"]];
    return _player;
}

- (UIButton *)playButton {
    if (_playButton) {
        return _playButton;
    }
    _playButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    [_playButton setTitle:@"播放" forState:UIControlStateNormal];
    [_playButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_playButton addTarget:self action:@selector(playVideo) forControlEvents:UIControlEventTouchUpInside];
    return _playButton;
}

- (void)playVideo {
    NSLog(@"开始播放视频");
    [self.avPlayer.player play];
}


@end
