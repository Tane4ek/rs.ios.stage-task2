#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    
    NSMutableSet *setOfStrings = [[NSMutableSet alloc] init];
    NSMutableSet *setOfNumbers = [[NSMutableSet alloc] init];
    
    for (int i = 0; i < [array count]; ++i) {
        NSArray *subArray = array[i];
        if (![subArray isKindOfClass:[NSArray class]]) {
            return @[];
        }
        BOOL hasNumbers = NO;
        BOOL hasStrings = NO;
        for (int j = 0; j < [subArray count]; ++j) {
            if ([subArray[j] isKindOfClass: [NSNumber class]]) {
                [setOfNumbers addObject:subArray[j]];
                hasNumbers = YES;
            } else {
                [setOfStrings addObject:subArray[j]];
                hasStrings = YES;
            }
        }
        if ((hasNumbers == YES) && (hasStrings == YES)) {
            return @[];
        }
        
    }
    
    NSMutableArray *arrayOfNumbers = [NSMutableArray arrayWithArray:[setOfNumbers allObjects]];
    NSMutableArray *arrayOfStrings = [NSMutableArray arrayWithArray:[setOfStrings allObjects]];
    [arrayOfNumbers sortUsingComparator: ^(id obj1, id obj2) {
            if ([obj1 integerValue] > [obj2 integerValue]) {
                return (NSComparisonResult)NSOrderedDescending;
            }
         
            if ([obj1 integerValue] < [obj2 integerValue]) {
                return (NSComparisonResult)NSOrderedAscending;
            }
            return (NSComparisonResult)NSOrderedSame;
        }];
    
    NSArray *outputArray;
    
    if ([arrayOfStrings count] == 0) {
        outputArray = arrayOfNumbers;
    } else if ([arrayOfNumbers count] == 0) {
        [arrayOfStrings sortUsingComparator: ^(id obj1, id obj2) {
            NSComparisonResult res = [(NSString *)obj1 localizedCaseInsensitiveCompare:(NSString *)obj2];
            
            return res;
        }];
        outputArray = arrayOfStrings;
        
    } else {
        [arrayOfStrings sortUsingComparator: ^(id obj1, id obj2) {
            NSComparisonResult res = [(NSString *)obj1 localizedCaseInsensitiveCompare:(NSString *)obj2];
        if (res == NSOrderedAscending)
        res = NSOrderedDescending;
        else if (res == NSOrderedDescending)
            res = NSOrderedAscending;

            return res;
        }];
        outputArray = @[arrayOfNumbers, arrayOfStrings];
    }
    return outputArray;
}

@end
