//
//  ParentViewController.h
//  ShreeSwastik
//
//  Created by Developers on 01/12/15.
//  Copyright (c) 2015 ShreeSwastik. All rights reserved.
//

#import "ViewController.h"
#import "MainContentNavigationController.h"


@interface ParentViewController : ViewController
@property (nonatomic,strong) MainContentNavigationController *mainContentNavigationController;
@property (weak, nonatomic) IBOutlet UIView *parentContentContainer;

-(void)setSubContent:(NSString*)storyboardID;

@property (weak, nonatomic) IBOutlet UIView *mainHeaderView;

@property (weak, nonatomic) IBOutlet UIButton *btnSolution;
- (IBAction)btnSolution:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnNotification;
- (IBAction)btnNotification:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnCharan;
- (IBAction)btnCharan:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnVideo;
- (IBAction)btnVideo:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (weak, nonatomic) IBOutlet UILabel *lblUserName;
- (IBAction)btnShare:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnProfilePicture;
- (IBAction)btnProfilePicture:(id)sender;

@property(nonatomic,strong)NSArray *array;
@property(nonatomic,strong)NSString *userId;
@property(nonatomic,strong)NSString *userName;
@end
