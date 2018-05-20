//
//  NetworkLayer.h
//  InstagramClone
//
//  Created by Ravi Agrawal on 20/05/18.
//  Copyright © 2018 Ravi Agrawal. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NetworkLayerDelegate

-(void)completeDownloadingData:(NSArray *)arrData;

@end

@interface NetworkLayer : NSObject

@property(weak,nonatomic) id delegate;

- (void)getImageListCallAPI;

@end
