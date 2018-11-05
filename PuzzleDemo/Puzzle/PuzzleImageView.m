//
//  AppDelegate.m
//  PuzzleDemo
//
//  Created by 乔杰 on 2018/11/5.
//  Copyright © 2018年 乔杰. All rights reserved.
//

#import "PuzzleImageView.h"

@implementation PuzzleImageView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
 
        self.layer.borderWidth = 1.0/[UIScreen mainScreen].scale;
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.userInteractionEnabled = YES;
    }
    return self;
}

#pragma mark - Setter

- (void)setModel:(PuzzleModel *)model {
    
    _model = model;
    
    self.image = model.image;
}

@end
