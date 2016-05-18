//
//  NSData+Utils.m
//

#import "NSData+Utils.h"

@implementation NSData (Utils)

+(id)dataFromLocalJSON:(NSString*)jsonFileName
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:jsonFileName ofType:@"json"];
    NSData *JSONData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:nil];
    id responseObject = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableContainers error:nil];
    return responseObject;
}

@end
