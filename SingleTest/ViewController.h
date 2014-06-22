//
//  ViewController.h
//  SingleTest
//
//  Created by Ankur Jain on 6/1/14.
//  Copyright (c) 2014 ShelterConnect. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController 
- (IBAction)startWalkthrough:(id)sender;
@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageTitles;
@property (strong, nonatomic) NSArray *pageBackgroundImage;
@property (strong, nonatomic) NSArray *pagebgImage;
- (IBAction)submitLogin:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (strong, nonatomic) NSArray* stations;

@property (weak, nonatomic) IBOutlet UITextField *passwordField;

- (IBAction)checkInButton:(id)sender;

- (IBAction)checkOutButton:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *hoursLabel;


    
@end
