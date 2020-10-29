//
//  ViewController.m
//  画中画探究
//
//  Created by 许明洋 on 2020/10/29.
//

#import "ViewController.h"
#import <AVKit/AVKit.h>

@interface ViewController ()

@property (nonatomic, strong) AVPlayerViewController *avPlayer;
@property (nonatomic, strong) AVPlayerItem *playerItem;
@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) UIButton *playButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"画中画探究";
    self.avPlayer.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, 300);
    [self.view addSubview:self.avPlayer.view];
    self.playButton.frame = CGRectMake((self.view.bounds.size.width - 100) / 2, 320, 100, 50);
    self.avPlayer.player = self.player;
    [self.view addSubview:self.playButton];
}

- (AVPlayerViewController *)avPlayer {
    if (_avPlayer) {
        return _avPlayer;
    }
    _avPlayer = [[AVPlayerViewController alloc] init];
    _avPlayer.showsPlaybackControls = YES;
    return _avPlayer;
}

- (AVPlayerItem *)playerItem {
    if (_playerItem) {
        return _playerItem;
    }
    NSURL *url = [NSURL URLWithString:@"https://youku.cdn4-okzy.com/20200618/8130_4b8b9a06/1000k/hls/index.m3u8"];
    _playerItem = [[AVPlayerItem alloc] initWithURL:url];
    return _playerItem;;
}

- (AVPlayer *)player {
    if (_player) {
        return _player;
    }
    _player = [[AVPlayer alloc] initWithURL:[NSURL URLWithString:@"https://youku.cdn4-okzy.com/20200618/8130_4b8b9a06/1000k/hls/index.m3u8"]];
    return _player;;
}

- (void)playVideo {
    NSLog(@"开始播放视频");
    [self.avPlayer.player play];
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

@end
