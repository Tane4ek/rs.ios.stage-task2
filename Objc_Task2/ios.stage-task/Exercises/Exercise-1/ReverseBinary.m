#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
    
    int resuide;
    NSMutableString *myString = [[NSMutableString alloc] init];
    while (n != 0) {
        resuide = n % 2;
        n = (n - resuide)/ 2;
        NSString *ch = [@(resuide) stringValue];
        [myString appendString:ch];
    }
    while (myString.length !=8){
        [myString appendString:@"0"];
        
    }
    UInt8 reversInteger = 0;
    for (int i = 0; i < myString.length; ++i){
        char character = [myString characterAtIndex:i];
        if (character == '1') {
        reversInteger += pow(2, (myString.length - 1 - i));
        }
    }
    return reversInteger;
}
