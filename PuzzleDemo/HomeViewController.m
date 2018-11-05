//
//  AppDelegate.m
//  PuzzleDemo
//
//  Created by 乔杰 on 2018/11/5.
//  Copyright © 2018年 乔杰. All rights reserved.
//

#import "HomeViewController.h"
#import "PuzzleView.h"

@interface HomeViewController ()

@property (nonatomic, strong) PuzzleView *puzzleView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title =  @"首页";
    
    UIImageView *image = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"1"]];
    image.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - 50)/2.0, 74, 50, 50);
    [self.view addSubview: image];
    
    [self.view addSubview: self.puzzleView];
    

}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear: animated];
}


- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear: animated];
}




#pragma mark -

- (PuzzleView *)puzzleView {
    
    if (!_puzzleView) {
        
        _puzzleView = [[PuzzleView alloc] initWithFrame: CGRectMake(([UIScreen mainScreen].bounds.size.width - 300)/2.0, ([UIScreen mainScreen].bounds.size.height - 64 - 300)/2.0 + 64, 300, 300)];
    }
    return _puzzleView;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    self.puzzleView.gameLevel += 1;
}

@end
