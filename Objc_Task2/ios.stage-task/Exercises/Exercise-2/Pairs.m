#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    
    int count = 0;
    for(int i = 0 ; i < [array count] - 1; i++) {
        NSNumber *value1 = [array objectAtIndex:i];
        
        for (int j = i+1; j < [array count]; j++) {
            NSNumber *value2 = [array objectAtIndex:j];
            
            int someNumber = value1.integerValue - value2.integerValue;
            if (someNumber < 0) {
                someNumber = someNumber * (-1);
            }
            if (someNumber == number.integerValue) {
                count += 1;
        }
            
            }
    }
    return count;
}

@end
