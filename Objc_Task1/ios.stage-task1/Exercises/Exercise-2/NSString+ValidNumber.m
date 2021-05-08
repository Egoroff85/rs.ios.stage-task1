#import "NSString+ValidNumber.h"

@implementation NSString (ValidNumber)

- (BOOL)isValidNumber {
    NSNumberFormatter *numFormatter = [[NSNumberFormatter alloc] init];
    BOOL isNumber = [numFormatter numberFromString:self] != nil;
    return isNumber;
}

@end
