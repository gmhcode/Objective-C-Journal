//
//  EntryController.m
//  Journal OBJC
//
//  Created by Greg Hughes on 12/17/18.
//  Copyright © 2018 Greg Hughes. All rights reserved.
//

#import "GMHEntryController.h"
#import "GMHEntry.h"
@implementation GMHEntryController


+ (GMHEntryController *)sharedController {
    
    static GMHEntryController *sharedController = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedController = [GMHEntryController new];
        sharedController.entries = [NSMutableArray new];
        [sharedController loadFromPersistentStorage];
    });
    
    
    return sharedController;
}

//- (NSMutableArray *)entries
//{
//    return [NSMutableArray new];
//}



-(void) addEntry:(GMHEntry *)entry
{
    [self.entries addObject:entry];
    self.saveToPersistentStorage;
}



-(void) removeEntry:(GMHEntry *)entry
{
    [self.entries removeObject:entry];
    self.saveToPersistentStorage;
}



-(void) modifyEntry:(GMHEntry *)entry withTitle:(NSString *)title withText:(NSString *)text
{
    entry.title = title;
    entry.text = text;

    self.saveToPersistentStorage;
}
//^^ implementation of shared instance



- (void)saveToPersistentStorage
{
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    
    for (GMHEntry *entry in self.entries) {
        [entryDictionaries addObject:entry.dictionaryRepresentation];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:@"Entries"];
}



- (void)loadFromPersistentStorage
{
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:@"Entries"];
    for (NSDictionary *dictionary in entryDictionaries) {
        GMHEntry *entry = [[GMHEntry new] initWithDictionary:dictionary];
        [_entries addObject:entry];
    }

}



@end




