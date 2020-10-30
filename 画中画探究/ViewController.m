//
//  ViewController.m
//  画中画探究
//
//  Created by 许明洋 on 2020/10/29.
//

#import "ViewController.h"
#import <AVKit/AVKit.h>

@interface ViewController ()<AVPictureInPictureControllerDelegate>

@property (nonatomic, strong) AVPlayerViewController *avPlayer;
@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) UIButton *playButton;
@property (nonatomic, strong) AVPictureInPictureController *pipVC;
@property (nonatomic, strong) UIButton *startPipButton;
@property (nonatomic, strong) AVPlayerLayer *playerLayer;

@end

@implementation ViewController

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
        [[AVAudioSession sharedInstance] setActive:YES
            error:nil];
        
    } else {
        NSLog(@"设备不支持画中画功能");
    }
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"画中画探究";
    self.avPlayer.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, 300);
    [self.view addSubview:self.avPlayer.view];
    self.playButton.frame = CGRectMake((self.view.bounds.size.width - 100) / 2, 320, 100, 50);
    self.startPipButton.frame = CGRectMake((self.view.bounds.size.width - 100) / 2, 390, 100, 50);
    [self.view addSubview:self.startPipButton];
    self.avPlayer.player = self.player;
    [self.view addSubview:self.playButton];
    
//    [self.view.layer addSublayer:self.pipVC.playerLayer];
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
    return _player;;
}

- (AVPictureInPictureController *)pipVC {
    if (_pipVC) {
        return _pipVC;
    }
    _pipVC = [[AVPictureInPictureController alloc] initWithPlayerLayer:self.playerLayer];
    _pipVC.delegate = self;
    return _pipVC;
}

- (AVPlayerLayer *)playerLayer {
    if (_playerLayer) {
        return _playerLayer;;
    }
    _playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.avPlayer.player];
    return _playerLayer;
}

- (void)playVideo {
    NSLog(@"开始播放视频");
    [self.avPlayer.player play];
}

- (void)startPip {
    NSLog(@"开启画中画功能");
//    if ([self.pipVC isPictureInPictureActive]) {
//        [self.pipVC stopPictureInPicture];
//    } else {
//        [self.pipVC startPictureInPicture];
//    }
    if (self.pipVC.isPictureInPicturePossible) {
        NSLog(@"允许开启画中画功能");
    } else {
        NSLog(@"不允许开启画中画功能");
    }
    [self.pipVC startPictureInPicture];
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

- (UIButton *)startPipButton {
    if (_startPipButton) {
        return _startPipButton;;
    }
    _startPipButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    [_startPipButton setTitle:@"开启画中画功能" forState:UIControlStateNormal];
    [_startPipButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_startPipButton addTarget:self action:@selector(startPip) forControlEvents:UIControlEventTouchUpInside];
    return _startPipButton;
}

#pragma mark - AVPictureInPictureControllerDelegate
- (void)pictureInPictureControllerWillStartPictureInPicture:(AVPictureInPictureController *)pictureInPictureController {
    NSLog(@"即将开启画中画功能");
}

- (void)pictureInPictureControllerDidStartPictureInPicture:(AVPictureInPictureController *)pictureInPictureController {
    NSLog(@"画中画已开启");
}

- (void)pictureInPictureController:(AVPictureInPictureController *)pictureInPictureController failedToStartPictureInPictureWithError:(NSError *)error {
    NSLog(@"画中画开启失败时调用");
    NSLog(@"开启画中画失败的原因为%@",error);
}

- (void)pictureInPictureControllerWillStopPictureInPicture:(AVPictureInPictureController *)pictureInPictureController {
    NSLog(@"即将停止画中画功能");
}

- (void)pictureInPictureControllerDidStopPictureInPicture:(AVPictureInPictureController *)pictureInPictureController {
    NSLog(@"画中画功能已经停止");
}

@end
