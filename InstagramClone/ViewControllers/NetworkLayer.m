//
//  NetworkLayer.m
//  InstagramClone
//
//  Created by Ravi Agrawal on 20/05/18.
//  Copyright © 2018 Ravi Agrawal. All rights reserved.
//

#import "NetworkLayer.h"
#import "ListModel.h"

@implementation NetworkLayer

- (void)getImageListCallAPI{
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"https://picsum.photos/list"]];
    [request setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error) {
                                      if (data == nil) {
                                          [self printCannotLoad];
                                      } else {
                                          [self parseJSON:data];
                                      }
                                  }];
    [task resume];
    
}

- (void) parseJSON:(NSData *) jsonData {
    NSError *error = nil;
    id object = [NSJSONSerialization
                 JSONObjectWithData:jsonData
                 options:0
                 error:&error];
    
    if(error) {
        [self printCannotLoad];
        return;
    }
    
    if ([object isKindOfClass:[NSArray class]]) {
        NSMutableArray *arrData = [[NSMutableArray alloc] init];
        
        for (NSDictionary *dict in object) {
            ListModel * modelList = [[ListModel alloc] initWithJSONString:dict];
            [arrData addObject:modelList];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if ([self.delegate respondsToSelector:@selector(completeDownloadingData:)]) {
                [self.delegate completeDownloadingData:arrData];
            }
        });
        
    } else{
        
    }
}

- (void) printCannotLoad {
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"Can not load");
    });
}

@end
