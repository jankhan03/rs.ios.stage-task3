#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    if(monthNumber <= 0 || monthNumber >= 13) {
        return nil;
    }
    NSArray * ourMounth = @[@"January", @"February", @"March", @"April", @"May", @"June", @"July", @"August", @"September", @"October", @"November", @"December"];
    return ourMounth[monthNumber - 1];
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    // создание строки для ретерна
    NSString * stringToReturn;
    // работа с ренжом
    NSRange mountRange = NSMakeRange(5, 2);
    NSString * stringToCheck = [date substringWithRange:mountRange];
    // перевод в лонг
    NSNumberFormatter * toLong1 = [[NSNumberFormatter alloc] init];
    [toLong1 setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber * myMount = [toLong1 numberFromString:stringToCheck];
    // сравнение
    if(myMount.longValue > 12 || myMount.longValue <= 0) {
        return 0;
    }
    
    // тож самое
    NSRange dayRange = NSMakeRange(8, 2);
    stringToReturn = [date substringWithRange:dayRange];
    NSNumberFormatter * toLong2 = [[NSNumberFormatter alloc] init];
    [toLong2 setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber * myNumber = [toLong2 numberFromString:stringToReturn];
        
    return myNumber.longValue;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    // создаем календарь
    NSCalendar *calendar = [NSCalendar currentCalendar];
    //создаем форматтер и делаем его русским
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setLocale: [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"]];
    // берем номер недели, при том первый денЬ(1-ВОСКР), 2 - понедельник
    NSInteger dayNumber = [calendar component:NSCalendarUnitWeekday fromDate:date];
    
    if (dayNumber) {
        return [[dateFormatter shortWeekdaySymbols] objectAtIndex:dayNumber - 1];
    }
    
    return nil;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSInteger dateWeek = [calendar component:NSCalendarUnitWeekOfYear fromDate:date];
    NSInteger currentWeek = [calendar component:NSCalendarUnitWeekOfYear fromDate:[NSDate now]];
    
    return dateWeek == currentWeek ? YES : NO;
    
}

@end
