//
//  NSDate+Utils.m
//

#import "NSDate+Utils.h"

@implementation NSDate (Utils)

+ (NSDate *) dateWithOffsetInSeconds:(NSInteger)seconds fromDate:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *offset = [[NSDateComponents alloc] init];
    [offset setSecond:seconds];
    
    NSDate *newDay = [calendar dateByAddingComponents:offset toDate:date options:0];
    return newDay;
}

- (NSDate *) beginningOfToday
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *dateComponents = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute)
                                                   fromDate:self];
    
    dateComponents.hour = 0;
    dateComponents.minute = 0;
    dateComponents.second = 0;
    
    return [calendar dateFromComponents:dateComponents];
}

- (NSDate *) endOfToday
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *dateComponents = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute)
                                                   fromDate:self];
    
    dateComponents.hour = 23;
    dateComponents.minute = 59;
    dateComponents.second = 59;
    
    return [calendar dateFromComponents:dateComponents];
}

- (NSDate *) beginningOfWeek
{
    NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    cal.firstWeekday = 2;// set first week day to Monday
    
    NSDateComponents *dateComponents = [cal components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitWeekday)
                                              fromDate:self];
    [dateComponents setDay:([dateComponents day] - ((dateComponents.weekday + 5) % 7))];
    [dateComponents setHour:0];
    [dateComponents setMinute:0];
    [dateComponents setSecond:0];
    
    return [cal dateFromComponents:dateComponents];
}

- (NSDate *) endOfWeek
{
    NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *dateComponents = [cal components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekday | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute)
                                              fromDate:self];
    
    [dateComponents setDay:(6 + ([dateComponents day] - ((dateComponents.weekday + 5) % 7)))];
    dateComponents.hour = 23;
    dateComponents.minute = 59;
    dateComponents.second = 59;
    
    return [cal dateFromComponents:dateComponents];
}

- (NSDate *) beginningOfMonth
{
    NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *dateComponents = [cal components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekday | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute)
                                              fromDate:self];
    
    dateComponents.day = 1;
    dateComponents.hour = 0;
    dateComponents.minute = 0;
    dateComponents.second = 0;
    
    return [cal dateFromComponents:dateComponents];
}

- (NSDate *) endOfMonth
{
    NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *dateComponents = [cal components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekOfYear | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute)
                                              fromDate:self];
    
    dateComponents.month += 1;
    dateComponents.day = 0;
    dateComponents.hour = 23;
    dateComponents.minute = 59;
    dateComponents.second = 59;
    
    return [cal dateFromComponents:dateComponents];
}

- (NSDate *) beginningOfYear
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *dateComponents = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekOfYear | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute)
                                                   fromDate:self];
    
    dateComponents.month = 1;
    dateComponents.day = 1;
    dateComponents.hour = 0;
    dateComponents.minute = 0;
    dateComponents.second = 0;
    
    return [calendar dateFromComponents:dateComponents];
}

- (NSDate *) endOfYear
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *dateComponents = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekOfYear | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute)
                                                   fromDate:self];
    
    dateComponents.month = 12;
    dateComponents.day = 31;
    dateComponents.hour = 23;
    dateComponents.minute = 59;
    dateComponents.second = 59;
    
    return [calendar dateFromComponents:dateComponents];
}

@end
