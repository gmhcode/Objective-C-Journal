//
//  EntryDetailViewController.m
//  Journal OBJC
//
//  Created by Greg Hughes on 12/17/18.
//  Copyright © 2018 Greg Hughes. All rights reserved.
//

#import "EntryDetailViewController.h"
#import "GMHEntryController.h"
#import "GMHEntry.h"

@interface EntryDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;

@property (weak, nonatomic) IBOutlet UITextView *textView;


@end

@implementation EntryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateViews];
    
}




-(void) updateViews

{
    if (self.entryLandingPad){
        _titleTextField.text = self.entryLandingPad.title;
        _textView.text = self.entryLandingPad.text;
        
    }
}


- (IBAction)saveButtonTapped:(id)sender {
    
    if (self.entryLandingPad) {
        [[GMHEntryController sharedController ] modifyEntry:self.entryLandingPad withTitle: self.titleTextField.text withText: self.textView.text];
    }
    else {
     
        GMHEntry *entry = [[GMHEntry alloc] initWithTitle: self.titleTextField.text text: self.textView.text timestamp: [NSDate date]];
        
        [[GMHEntryController sharedController] addEntry: entry];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)clearButtonTapped:(id)sender {
    
    self.titleTextField.text = @"";
    self.textView.text = @"";
    
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
