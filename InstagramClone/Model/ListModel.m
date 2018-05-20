//
//  ListModel.m
//  InstagramClone
//
//  Created by Ravi Agrawal on 20/05/18.
//  Copyright © 2018 Ravi Agrawal. All rights reserved.
//

#import "ListModel.h"

@implementation ListModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithJSONString:(NSDictionary *)JSONDictionary
{
    self = [super init];
    if (self) {
        
        NSError *error = nil;
        
        for (NSString* key in JSONDictionary) {
            [self setValue:[JSONDictionary valueForKey:key] forKey:key];
        }
        
    }
    return self;
}


@end
