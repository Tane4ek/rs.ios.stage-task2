#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    NSMutableString *mySrting = [[NSMutableString alloc] init];
    NSMutableArray *array = [numbersArray mutableCopy];
    if ([array count] == 0) {
        [mySrting appendString:@" "];
        NSLog(@"countstring %@", mySrting);
    }
    if ([array count] != 0) {
        while ([array count] < 4) {
        [array addObject:@0];
        }
    }
    NSLog(@"new array%@", array);
    if ([array count] > 4) {
        while ([array count] != 4) {
            [array removeLastObject];
        }
    }
    NSLog(@"new array%@", array);
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
        NSLog(@"num %d", num);
        NSMutableString *str = [[NSMutableString alloc] initWithFormat:@"%d",num];
        NSLog(@"str %@", str);
        [str insertString:@"." atIndex:str.length];
        NSLog(@" newstr %@", str);
        [mySrting insertString:str atIndex:mySrting.length];
        NSLog(@"mystring %@", mySrting);
    }
    NSLog(@"%@", mySrting);
    [mySrting deleteCharactersInRange:NSMakeRange(mySrting.length -1, 1)];

    
    return mySrting;
}

@end
