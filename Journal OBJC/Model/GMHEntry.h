//
//  Entry.h
//  Journal OBJC
//
//  Created by Greg Hughes on 12/17/18.
//  Copyright © 2018 Greg Hughes. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface GMHEntry : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSDate *timestamp;
@property (nonatomic, strong) NSString *text;

- (instancetype)initWithTitle:(NSString *)title
                         text:(NSString *)text
                    timestamp:(NSDate *)timestamp;


- (instancetype)initWithDictionary:(NSDictionary *)dictionaryCopy;

- (NSDictionary *)dictionaryRepresentation;

@end

