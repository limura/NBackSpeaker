//
//  Speaker.h
//  NBackSpeaker
//
//  Created by 飯村 卓司 on 2014/02/16.
//  Copyright (c) 2014年 IIMURA Takuji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

typedef enum {
    STSpeakingStatusSpeak,
	STSpeakingStatusStop,
	STSpeakingStatusPause,
	STSpeakingStatusNone
} STSpeakingStatus;

@interface Speaker : NSObject<AVSpeechSynthesizerDelegate>
{
    AVSpeechSynthesizer* m_Synthesizer;
    AVSpeechSynthesisVoice* m_Voice; // 声の設定(default は日本語)
    STSpeakingStatus m_CurrentStatus;
    
    float m_Rate;
}

- (BOOL) Speech: (NSString*) text;
- (void) SetVoice: (AVSpeechSynthesisVoice*) voice;
- (void) SetRate: (float) rate;
- (STSpeakingStatus) GetStatus;

@end
