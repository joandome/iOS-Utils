
#import <Foundation/Foundation.h>

#define SERVER_DATE_FORMAT @"yyyy-MM-dd'T'HH:mm:ssZ"

@interface NSDate (Locale)

+ (NSDate *)localeDateFromServerDateString:(NSString *)dateString;
+ (NSString *)localeDateStringFromServerDateString:(NSString *)dateString;
+ (NSString *)localeDateStringFromServerDateString:(NSString *)dateString withFormatTemplate:(NSString*)formatTemplate;
+ (NSString *)localeDateStringFromDate:(NSDate *)date;
+ (NSString *)monthNameFromDate:(NSDate *)date;
+ (NSDate *)localCurrentDate;

+ (NSString *)currentUTCDateWithServerDateFormat;

@end