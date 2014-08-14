//
//  NSWInformationTableViewController.m
//  Training Guide
//
//  Created by Chad D Colby on 8/14/14.
//  Copyright (c) 2014 Byte Meets World. All rights reserved.
//

#import "NSWInformationTableViewController.h"

@interface NSWInformationTableViewController ()

@property (strong, nonatomic) NSArray *runSwimArray;
@property (strong, nonatomic) NSArray *pushSitUpArray;
@property (strong, nonatomic) NSArray *pullUpArray;

@property (strong, nonatomic) NSMutableDictionary *userInfoDictionary;

@end

@implementation NSWInformationTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    // Uncomment the following line to preserve selection between presentations.
     self.clearsSelectionOnViewWillAppear = NO;
    
    self.runSwimArray = [NSArray arrayWithObjects:@"8:00 - 8:30", @"8:30 - 9:00", @"9:00 - 9:30", @"9:30 - 10:00", @"10:00 - 10:30", @"10:30 - 11:00", @"11:00 - 11:30", @"11:30 - 12:00", @"12:00 - 12:30", @"12:30 - 13:00", @"13:00 - 13:30", @"13:30 - 14:00", @"14:00 - 14:30", @"14:30 - 15:00", @"15:00 - 15:30", @"15:30 - 16:00" , nil];
    
    self.pushSitUpArray = [NSArray arrayWithObjects:@"< 40", @"40 - 60", @"60 - 80", @"80 - 100", @"> 100", nil];
    
    self.pullUpArray = [NSArray arrayWithObjects:@"< 6", @"6 - 9", @"10 - 12", @"13 - 15", @"> 15", nil];
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    if (!self.userInfoDictionary) {
        self.userInfoDictionary = [[NSMutableDictionary alloc] init];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBarHidden = YES;
    
    NSLog(@"%@", self.userInfoDictionary);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    switch (section) {
        case 0:
            return 16;
            break;
        case 1:
            return 16;
        case 2:
            return 5;
        case 3:
            return 5;
        case 4:
            return 5;
        default:
            return 0;
            break;
    }

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"infoCell" forIndexPath:indexPath];


    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = self.runSwimArray[indexPath.row];
            break;
        case 1:
            cell.textLabel.text = self.runSwimArray[indexPath.row];
            break;
        case 2:
            cell.textLabel.text = self.pushSitUpArray[indexPath.row];
            break;
        case 3:
            cell.textLabel.text = self.pushSitUpArray[indexPath.row];
            break;
        case 4:
            cell.textLabel.text = self.pullUpArray[indexPath.row];
            break;
        default:
            break;
    }
    
    return cell;
}

#pragma mark - TableView Delegates

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50.0f;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *headerLabel = [[UILabel alloc] init];
    switch (section) {
        case 0:
            headerLabel.text = @" 1/4 mile RUN time is...";
            break;
        case 1:
            headerLabel.text = @" 500 meter SWIM time is...";
            break;
        case 2:
            headerLabel.text = @" Max PUSHUPS are between...";
            break;
        case 3:
            headerLabel.text = @" Max SITUPS are between...";
            break;
        case 4:
            headerLabel.text = @" Max PULLUPS are between...";
            break;

        default:
            headerLabel.text = @"";
            break;
    }
    return headerLabel;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section != 4) {
        
        NSIndexPath *nextIndexPath = [NSIndexPath indexPathForRow:0 inSection:indexPath.section + 1];
        [tableView scrollToRowAtIndexPath:nextIndexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
        
    }
    
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *selectedString = selectedCell.textLabel.text;
    switch (indexPath.section) {
        case 0:
            [self.userInfoDictionary setObject:selectedString forKey:@"runTime"];
            break;
        case 1:
            [self.userInfoDictionary setObject:selectedString forKey:@"swimTime"];
            break;
        case 2:
            [self.userInfoDictionary setObject:selectedString forKey:@"maxPush"];
            break;
        case 3:
            [self.userInfoDictionary setObject:selectedString forKey:@"maxSit"];
            break;
        case 4:
            [self.userInfoDictionary setObject:selectedString forKey:@"maxPull"];
            break;
            
        default:
            break;
    }

}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
