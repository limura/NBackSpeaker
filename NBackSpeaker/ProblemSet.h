//
//  ProblemSet.h
//  NBackSpeaker
//
//  Created by 飯村 卓司 on 2014/02/23.
//  Copyright (c) 2014年 IIMURA Takuji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Problem.h"

typedef enum {
    DIFFICULTY_ULTRA_VERY_EASY,
    DIFFICULTY_VERY_EASY,
    DIFFICULTY_EASY,
    DIFFICULTY_NORMAL,
    DIFFICULTY_HARD,
    DIFFICULTY_VERY_HARD,
} Difficulty;

@interface ProblemSet : NSObject
{
    NSMutableArray* m_ProblemList;
    int back_n;
}

@property (nonatomic) Difficulty difficulty;

- (Problem*) AddProblem;

@end
