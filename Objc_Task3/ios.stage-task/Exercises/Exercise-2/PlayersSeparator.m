#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    if([ratingArray count] < 3){
        return 0;
    }
    NSMutableArray *increaseTmp;
    NSMutableArray *decreaseTmp;
    NSMutableSet *finalSet = [NSMutableSet new];
    
    for (int i = 0; i < [ratingArray count] - 2; i++) {
        
        increaseTmp = [[NSMutableArray alloc] initWithObjects:ratingArray[i], nil];
        decreaseTmp = [[NSMutableArray alloc] initWithObjects:ratingArray[i], nil];
        
        for (int j = i+1; j < [ratingArray count]; j++) {
            if ([increaseTmp count] > 1) {
                [increaseTmp removeLastObject];
            }
            if ([decreaseTmp count] > 1) {
                [decreaseTmp removeLastObject];
            }
            
            if ([ratingArray[j] intValue] > [[increaseTmp lastObject] intValue]) {
                [increaseTmp addObject:[ratingArray objectAtIndex:j]];
            }
            else if ([[ratingArray objectAtIndex:j] intValue] < [[decreaseTmp lastObject] intValue]) {
                [decreaseTmp addObject:[ratingArray objectAtIndex:j]];
            }
            for (int k = j+1; k < [ratingArray count]; k++) {
                if ([ratingArray[k] intValue] > [[increaseTmp lastObject] intValue]) {
                    [increaseTmp addObject:[ratingArray objectAtIndex:k]];
                }
                else if ([[ratingArray objectAtIndex:k] intValue] < [[decreaseTmp lastObject] intValue]) {
                    [decreaseTmp addObject:[ratingArray objectAtIndex:k]];
                }
                
                if ([increaseTmp count] > 2) {
                    [finalSet addObject: [[increaseTmp valueForKey:@"description"] componentsJoinedByString:@""]];
                    [increaseTmp removeLastObject];
                }
                
                if ([decreaseTmp count] > 2) {
                    [finalSet addObject: [[decreaseTmp valueForKey:@"description"] componentsJoinedByString:@""]];
                    [decreaseTmp removeLastObject];
                }
            }
        }
    }
    return [finalSet count];
    
}

@end
