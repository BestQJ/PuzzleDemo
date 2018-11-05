//
//  PuzzleModel.h
//  TestAPI
//
//  Created by 乔杰 on 2018/11/5.
//  Copyright © 2018年 乔杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, DirectionType) {
    DirectionUp,
    DirectionDown,
    DirectionLeft,
    DirectionRight
};

NS_ASSUME_NONNULL_BEGIN

@interface PuzzleModel : NSObject

@property (nonatomic, assign) NSInteger col;

@property (nonatomic, assign) NSInteger row;

@property (nonatomic, strong) UIImage *image;

- (instancetype)initWithImage:(UIImage *)image col:(NSInteger)col row:(NSInteger)row;

- (void)move:(DirectionType)type;

@end

NS_ASSUME_NONNULL_END
