//
//  ViewController.h
//  NBackSpeaker
//
//  Created by 飯村 卓司 on 2014/02/16.
//  Copyright (c) 2014年 IIMURA Takuji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Speaker.h"
#import "ProblemSet.h"

@interface ViewController : UIViewController
<UIPickerViewDelegate, UIPickerViewDataSource>
{
    __weak IBOutlet UIButton *StartButton;
    Speaker* m_Speaker;
    NSTimer* m_SpeakTimer;
    ProblemSet* m_ProblemSet;
    __weak IBOutlet UITextView *ProblemLogTextView;
    __weak IBOutlet UIPickerView *difficulty_picker;
}
@property (strong, nonatomic) NSArray* difficulty_list;

- (IBAction)StartButtonClicked:(id)sender;
- (void)ProblemTimerCall:(NSTimer*)timer;
- (void)StartProblem;
- (void)StopProblem;
- (void)AddProblem;

@end
