//
//  ParentViewController.m
//  ShreeSwastik
//
//  Created by Developers on 24/09/15.
//  Copyright (c) 2015 ChorusProapp. All rights reserved.
//

#import "ParentViewController.h"
#import "MainContentNavigationController.h"


@interface ParentViewController ()
{
    NSTimer *imageTimer;
      NSUserDefaults *defaults;
    NSArray *test;
    NSUInteger numb;
   
    
}

@end

@implementation ParentViewController

- (void)viewDidLoad {
    //[self headerColour];
    [super viewDidLoad];
    
        defaults=[NSUserDefaults standardUserDefaults];

//    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    self.mainContentNavigationController = [storyBoard instantiateViewControllerWithIdentifier:@"MAIN_CONTENT_NAV"];
//    self.mainContentNavigationController.view.frame = CGRectMake(0, 0, self.parentContentContainer.frame.size.width, self.parentContentContainer.frame.size.height);//self.parentContentContainer.frame;
//    [self addChildViewController:self.mainContentNavigationController];
//    //    [self.mainContentNavigationController didMoveToParentViewController:self];
//    [self.parentContentContainer addSubview:self.mainContentNavigationController.view];
//    // Do any additional setup after loading the view.
    [self.mainContentNavigationController setNavigationRoot:[defaults objectForKey:@"vc1"]];
    
        }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setSubContent:(NSString*)storyboardID{
    NSLog(@"StoryBoard ID for subcontent is %@",storyboardID);
    [self.mainContentNavigationController setNavigationRoot:storyboardID];
    UIViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:storyboardID];
    [self addChildViewController:vc];
    vc.view.frame = CGRectMake(0, 0, self.parentContentContainer.frame.size.width, self.parentContentContainer.frame.size.height);
    [self.parentContentContainer addSubview:vc.view];

}

//- (IBAction)btnShare:(id)sender {
//    NSString *textToShare = @"Look at this awesome website for aspiring iOS Developers!";
//    NSURL *myWebsite = [NSURL URLWithString:@"http://www.codingexplorer.com/"];
//    
//    NSArray *objectsToShare = @[textToShare, myWebsite];
//    
//    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:objectsToShare applicationActivities:nil];
//    
//    NSArray *excludeActivities = @[UIActivityTypeAirDrop,
//                                   UIActivityTypePrint,
//                                   UIActivityTypeAssignToContact,
//                                   UIActivityTypeSaveToCameraRoll,
//                                   UIActivityTypeAddToReadingList,
//                                   UIActivityTypePostToFlickr,
//                                   UIActivityTypePostToVimeo,UIActivityTypeMail,UIActivityTypeMessage,UIActivityTypePostToTwitter];
//    
//    activityVC.excludedActivityTypes = excludeActivities;
//    
//    [self presentViewController:activityVC animated:YES completion:nil];
//}
@end
