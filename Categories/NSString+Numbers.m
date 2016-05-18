//
//  NSString+Numbers.m
//

#import "NSString+Numbers.h"

@implementation NSString (Numbers)

+(NSString*)deciamlFormatWithTrailingZeros:(NSNumber*)number
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;

    return [formatter stringFromNumber:number];
}

+(NSString*)decimalFormatWithTrailingZeros:(CGFloat)number andNumberOfDecimals:(NSInteger)numberDecimals
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    formatter.maximumFractionDigits = numberDecimals;
    
    return [formatter stringFromNumber:@(number)];
}

-(CGFloat)floatingValue
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    NSNumber *number = [formatter numberFromString:self];
    return [number floatValue];
}

@end
