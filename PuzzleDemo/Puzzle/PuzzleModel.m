//
//  AppDelegate.m
//  PuzzleDemo
//
//  Created by 乔杰 on 2018/11/5.
//  Copyright © 2018年 乔杰. All rights reserved.
//

#import "PuzzleModel.h"

@implementation PuzzleModel
 
- (instancetype)initWithImage:(UIImage *)image col:(NSInteger)col row:(NSInteger)row {
    
    self = [super init];
    if (self) {
      
        self.image = image;
        self.col = col;
        self.row = row;
    }
    return self;
}


- (void)move:(DirectionType)type {
    
    switch (type) {
        case DirectionUp:
            self.row -= 1;
            break;
        case DirectionDown:
            self.row += 1;
            break;
        case DirectionLeft:
            self.col -= 1;
            break;
        case DirectionRight:
            self.col += 1;
            break;
        default:
            break;
    }
}

@end
