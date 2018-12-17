//
//  EntryController.h
//  Journal OBJC
//
//  Created by Greg Hughes on 12/17/18.
//  Copyright © 2018 Greg Hughes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GMHEntry.h"
NS_ASSUME_NONNULL_BEGIN

@interface GMHEntryController : NSObject

+ (GMHEntryController *)sharedController;

@property (nonatomic, strong)NSMutableArray *entries;

- (void)addEntry:(GMHEntry *)entry;

- (void)removeEntry:(GMHEntry *)entry;

- (void)modifyEntry:(GMHEntry *)entry
          withTitle:(NSString *)title
           withText:(NSString *)text;

- (void)saveToPersistentStorage;
- (void)loadFromPersistentStorage;

@end

NS_ASSUME_NONNULL_END
