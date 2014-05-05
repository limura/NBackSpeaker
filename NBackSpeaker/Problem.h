//
//  Problem.h
//  NBackSpeaker
//
//  Created by 飯村 卓司 on 2014/02/23.
//  Copyright (c) 2014年 IIMURA Takuji. All rights reserved.
//

#import <Foundation/Foundation.h>

// 問題の計算方法
typedef enum {
    CALC_TYPE_NONE, // 計算しない(aのみ)
    CALC_TYPE_ADD, // +
    CALC_TYPE_SUB, // -
    CALC_TYPE_MUL, // *
    CALC_TYPE_DIV, // /
} CalcType;

@interface Problem : NSObject
{
    int a, b;
    CalcType type;
}

- (id) init: (int)a CalcType:(CalcType) calc_type b:(int) b;
- (NSString*) GetProblemString;
- (int) GetProblemAnswerInt;
- (NSString*) GetProblemSpeakString;

@end
