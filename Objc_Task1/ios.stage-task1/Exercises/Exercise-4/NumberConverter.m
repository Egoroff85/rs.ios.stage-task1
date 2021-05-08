#import "NumberConverter.h"

@implementation NumberConverter

- (NSArray *)numberConverter:(NSNumber *)number {
    if (number == nil) {
        return @[];
    }
    
    NSString *num_str = [[NSString alloc] initWithFormat: @"%@", number];

    NSMutableString *reversedString = [NSMutableString new];
    while ([num_str length] != [reversedString length]) {
        NSRange range = NSMakeRange([num_str length] - [reversedString length] - 1, 1);
        [reversedString appendString: [num_str substringWithRange:range]];
    }
    
    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:[reversedString length]];
    for (int i = 0; i < [reversedString length]; i++) {
        NSString *strChar  = [NSString stringWithFormat:@"%c", [reversedString characterAtIndex:i]];
        [result addObject:strChar];
    }
    
    if (number.doubleValue < 0) {
        [result removeLastObject];
    }
    
    return result;
}

@end
