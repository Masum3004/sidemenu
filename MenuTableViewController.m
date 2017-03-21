//
//  MenuTableViewController.m
//  ShreeSwastik
//
//  Created by Rajendrasinh Parmar on 25/09/15.
//  Copyright © 2015 ChorusProapp. All rights reserved.
//

#import "MenuTableViewController.h"
#import "MenuRow.h"
#import "HeaderView.h"

@implementation MenuTableViewController{
    NSUserDefaults *defaults;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    defaults=[NSUserDefaults standardUserDefaults];
        HeaderView  *header = [[[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil] objectAtIndex:0];
    header.lblMy.text = @"hello hi by bye :P";
    self.tableView.tableHeaderView = header;
//    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 150)];
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, headerView.frame.size.width, 150)];
//    [headerView addSubview:imageView];
//    [imageView setImage:[UIImage imageNamed:@"internation_tour.png"]];
//    //UILabel *labelView = [[UILabel alloc] initWithFrame:CGRectMake(0, YYY, XXX, YYY)];
//    // [headerView addSubview:labelView];
//    self.tableView.tableHeaderView = headerView;
    
    //[defaults setObject:@"1" forKey:@"languageStatus"];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    menuItems = [[NSMutableArray alloc] init];
    menuIcons = [[NSMutableArray alloc] init];
    menuItemIdentifire = [[NSMutableArray alloc] init];
    
    NSArray *defaultItems;
   
        defaultItems = [[NSArray alloc] initWithObjects:@"Home",@"Products",@"About Us",@"Contact Us",@"My Account",@"Logout", nil];
  

    NSArray *defaultIcons = [[NSArray alloc] initWithObjects:@"home.png", @"product.png", @"about.png", @"call.png", @"my_account.png",@"logout.png", nil];
   
    NSArray *defaultsMenuitemIdentifire = [[NSArray alloc] initWithObjects:@"vc1",@"vc2",@"vc3",@"vc4",@"vc5",@"vc6", nil];
    
    [menuItems addObjectsFromArray:defaultItems];
    [menuIcons addObjectsFromArray:defaultIcons];
    [menuItemIdentifire addObjectsFromArray:defaultsMenuitemIdentifire];
   
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [menuItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MenuRow *cell = [tableView dequeueReusableCellWithIdentifier:@"menuRow" forIndexPath:indexPath];
    [cell.menuLabel setText:[menuItems objectAtIndex:indexPath.row]];
    [cell.menuIcon setImage:[UIImage imageNamed:[menuIcons objectAtIndex:indexPath.row]]];
    if ([[defaults objectForKey:@"setContent"]isEqualToString:@"SKIP"])
    {
        
        if (indexPath.row==5||indexPath.row==4){
            NSLog(@"--------%ld",indexPath.row);
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell.menuLabel setTextColor:[UIColor grayColor]];
            cell.userInteractionEnabled = NO;
        }
        else
        {
            NSLog(@"-SELETED-------%ld",indexPath.row);
        }
        
    }

    return cell;
}

-(void)tableView: (UITableView*)tableView didSelectRowAtIndexPath:( NSIndexPath *)indexPath{
    if (indexPath.row==5)
        {
            [defaults removeObjectForKey:@"userId"];
            [defaults removeObjectForKey:@"userName"];
            [defaults removeObjectForKey:@"pId"];
            [defaults removeObjectForKey:@"pName"];
         UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
            UIViewController *signup=[storyboard instantiateViewControllerWithIdentifier:@"HOME"];
        
        [self presentViewController:signup animated:YES completion:nil];
        

        }
    
    else
    {
        NSLog(@"controller at %ld is %@",(long)indexPath.row, [menuItemIdentifire objectAtIndex:indexPath.row]);
        //[defaults setObject:[menuItems objectAtIndex:indexPath.row] forKey:@"setTitle"];
        //[defaults setObject:@"1" forKey:@"drawerStatus"];
        [self.menuDrawerViewController setContent:[menuItemIdentifire objectAtIndex:indexPath.row]];
    }
    
}
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    
//    HeaderView  *header = [[[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil] objectAtIndex:0];
//    
//    return header;
//    
//}

@end
