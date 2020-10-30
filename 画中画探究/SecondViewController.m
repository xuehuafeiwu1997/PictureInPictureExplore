//
//  SecondViewController.m
//  画中画探究
//
//  Created by 许明洋 on 2020/10/30.
//

#import "SecondViewController.h"
#import <AVKit/AVKit.h>
#import "PlayerView.h"

@interface SecondViewController ()

@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) PlayerView *playerView;
@property (nonatomic, strong) UIButton *playButton;
@property (nonatomic, strong) UIButton *pauseButton;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"AVPlayerLayer播放视频实现画中画功能";
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.playerView];
    self.playButton.frame = CGRectMake((self.view.bounds.size.width - 100) / 2, 320, 100, 50);
    [self.view addSubview:self.playButton];
    self.pauseButton.frame = CGRectMake((self.view.bounds.size.width - 100) / 2, 400, 100, 50);
    [self.view addSubview:self.pauseButton];
}

- (void)playVideo {
    NSLog(@"点击开始播放视频");
    [self.playerView.player play];
}

- (void)pauseVideo {
    NSLog(@"暂停播放视频");
    [self.playerView.player pause];
}

- (AVPlayer *)player {
    if (_player) {
        return _player;
    }
    _player = [[AVPlayer alloc] initWithURL:[NSURL URLWithString:@"https://youku.cdn4-okzy.com/20200618/8130_4b8b9a06/1000k/hls/index.m3u8"]];
    return _player;
}

- (PlayerView *)playerView {
    if (_playerView) {
        return _playerView;
    }
    _playerView = [[PlayerView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 300)];
    _playerView.player = self.player;
    return _playerView;
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

- (UIButton *)pauseButton {
    if (_pauseButton) {
        return _pauseButton;
    }
    _pauseButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    [_pauseButton setTitle:@"暂停" forState:UIControlStateNormal];
    [_pauseButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_pauseButton addTarget:self action:@selector(pauseVideo) forControlEvents:UIControlEventTouchUpInside];
    return _pauseButton;
}

@end
