//
//  Problem.m
//  NBackSpeaker
//
//  Created by 飯村 卓司 on 2014/02/23.
//  Copyright (c) 2014年 IIMURA Takuji. All rights reserved.
//
// 問題クラス

#import "Problem.h"

@implementation Problem

- (id) init: (int)lhs CalcType:(CalcType) calc_type b:(int) rhs
{
    self = [super init];

    a = lhs;
    b = rhs;
    type = calc_type;
    
    return self;
}

// 問題の表示用文字列の取得
- (NSString*) GetProblemString
{
    NSString* type_string = nil;
    switch(type)
    {
        case CALC_TYPE_NONE:
            return [NSString stringWithFormat:@"%d", a];
            break;
        case CALC_TYPE_ADD:
            type_string = @"+";
            break;
        case CALC_TYPE_SUB:
            type_string = @"-";
            break;
        case CALC_TYPE_MUL:
            type_string = @"*";
            break;
        case CALC_TYPE_DIV:
            type_string = @"/";
            break;
        default:
            type_string = @"?";
            break;
    }
    return [NSString stringWithFormat:@"%d %@ %d", a, type_string, b];
}

- (int) GetProblemAnswerInt
{
    int answer = 0;
    switch(type)
    {
        case CALC_TYPE_NONE:
            answer = a;
            break;
        case CALC_TYPE_ADD:
            answer = a + b;
            break;
        case CALC_TYPE_SUB:
            answer = a - b;
            break;
        case CALC_TYPE_MUL:
            answer = a * b;
            break;
        case CALC_TYPE_DIV:
            answer = a / b;
            break;
        default:
            break;
    }
    return answer;
}

// 問題の発声用文字列の取得
- (NSString*) GetProblemSpeakString
{
    NSString* type_string = nil;
    switch(type)
    {
        case CALC_TYPE_NONE:
            return [NSString stringWithFormat:@"%d", a];
            break;
        case CALC_TYPE_ADD:
            type_string = @"足す";
            break;
        case CALC_TYPE_SUB:
            type_string = @"ひく";
            break;
        case CALC_TYPE_MUL:
            type_string = @"掛ける";
            break;
        case CALC_TYPE_DIV:
            type_string = @"割る";
            break;
        default:
            type_string = @"";
            break;
    }
    return [NSString stringWithFormat:@"%d %@ %d", a, type_string, b];
}

@end
