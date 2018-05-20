//
//  ImageCaching.m
//  InstagramClone
//
//  Created by Ravi Agrawal on 20/05/18.
//  Copyright © 2018 Ravi Agrawal. All rights reserved.
//

#import "ImageCaching.h"

@implementation ImageCaching

#pragma mark - Chaching Images

+(NSString *)documentsPathForFileName:(NSString *)name
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    
    return [documentsPath stringByAppendingPathComponent:name];
}

+(void)saveImageForCaching:(NSData *)imgData andFileName:(NSString*)strFileName
{
    NSString *filePath = [self documentsPathForFileName:strFileName];
    [imgData writeToFile:filePath atomically:YES];
}

+(UIImage *)getCachedImage:(NSString*)imgName
{
    NSString *filePath = [self documentsPathForFileName:imgName];
    return [UIImage imageWithData:[NSData dataWithContentsOfFile:filePath]];
}

+(BOOL)checkIfImageIsCachedOrNot:(NSString*)imgName
{
    NSString *filePath = [self documentsPathForFileName:imgName];
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:filePath];
    return fileExists;
}

@end
