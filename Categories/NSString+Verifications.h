//
//  NSString+Verifications.h
//

#import <Foundation/Foundation.h>

@interface NSString (Verifications)

+ (BOOL)isAllDigits:(NSString*)string;
+ (BOOL)isAllNegativeOrPositiveDigits:(NSString*)string;
+ (BOOL)isEmptyString:(NSString*)string;
+ (BOOL)isStringNullOrEmpty:(NSString *)string;
+ (BOOL)isValidEmailFormat:(NSString*)string;
+ (BOOL)isThereOnlyOneNegativeSign:(NSString *)string;
+ (BOOL)isFloatingValue:(NSString *)stringNumber withDecimals:(NSInteger)numberOfDecimals;
+ (BOOL)isFloatingValue:(NSString *)numericString;

@end
