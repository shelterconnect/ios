//
//  ModelController.h
//  ShelterConnect
//
//  Created by Manny Abascal on 5/31/14.
//  Copyright (c) 2014 Hack for LA project. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataViewController;

@interface ModelController : NSObject <UIPageViewControllerDataSource>

- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(DataViewController *)viewController;

@end
