//
//  ImageCaching.h
//  InstagramClone
//
//  Created by Ravi Agrawal on 20/05/18.
//  Copyright © 2018 Ravi Agrawal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageCaching : NSObject

+(NSString *)documentsPathForFileName:(NSString *)name;
+(void)saveImageForCaching:(NSData *)imgData andFileName:(NSString*)strFileName;
+(UIImage *)getCachedImage:(NSString*)imgName;
+(BOOL)checkIfImageIsCachedOrNot:(NSString*)imgName;

@end
