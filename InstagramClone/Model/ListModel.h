//
//  ListModel.h
//  InstagramClone
//
//  Created by Ravi Agrawal on 20/05/18.
//  Copyright © 2018 Ravi Agrawal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListModel : NSObject

@property(nonatomic) NSString *format;
@property(nonatomic) NSString *width;
@property(nonatomic) NSString *height;
@property(nonatomic) NSString *filename;
@property(nonatomic) NSString *id;
@property(nonatomic) NSString *author;
@property(nonatomic) NSString *author_url;
@property(nonatomic) NSString *post_url;

- (instancetype)initWithJSONString:(NSDictionary *)JSONDictionary;

@end
