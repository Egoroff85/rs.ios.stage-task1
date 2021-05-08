#import "NSArray+MinRotated.h"

@implementation NSArray (MinRotated)

- (NSNumber *)minRotated {
    if (self.count == 0) {
        return nil;
    }
    long left = 0;
    long right = self.count - 1;
    long middle;
    while (left < right) {
        middle = left + (right - left) / 2;
        if ([[self objectAtIndex:left] doubleValue] < [[self objectAtIndex:right] doubleValue]) {
            return [self objectAtIndex:left];
        }
        if ([[self objectAtIndex:middle] doubleValue] >= [[self objectAtIndex:left] doubleValue]) {
            left = middle + 1;
        }
        else {
            right = middle;
        }
    }
    return [self objectAtIndex:left];
}

@end
