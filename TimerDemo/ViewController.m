//
//  ViewController.m
//  TimerDemo
//
//  Created by Sonora Mac Mini1 on 19/08/15.
//  Copyright (c) 2015 Sonora Mac Mini1. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.navigationController setNavigationBarHidden:YES];

    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appEntersInBackgroundState:) name:@"APPGOESINBACKGROUNDSTATE" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appEntersInForeGroundState:) name:@"APPWILLENTERFOREGROUNDSTATE" object:nil];
    
  //  UIViewController *viewcontroller = [[UIViewController alloc] init];
    
   // [self.navigationController initWithRootViewController:viewcontroller];

 
}


-(void)onTick:(NSTimer *)timer  {
    
    lblForTime.text = @"Log out";
}

-(void)appEntersInBackgroundState:(NSNotification *)notification{
    
    NSDate * now = [NSDate date];
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:@"HH:mm:ss"];
    NSString *newDateString = [outputFormatter stringFromDate:now];
    NSLog(@"newDateString %@", newDateString);
    
    strAppEntersBgAt = newDateString;
    
    lblAppGoedBgAt.text = [NSString stringWithFormat:@"App Enters in bg at %@",newDateString];
    
    NSDate *date1 = [outputFormatter dateFromString:strtimerStartedAt];
    
    NSDate *date2 = [outputFormatter dateFromString:strAppEntersBgAt];
    
    NSTimeInterval secondsBetween = [date2 timeIntervalSinceDate:date1];
    
    int numberOfmins = secondsBetween / 60;
    
    NSLog(@"There are %d min in between the two dates.", numberOfmins);
    
    lblTimeDiffBetFirstNSec.text = [NSString stringWithFormat:@"Diff Bet 1st & 2nd is %d min", numberOfmins];
    
    timeBetFgToBg = numberOfmins;
    
}

-(void)appEntersInForeGroundState:(NSNotification *)notification{
    
    NSDate * now = [NSDate date];
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:@"HH:mm:ss"];
    NSString *newDateString = [outputFormatter stringFromDate:now];
    NSLog(@"newDateString %@", newDateString);
    
    strAppEntersFgAt = newDateString;

    lblAppcameFromBgAt.text = [NSString stringWithFormat:@"App enters in fg at %@",newDateString];
    
    NSDate *date1 = [outputFormatter dateFromString:strAppEntersBgAt];
    
    NSDate *date2 = [outputFormatter dateFromString:strAppEntersFgAt];
    
    NSTimeInterval secondsBetween = [date2 timeIntervalSinceDate:date1];
    
    int numberOfmins = secondsBetween / 60;
    
    NSLog(@"There are %d min in between the two dates.", numberOfmins);
    
    lblTimeDiffbetSecNThird.text = [NSString stringWithFormat:@"Diff Bet 2nd & 3rd is %d min", numberOfmins];
    
    timeBetBgToFg = numberOfmins;
    
    int totalTime = timeBetFgToBg + timeBetBgToFg;
    
    if (totalTime < 4) {
        int remainingTime = 4 - totalTime;
        
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval: remainingTime*60
                                                          target: self
                                                        selector:@selector(onTick:)
                                                        userInfo: nil repeats:NO];
        
    }else {
    
        lblForTime.text = @"Log out";

    
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)StartStopBtnClicked:(id)sender {
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval: 240.0
                                                      target: self
                                                    selector:@selector(onTick:)
                                                    userInfo: nil repeats:NO];
    
    NSDate * now = [NSDate date];
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:@"HH:mm:ss"];
    NSString *newDateString = [outputFormatter stringFromDate:now];
    NSLog(@"newDateString %@", newDateString);
    
    lblTimerstartedAt.text = [NSString stringWithFormat:@"1.Timer started at %@",newDateString];
    
    strtimerStartedAt = newDateString;
    
    lblAppGoedBgAt.text          = @"2.App goes background at";
    lblAppcameFromBgAt.text      = @"3.App comes from background at";
    lblTimeDiffBetFirstNSec.text = @"Time diff bet 1 & 2 :";
    lblTimeDiffbetSecNThird.text = @"Time Diff bet 2 & 3 :";

}
- (IBAction)nextButtonCliicked:(id)sender {
    DetailViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailStoryboardID"];
    [self.navigationController pushViewController:detailViewController animated:YES];

}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"inside touchesBegan");

}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{

    NSLog(@"inside touchesEnded");
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval: 240.0
                                                      target: self
                                                    selector:@selector(onTick:)
                                                    userInfo: nil repeats:NO];
    
    NSDate * now = [NSDate date];
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:@"HH:mm:ss"];
    NSString *newDateString = [outputFormatter stringFromDate:now];
    NSLog(@"newDateString %@", newDateString);
    
    lblTimerstartedAt.text = [NSString stringWithFormat:@"1.Timer started at %@",newDateString];
    
    strtimerStartedAt = newDateString;
    
    lblAppGoedBgAt.text          = @"2.App goes background at";
    lblAppcameFromBgAt.text      = @"3.App comes from background at";
    lblTimeDiffBetFirstNSec.text = @"Time diff bet 1 & 2 :";
    lblTimeDiffbetSecNThird.text = @"Time Diff bet 2 & 3 :";


}



@end
