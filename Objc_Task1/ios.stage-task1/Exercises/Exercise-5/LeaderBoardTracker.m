#import "LeaderBoardTracker.h"

@interface LeaderBoardTracker()

@property (nonatomic, strong) NSArray <NSNumber *> *playersPlaces;

@end

@implementation LeaderBoardTracker

- (NSArray <NSNumber *> *)trackLeaderBoard:(NSArray <NSNumber *> *)rankedArray
                               playerArray:(NSArray <NSNumber *> *)playerArray {
    
    if ([playerArray count] == 0) {
        return @[];
    }
    
    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:[playerArray count]];
    
    if ([rankedArray count] == 0) {
        for (int i = 0; i < [playerArray count]; i++) {
            [result addObject:@1];
        }
        return result;
    }
    
    NSArray *sortedRanked = [[[rankedArray sortedArrayUsingSelector:@selector(compare:)] reverseObjectEnumerator] allObjects];
    NSOrderedSet *rankedSet = [[NSOrderedSet alloc] initWithArray:sortedRanked];
    
    for (NSNumber *playerScore in playerArray) {
        BOOL isAdded = NO;
        for (int i = 0; i < [rankedSet count]; i++) {
            if ([playerScore doubleValue] >= [[rankedSet objectAtIndex:i] doubleValue]) {
                [result addObject:@(i + 1)];
                isAdded = YES;
                break;
            }
        }
        if (!isAdded) {
            [result addObject:@([rankedSet count] + 1)];
        }
    }
    return result;
}

@end
