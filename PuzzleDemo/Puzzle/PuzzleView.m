//
//  AppDelegate.m
//  PuzzleDemo
//
//  Created by 乔杰 on 2018/11/5.
//  Copyright © 2018年 乔杰. All rights reserved.
//

#import "PuzzleView.h"
#import "PuzzleImageView.h"

@interface PuzzleView ()

@property (nonatomic, strong) PuzzleImageView *emptyPuzzle;

@end

@implementation PuzzleView

- (instancetype)initWithFrame:(CGRect)frame {
   
    self = [super initWithFrame:frame];
   
    if (self) {
        
        self.backgroundColor = [UIColor lightGrayColor];
        [self setUpSubViews];
    }
    return self;
}

#pragma mark - 布局子视图

- (void)setUpSubViews {
    
    UIImage *orginImage = [UIImage imageNamed: @"1"];
    
    if (!orginImage) return;
    
    float width = self.frame.size.width/(_gameLevel + 3);
    
    float height = self.frame.size.width/(_gameLevel + 3);
    
    float widthRatio = orginImage.size.width/((_gameLevel + 3) * width);
    
    float heightRatio = orginImage.size.height/((_gameLevel + 3) * height);

    NSMutableArray *imageArr = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < (_gameLevel + 3) * (_gameLevel + 3) - 1; i ++) {

        CGRect rect = CGRectMake(width * widthRatio * (i % (_gameLevel + 3)), height * heightRatio * (i/(_gameLevel + 3)), width * widthRatio, height * heightRatio);
        
        UIImage *clipImage = [self clipImageInRect: rect  orginImage: orginImage];
        
        [imageArr addObject: clipImage];
    }
    
    for (int i = 0; i < (_gameLevel + 3) * (_gameLevel + 3); i ++) {
        
        CGRect rect = CGRectMake(width * (i % (_gameLevel + 3)), height * (i/(_gameLevel + 3)), width, height);
        
        if (i == (_gameLevel + 3) * (_gameLevel + 3) - 1) {
            
            self.emptyPuzzle = [[PuzzleImageView alloc] initWithFrame: rect];
            
            [self.emptyPuzzle setModel: [[PuzzleModel alloc] initWithImage: [[UIImage alloc] init] col: (i % (_gameLevel + 3)) row: (i/(_gameLevel + 3))]];
            
        } else {
            NSInteger index = arc4random()%imageArr.count;
            
            UIImage *clipImage = [imageArr objectAtIndex: index];
            
            PuzzleModel *model = [[PuzzleModel alloc] initWithImage: clipImage col: (i % (_gameLevel + 3)) row: (i/(_gameLevel + 3))];
            
            [imageArr removeObject: clipImage];
            
            PuzzleImageView *imageView = [[PuzzleImageView alloc] initWithFrame: rect];
            
            [imageView setModel: model];
            
            [self addSubview: imageView];
            
            [imageView addGestureRecognizer: [[UITapGestureRecognizer alloc] initWithTarget: self action: @selector(clickImageAndMove:)]];
        }
    }
}

#pragma mark - Setter

- (void)setGameLevel:(NSInteger)gameLevel {
    
    if (_gameLevel == gameLevel) return;
    
    _gameLevel = gameLevel;
    
    for (UIView *view in self.subviews) {
        
        [view removeFromSuperview];
    }
    [self setUpSubViews];
}



#pragma mark - Method

- (UIImage *)clipImageInRect:(CGRect)rect orginImage:(UIImage *)orginImage {
    
    CGImageRef imgRef = CGImageCreateWithImageInRect(orginImage.CGImage, rect);
    
    UIImage * clipImage = [UIImage imageWithCGImage:imgRef];
    
    CGImageRelease(imgRef);
    
    return clipImage;
}


- (void)clickImageAndMove:(UITapGestureRecognizer *)tap {
    
    PuzzleImageView *imageView = (PuzzleImageView *)tap.view;
    PuzzleModel *model = imageView.model;
    
    NSInteger clickCol = model.col;
    NSInteger clickRow = model.row;
    
    float width = self.frame.size.width/(_gameLevel + 3);
    float height = self.frame.size.width/(_gameLevel + 3);
    
    if (clickCol == self.emptyPuzzle.model.col) {
        if (clickRow == self.emptyPuzzle.model.row - 1) {
            [model move: DirectionDown];
            imageView.frame = CGRectMake(CGRectGetMinX(imageView.frame), CGRectGetMinY(imageView.frame) + height, width, height);
            [self.emptyPuzzle.model move: DirectionUp];
        }
        if (clickRow == self.emptyPuzzle.model.row + 1) {
            [model move: DirectionUp];
            imageView.frame = CGRectMake(CGRectGetMinX(imageView.frame), CGRectGetMinY(imageView.frame) - height, width, height);
            [self.emptyPuzzle.model move: DirectionDown];
        }
    }
    
    if (clickRow == self.emptyPuzzle.model.row) {
        if (clickCol == self.emptyPuzzle.model.col - 1) {
            [model move: DirectionRight];
            imageView.frame = CGRectMake(CGRectGetMinX(imageView.frame) + width, CGRectGetMinY(imageView.frame), width, height);
            [self.emptyPuzzle.model move: DirectionLeft];
        }
        if (clickCol == self.emptyPuzzle.model.col + 1) {
            [model move: DirectionLeft];
            imageView.frame = CGRectMake(CGRectGetMinX(imageView.frame) - width, CGRectGetMinY(imageView.frame), width, height);
            [self.emptyPuzzle.model move: DirectionRight];
        }
    }
}

@end
