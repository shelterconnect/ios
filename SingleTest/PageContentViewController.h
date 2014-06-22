//
//  PageContentViewController.h
//  SingleTest
//
//  Created by Ankur Jain on 6/1/14.
//  Copyright (c) 2014 ShelterConnect. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageContentViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *hoursLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bgImage;


- (IBAction)checkInButton:(id)sender;

@property NSUInteger pageIndex;
@property NSString *titleText;
@property NSString *imageFile;
@property NSString *bgFile;



@end
