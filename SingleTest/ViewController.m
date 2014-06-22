//
//  ViewController.m
//  SingleTest
//
//  Created by Ankur Jain on 6/1/14.
//  Copyright (c) 2014 ShelterConnect. All rights reserved.
//

#import "ViewController.h"
#import "PageContentViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Create the data model
    //_pageTitles = @[@"Over 200 Tips and Tricks"];
    //_pageBackgroundImage = @[@"page1.png", @"label1.png"];
    //_pagebgImage = @[@"label2.png", @"label1.png"];
   
    _stations = [NSString stringWithFormat:@"Email: %@, Pass: %@", [_emailField text], [_passwordField text]];

    
    // Create page view controller
   // self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    //self.pageViewController.dataSource = self;
    
    //PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    //NSArray *viewControllers = @[startingViewController];
    //[self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    //self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30);
    
   // [self addChildViewController:_pageViewController];
    //[self.view addSubview:_pageViewController.view];
    //[self.pageViewController didMoveToParentViewController:self];
    
    //for (UIGestureRecognizer *gR in self.view.gestureRecognizers) {
      //  gR.delegate = self;
    //}
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]
                                    initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
                                    target:self
                                    action:@selector(doSearch:)];
    
    self.navigationItem.rightBarButtonItem = rightButton;
    
}

-(void)goHome:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
/*-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    //Touch gestures below top bar should not make the page turn.
    //EDITED Check for only Tap here instead.
    if ([gestureRecognizer isKindOfClass:[UITapGestureRecognizer class]]) {
        CGPoint touchPoint = [touch locationInView:self.view];
        if (touchPoint.y > 40) {
            return NO;
        }
        else if (touchPoint.x > 50 && touchPoint.x < 430) {//Let the buttons in the middle of the top bar receive the touch
            return NO;
        }
    }
    return YES;
}*/
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
- (IBAction)startWalkthrough:(id)sender {
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageTitles count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}
- (PageContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    PageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    pageContentViewController.imageFile = self.pageBackgroundImage[index];
    pageContentViewController.titleText = self.pageTitles[index];
    pageContentViewController.bgFile = self.pagebgImage[index];

    pageContentViewController.pageIndex = index;
    
    return pageContentViewController;
}
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.pageTitles count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

//PageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];

*/



- (IBAction)submitLogin:(id)sender
{
    NSURLRequest * urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://shelterconnect.ngrok.com/organizations/authenticate"]];
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData * data = [NSURLConnection sendSynchronousRequest:urlRequest
                                          returningResponse:&response
                                                      error:&error];
    
    if (error == nil)
    {
        // Parse data here
        
        NSError* error;
        NSDictionary * JSON = [NSJSONSerialization
                               JSONObjectWithData:data
                               
                               options:kNilOptions
                               error:&error];
        
        self.stations = [JSON allValues];
        NSLog(@"stations: %@", self.stations);
    }
    
    
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:nil
                          message:[NSString stringWithFormat:@"Email: %@, Pass: %@", [_emailField text], [_passwordField text]]
                          delegate:nil
                          cancelButtonTitle:nil
                          otherButtonTitles:@"OK", nil];
    [alert show];
}



@end
