//
//  Entry.m
//  Journal OBJC
//
//  Created by Greg Hughes on 12/17/18.
//  Copyright © 2018 Greg Hughes. All rights reserved.
//

#import "GMHEntry.h"

@implementation GMHEntry

- (instancetype)initWithTitle:(NSString *)title text:(NSString *)text timestamp:(NSDate *)timestamp
{
    self = [super init];
    if (self) {
        _title = title;
        _text = text;
        _timestamp = timestamp;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryCopy
{
    NSString *title = dictionaryCopy[@"title"];
    NSString *text = dictionaryCopy[@"text"];
    NSDate *timestamp = dictionaryCopy[@"timestamp"];
    
    return [self initWithTitle:title text:text timestamp:timestamp];
    
    
}
- (NSDictionary *)dictionaryRepresentation
{
    return @{
             @"title": self.title,
             @"text": self.text,
             @"timestamp": self.timestamp
             };
}

@end
