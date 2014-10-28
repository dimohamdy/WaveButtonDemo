//
//  ViewController.m
//  WaveButtonDemo
//
//  Created by binaryboy on 10/28/14.
//  Copyright (c) 2014 AhmedHamdy. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "BTRippleButton/BTRippleButtton.h"
@interface ViewController ()

@end

@implementation ViewController
{
    BTRippleButtton *rippleButton;
    BTRippleButtton *rippleButton1;
    BTRippleButtton *rippleButtonGreen;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *background = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"background.jpg"]];
    background.frame = self.view.frame;
    [self.view addSubview:background];
    self.view.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.9];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    rippleButton = [[BTRippleButtton alloc]initWithImage:[UIImage imageNamed:@"pin.png"]
                                                                 andFrame:CGRectMake(144, 55, 32, 32)
                                                                andTarget:@selector(buttonTapped:)
                                                                    andID:self];
    [rippleButton setRippeEffectEnabled:YES];
    [rippleButton setRippleEffectWithColor:[UIColor colorWithRed:240/255.f green:159/255.f blue:10/255.f alpha:1]];

        [self.view addSubview:rippleButton];
    
    
    
    
    
    
    
    
    
    rippleButton1 = [[BTRippleButtton alloc]initWithImage:[UIImage imageNamed:@"green.png"]
                                                                  andFrame:CGRectMake(124, 150, 75, 75)
                                                                 andTarget:@selector(buttonTapped:)
                                                                     andID:self];
    [rippleButton1 setRippeEffectEnabled:YES];
    [rippleButton1 setRippleEffectWithColor:[UIColor colorWithRed:240/255.f green:159/255.f blue:254/255.f alpha:1]];
    [self.view addSubview:rippleButton1];
    
    
    
    rippleButtonGreen = [[BTRippleButtton alloc] initWithImage:[UIImage imageNamed:@"author.png"]
                                                                       andFrame:CGRectMake(110, 300, 99, 99)
                                                                   onCompletion:^(BOOL success) {
                                                                       
                                                                       NSLog(@"I am from Block, execution.");
                                                                       
                                                                       UIViewController *temporary = [[UIViewController alloc]init];
                                                                       temporary.view.backgroundColor = [UIColor colorWithRed:20/255.f green:159/255.f blue:200/255.f alpha:1];
                                                                       UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 250)];
                                                                       label.numberOfLines = 0;
                                                                       label.font = [UIFont fontWithName:@"Din Condensed" size:64];
                                                                       label.text = @"This will surely go down";
                                                                       label.textAlignment = NSTextAlignmentCenter;
                                                                       label.textColor = [UIColor whiteColor];
                                                                       [temporary.view addSubview:label];
                                                                       label.center = temporary.view.center;
                                                                       
                                                                       [self.navigationController presentViewController:temporary
                                                                                                               animated:YES
                                                                                                             completion:^{
                                                                                                                 
                                                                                                                 [self performSelector:@selector(dismissPresented:) withObject:nil afterDelay:0.7];
                                                                                                                 
                                                                                                             }];
                                                                       
                                                                       
                                                                   }];
    
    [rippleButtonGreen setRippeEffectEnabled:YES];
    [rippleButtonGreen setRippleEffectWithColor:[UIColor colorWithRed:204/255.f green:270/255.f blue:12/255.f alpha:1]];
    [self.view addSubview:rippleButtonGreen];
    
    [NSTimer scheduledTimerWithTimeInterval:1
                                     target: self
                                   selector:@selector(wave:)
                                   userInfo: nil repeats:YES];
}

-(void)dismissPresented:(id)sender {
    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) wave: (NSTimer*)timer {
    
    rippleButton1.transform = CGAffineTransformMakeScale(1.5, 1.5);
    
    [UIView animateWithDuration: 0.4
                          delay: 0.0
                        options: UIViewAnimationOptionTransitionNone
                     animations: ^{
                         rippleButton1.transform = CGAffineTransformIdentity;
                         [rippleButton1 generateWave];

                     } completion: ^(BOOL finished){
                         [rippleButton1.layer removeAllAnimations];

                         
                     }];
    
    
    rippleButton.transform = CGAffineTransformMakeScale(1.5, 1.5);
    
    [UIView animateWithDuration: 0.4
                          delay: 0.0
                        options: UIViewAnimationOptionTransitionNone
                     animations: ^{
                         rippleButton.transform = CGAffineTransformIdentity;
                         [rippleButton generateWave];
                         
                     } completion: ^(BOOL finished){
                         [rippleButton.layer removeAllAnimations];
                         
                         
                     }];
    
    
    rippleButtonGreen.transform = CGAffineTransformMakeScale(1.5, 1.5);
    
    [UIView animateWithDuration: 0.4
                          delay: 0.0
                        options: UIViewAnimationOptionTransitionNone
                     animations: ^{
                         rippleButtonGreen.transform = CGAffineTransformIdentity;
                         [rippleButtonGreen generateWave];
                         
                     } completion: ^(BOOL finished){
                         [rippleButtonGreen.layer removeAllAnimations];
                         
                         
                     }];
}

-(void)buttonTapped:(id)sender {
    NSLog(@"Button Tapped");
}
@end
