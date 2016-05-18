//
//  NSDate+Utils.h
//

#import <Foundation/Foundation.h>

@interface NSDate (Utils)

+ (NSDate *) dateWithOffsetInSeconds:(NSInteger)seconds fromDate:(NSDate *)date;

- (NSDate *) beginningOfToday;
- (NSDate *) endOfToday;

- (NSDate *) beginningOfWeek;
- (NSDate *) endOfWeek;

- (NSDate *) beginningOfMonth;
- (NSDate *) endOfMonth;

- (NSDate *) beginningOfYear;
- (NSDate *) endOfYear;

@end
