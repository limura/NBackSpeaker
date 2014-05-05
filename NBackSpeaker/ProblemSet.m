//
//  ProblemSet.m
//  NBackSpeaker
//
//  Created by 飯村 卓司 on 2014/02/23.
//  Copyright (c) 2014年 IIMURA Takuji. All rights reserved.
//

#import "ProblemSet.h"

@implementation ProblemSet

- (id) init;
{
    self = [super init];
    
    m_ProblemList = [[NSMutableArray alloc] init];
    self.difficulty = DIFFICULTY_EASY;
    
    return self;
}

- (Problem*) AddProblem
{
    CalcType type = CALC_TYPE_ADD;
    int a = arc4random_uniform(20) + 1;
    int b = arc4random_uniform(20) + 1;
    switch(self.difficulty)
    {
        case DIFFICULTY_ULTRA_VERY_EASY:
            type = CALC_TYPE_NONE;
            a = arc4random_uniform(10) + 1;
            b = 0;
            break;
        case DIFFICULTY_VERY_EASY:
            type = CALC_TYPE_ADD;
            a = arc4random_uniform(10) + 1;
            b = arc4random_uniform(10) + 1;
            break;
        case DIFFICULTY_EASY:
            // this is default level.
            break;
        case DIFFICULTY_NORMAL:
            if(arc4random_uniform(2) >= 1){
                type = CALC_TYPE_SUB;
                a = arc4random_uniform(10) + 1;
                b = arc4random_uniform(a) + 1;
            }else{
                type = CALC_TYPE_ADD;
                a = arc4random_uniform(20) + 1;
                b = arc4random_uniform(20) + 1;
            }
            break;
        case DIFFICULTY_HARD:
            switch(arc4random_uniform(3))
            {
                case 0:
                    type = CALC_TYPE_SUB;
                    a = arc4random_uniform(20) + 1;
                    b = arc4random_uniform(a) + 1;
                    break;
                case 1:
                    type = CALC_TYPE_ADD;
                    a = arc4random_uniform(30) + 1;
                    b = arc4random_uniform(30) + 1;
                    break;
                default:
                    type = CALC_TYPE_MUL;
                    a = arc4random_uniform(5) + 1;
                    b = arc4random_uniform(5) + 1;
                    break;
            }
            break;
        case DIFFICULTY_VERY_HARD:
            switch(arc4random_uniform(4))
            {
                case 0:
                    type = CALC_TYPE_SUB;
                    a = arc4random_uniform(20) + 1;
                    b = arc4random_uniform(a) + 1;
                    break;
                case 1:
                    type = CALC_TYPE_ADD;
                    a = arc4random_uniform(30) + 1;
                    b = arc4random_uniform(30) + 1;
                    break;
                case 2:
                    type = CALC_TYPE_MUL;
                    a = arc4random_uniform(5) + 1;
                    b = arc4random_uniform(5) + 1;
                    break;
                default:
                    type = CALC_TYPE_DIV;
                    b = arc4random_uniform(5) + 1;
                    a = (arc4random_uniform(10) + 1) * b;
                    break;
            }
            break;
        default:
            break;
    }
    Problem* problem = [[Problem alloc] init:a CalcType:type b:b];
    [m_ProblemList addObject:problem];
    return problem;
}

@end
