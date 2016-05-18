//
//  NSString+Numbers.h
//

#import <Foundation/Foundation.h>

@interface NSString (Numbers)

+(NSString*)deciamlFormatWithTrailingZeros:(NSNumber*)number;
+(NSString*)decimalFormatWithTrailingZeros:(CGFloat)number andNumberOfDecimals:(NSInteger)numberDecimals;
-(CGFloat)floatingValue;

@end
