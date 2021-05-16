#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    NSMutableString *mySrting = [[NSMutableString alloc] init];
    NSMutableArray *array = [numbersArray mutableCopy];
    if ([array count] == 0) {
        [mySrting appendString:@" "];
    }
    if ([array count] != 0) {
        while ([array count] < 4) {
        [array addObject:@0];
        }
    }
    if ([array count] > 4) {
        while ([array count] != 4) {
            [array removeLastObject];
        }
    }
    int num;
    for (NSNumber* number in array) {
        num = number.intValue;
        if (num < 0) {
            return @"Negative numbers are not valid for input.";
            break;
        }
        if (num > 255) {
            return @"The numbers in the input array can be in the range from 0 to 255.";
            break;
        }
        NSMutableString *str = [[NSMutableString alloc] initWithFormat:@"%d",num];
        [str insertString:@"." atIndex:str.length];
        [mySrting insertString:str atIndex:mySrting.length];
    }
    [mySrting deleteCharactersInRange:NSMakeRange(mySrting.length -1, 1)];

    return mySrting;
}

@end
