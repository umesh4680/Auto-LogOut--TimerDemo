//
//  ViewController.h
//  TimerDemo
//
//  Created by Sonora Mac Mini1 on 19/08/15.
//  Copyright (c) 2015 Sonora Mac Mini1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UINavigationControllerDelegate> {

    IBOutlet UIButton *btnStartStop;

    IBOutlet UILabel *lblForTime;
    
    IBOutlet UILabel *lblTimerstartedAt;
    
    IBOutlet UILabel *lblAppGoedBgAt;
    
    IBOutlet UILabel *lblAppcameFromBgAt;
    
    IBOutlet UILabel *lblTimeDiffBetFirstNSec;
    
    IBOutlet UILabel *lblTimeDiffbetSecNThird;

    IBOutlet UIButton *btnNext;
    
    NSString *strtimerStartedAt;
    NSString *strAppEntersBgAt;
    NSString *strAppEntersFgAt;
    
    int timeBetFgToBg;
    int timeBetBgToFg;
    
}
- (IBAction)nextButtonCliicked:(id)sender;


@end

