#import "NumberConverter.h"

@implementation NumberConverter

- (NSArray *)numberConverter:(NSNumber *)number {
    if (number == nil) {
        return @[];
    }
    
    NSString *numberStr = [[NSString alloc] initWithFormat: @"%@", number];
    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:[numberStr length]];
    
    for (int i = 0; i < [numberStr length]; i++) {
        NSRange range = NSMakeRange([numberStr length] - i - 1, 1);
        [result addObject:[numberStr substringWithRange:range]];
    }
    
    if (number.doubleValue < 0) {
        [result removeLastObject];
    }
    return result;
}

@end
