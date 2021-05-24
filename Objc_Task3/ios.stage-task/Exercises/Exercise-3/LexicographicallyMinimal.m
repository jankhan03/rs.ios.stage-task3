#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {

    // создаем изменяемые строки на базе строк
    NSMutableString *mutableString1 = [NSMutableString stringWithString:string1];
    NSMutableString *mutableString2 = [NSMutableString stringWithString:string2];
    NSMutableString *result = [NSMutableString new];
    
    while ((mutableString1.length != 0) && (mutableString2.length != 0)) {
        [mutableString1 characterAtIndex:0];
        
        if ([mutableString1 UTF8String][0] <= [mutableString2 UTF8String][0]) {
            [result appendFormat:@"%c", [mutableString1 characterAtIndex:0]];
            [mutableString1 deleteCharactersInRange:NSMakeRange(0, 1)];
        }
        else {
            [result appendFormat:@"%c", [mutableString2 characterAtIndex:0]];
            [mutableString2 deleteCharactersInRange:NSMakeRange(0, 1)];
        }
    }
    mutableString1.length == 0 ? [result appendString:mutableString2] : [result appendString:mutableString1];
    
    return result;
}

@end
