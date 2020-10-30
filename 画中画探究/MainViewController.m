//
//  MainViewController.m
//  画中画探究
//
//  Created by 许明洋 on 2020/10/29.
//

#import "MainViewController.h"
#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"主界面";
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor yellowColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    FirstViewController *vc = [[FirstViewController alloc] init];
//    ViewController *vc = [[ViewController alloc] init];
    SecondViewController *vc = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
