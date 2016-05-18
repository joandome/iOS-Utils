//
//  NSString+Verifications.m
//

#import "NSString+Verifications.h"

@implementation NSString (Verifications)

+ (BOOL)isAllDigits:(NSString*)string
{
    NSCharacterSet* nonNumbers = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSRange r = [string rangeOfCharacterFromSet: nonNumbers];
    return r.location == NSNotFound;
}

+ (BOOL)isAllNegativeOrPositiveDigits:(NSString*)string
{
    NSCharacterSet* nonNumbers = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSMutableCharacterSet *nonNumbersButNegativeSign = [nonNumbers mutableCopy];
    [nonNumbersButNegativeSign removeCharactersInString:@"-"];
    
    NSRange r = [string rangeOfCharacterFromSet: nonNumbersButNegativeSign];
    return r.location == NSNotFound;
}

+ (BOOL)isEmptyString:(NSString*)string
{
    if([string length] == 0) {
        return YES;
    } else if([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0) {
        return YES;
    }
    return NO;
}

+(BOOL)isStringNullOrEmpty:(NSString *)string
{
    return ([NSString isEmptyString:string] || [string isMemberOfClass:[NSNull class]] || [string isEqualToString:@"null"]);
}

+(BOOL)isValidEmailFormat:(NSString*)string
{
    NSString *regexForEmailAddress = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailValidation = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexForEmailAddress];
    return [emailValidation evaluateWithObject:string];
}

+ (BOOL)isThereOnlyOneNegativeSign:(NSString *)string {
    
    NSMutableString *mutableString = [string mutableCopy];
    
    NSInteger numberOfNegativeSigns = [mutableString replaceOccurrencesOfString:@"-"
                                                                     withString:@"-"
                                                                        options:NSLiteralSearch
                                                                          range:NSMakeRange(0, [string length])];
    
    if (numberOfNegativeSigns < 1) {
        return YES;
        
    } else if (numberOfNegativeSigns == 1) {
        NSRange signRange = [string rangeOfString:@"-"];
        return signRange.location == 0;
    }
    return NO;
}

+ (BOOL)isFloatingValue:(NSString *)stringNumber withDecimals:(NSInteger)numberOfDecimals
{
    if (![NSString isFloatingValue:stringNumber])
        return NO;
    
    // CHECK THE NUMBER OF DECIMALS COMPARED TO NUMBEROFDECIMALS
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    NSString *decimalSymbol = [formatter decimalSeparator];

    NSArray *groupsOfStrings = [stringNumber componentsSeparatedByString:decimalSymbol];
    
    NSInteger times = [groupsOfStrings count] -1;
    
    if (times > 1) {
        return NO;
    }
    
    if ([groupsOfStrings count] > 1) {
        
        NSString *decimals = [groupsOfStrings lastObject];
        
        if ([decimals length] > numberOfDecimals) {
            return NO;
        }
    }
    return YES;
}

+ (BOOL)isFloatingValue:(NSString *)numericString
{
    if (![NSString isThereOnlyOneNegativeSign:numericString])
        return NO;
    
    // CHECK THE NUMBER OF DECIMAL SEPARATORS
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    NSString *decimalSymbol = [formatter decimalSeparator];
    
    long countdots = [[numericString componentsSeparatedByString:decimalSymbol] count] -1;
    if (countdots > 1)
        return false;

    NSString *decimalValue = [[NSLocale currentLocale] objectForKey:NSLocaleDecimalSeparator];
    
    NSString *s = [NSString stringWithFormat:@"%@%@%@",@"0123456789",decimalValue,@"-"];
    
    NSCharacterSet *numbersOnly = [NSCharacterSet characterSetWithCharactersInString:s];
    NSCharacterSet *characterSetFromTextField = [NSCharacterSet characterSetWithCharactersInString:numericString];
    
    BOOL stringIsValid = [numbersOnly isSupersetOfSet:characterSetFromTextField];
    return stringIsValid;
}

@end
