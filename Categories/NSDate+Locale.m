
#import "NSDate+Locale.h"

#define EMPTY_VALUE @" "

@implementation NSDate (Locale)

+ (NSDate *)localeDateFromServerDateString:(NSString *)dateString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:SERVER_DATE_FORMAT];
    
    return [formatter dateFromString:dateString];
}

+ (NSString *)localeDateStringFromServerDateString:(NSString *)dateString
{
    return [NSDate localeDateStringFromServerDateString:dateString withFormatTemplate:@"dd/MM/yy HH:mm:ss"];
}

+ (NSString *)localeDateStringFromServerDateString:(NSString *)dateString withFormatTemplate:(NSString*)formatTemplate
{
    if (dateString == nil)
        return EMPTY_VALUE;
    
    NSDate *date = [NSDate localeDateFromServerDateString:dateString];
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    
    NSString *localeFormatString = [NSDateFormatter dateFormatFromTemplate:formatTemplate options:0 locale:dateFormatter.locale];
    dateFormatter.dateFormat = localeFormatString;
    
    NSString *localizedDate = [dateFormatter stringFromDate:date];
    
    return localizedDate;
}

+ (NSString *)localeDateStringFromDate:(NSDate *)currentDate {
    
    if (currentDate == nil)
        return EMPTY_VALUE;

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    
    NSString *stringFromDate = [formatter stringFromDate:currentDate];
    
    NSDate *date = [NSDate localeDateFromServerDateString:stringFromDate];
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    
    NSString *localeFormatString = [NSDateFormatter dateFormatFromTemplate:@"dd/MM/yy - HH:mm:ss" options:0 locale:dateFormatter.locale];
    dateFormatter.dateFormat = localeFormatString;
    
    NSString *localizedDate = [dateFormatter stringFromDate:date];

    return localizedDate;
}

+ (NSString *)monthNameFromDate:(NSDate *)date
{
    if (!date)
        return @"n/a";
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"MMM"];
    return [[df monthSymbols] objectAtIndex:([[df stringFromDate:date] integerValue] - 1)];
}

+ (NSDate *)localCurrentDate {
    
    NSDate *currentGMTDate = [self date];
    NSTimeZone *currentTimeZone = [NSTimeZone localTimeZone];
    NSInteger offsetInSeconds = currentTimeZone.secondsFromGMT;
    NSDate *localDate = [currentGMTDate dateByAddingTimeInterval:offsetInSeconds];
    
    return localDate;
}

+ (NSString *)currentUTCDateWithServerDateFormat {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
    [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    
    return [formatter stringFromDate:[self date]];
}

@end
