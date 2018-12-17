//
//  EntriesListTableViewController.m
//  Journal OBJC
//
//  Created by Greg Hughes on 12/17/18.
//  Copyright © 2018 Greg Hughes. All rights reserved.
//

#import "EntriesListTableViewController.h"
#import "GMHEntryController.h"
#import "GMHEntry.h"
#import "EntryDetailViewController.h"

@interface EntriesListTableViewController ()

@end

@implementation EntriesListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    NSLog(@"%lu", (unsigned long)[[[GMHEntryController sharedController] entries] count]);
    
    [self.tableView reloadData];
//    [[GMHEntryController sharedController] loadFromPersistentStorage];
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return GMHEntryController.sharedController.entries.count;
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    
    GMHEntry *entry = [[GMHEntryController sharedController] entries][indexPath.row];
   
    cell.textLabel.text = entry.title;
    
    return cell;
}




// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        GMHEntry *entry = [[GMHEntryController sharedController] entries][indexPath.row];
        
        [[GMHEntryController sharedController ] removeEntry:entry];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}



/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  
    if ([segue.identifier  isEqualToString:@"modifySegue"]){

        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
        EntryDetailViewController *destinationVC = [segue destinationViewController];
        
        GMHEntry *entryTakeOff = [[GMHEntryController sharedController] entries][indexPath.row];
        
        destinationVC.entryLandingPad = entryTakeOff;
        
    }
}


@end
