//
//  ViewController.m
//  NBackSpeaker
//
//  Created by 飯村 卓司 on 2014/02/16.
//  Copyright (c) 2014年 IIMURA Takuji. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
 	// Do any additional setup after loading the view, typically from a nib.

    // スタートボタンに枠をつける
    StartButton.layer.borderColor = [UIColor grayColor].CGColor;
    StartButton.layer.borderWidth = 1.0f;
    StartButton.layer.cornerRadius = 7.5f;
    
    // スピーカーオブジェクトを作る
    m_Speaker = [[Speaker alloc] init];
    [m_Speaker SetRate: 0.4f];
    
    // タイマーオブジェクトを作る
    m_SpeakTimer = nil;
    
    // 問題セットオブジェクトを作る
    m_ProblemSet = [[ProblemSet alloc] init];
    m_ProblemSet.difficulty = DIFFICULTY_VERY_HARD;
    
    self.difficulty_list = @[@"超絶簡単", @"超簡単", @"簡単"
                            , @"普通", @"難しい", @"超難しい"];
    
    difficulty_picker.delegate = self;
    difficulty_picker.dataSource = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)AddProblem
{
    Problem* problem = [m_ProblemSet AddProblem];
    NSString* problem_text = [NSString stringWithFormat:@"%@ = %d\n", [problem GetProblemString], [problem GetProblemAnswerInt]];
    
    //[m_Speaker Speech:@"１足す１、２掛ける３、4割る5、2つ前の答えは2、8足す10、2つ前の答えは6"];
    NSLog(@"%@", [problem GetProblemSpeakString]);
    BOOL speech_result = [m_Speaker Speech:[problem GetProblemSpeakString]];
    if(speech_result)
    {
        [ProblemLogTextView setText:[ProblemLogTextView.text stringByAppendingString: problem_text]];
        [ProblemLogTextView scrollRangeToVisible:ProblemLogTextView.selectedRange];
    }
}

- (void)ProblemTimerCall:(NSTimer*)timer
{
    [self AddProblem];
}

- (void)StartProblem
{
    if(m_SpeakTimer != nil && [m_SpeakTimer isValid]){
        [m_SpeakTimer invalidate];
        m_SpeakTimer = nil;
    }
    if(m_SpeakTimer == nil)
    {
        m_SpeakTimer = [NSTimer scheduledTimerWithTimeInterval:10.0 target:self selector:@selector(ProblemTimerCall:) userInfo:nil repeats:YES];
    }
    
    [m_SpeakTimer fire];
}

- (void)StopProblem
{
    if(m_SpeakTimer == nil)
    {
        return;
    }
    if([m_SpeakTimer isValid])
    {
        [m_SpeakTimer invalidate];
        m_SpeakTimer = nil;
    }
}

- (IBAction)StartButtonClicked:(id)sender {
    [self StartProblem];
//    Problem* problem = [m_ProblemSet AddProblem];
//    NSString* problem_text = [NSString stringWithFormat:@"%@ = %d\n", [problem GetProblemString], [problem GetProblemAnswerInt]];
//    [ProblemLogTextView setText:[ProblemLogTextView.text stringByAppendingString: problem_text]];
//    [ProblemLogTextView scrollRangeToVisible:ProblemLogTextView.selectedRange];
//    
//    //[m_Speaker Speech:@"１足す１、２掛ける３、4割る5、2つ前の答えは2、8足す10、2つ前の答えは6"];
//    NSLog(@"%@", [problem GetProblemSpeakString]);
//    [m_Speaker Speech:[problem GetProblemSpeakString]];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component
{
    return [self.difficulty_list count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.difficulty_list objectAtIndex:row];
}


@end
