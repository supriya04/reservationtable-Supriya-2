//
//  DateConversion.m
//  ecaHUB
//
//  Created by promatics on 3/18/15.
//  Copyright (c) 2015 promatics. All rights reserved.
//

#import "DateConversion.h"

@implementation DateConversion

+(id)dateConversionManager
{
    static DateConversion *newDateConversion = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken,^{
        
        newDateConversion=[[self alloc]init];
    });
    
    NSLog(@"connection %@ self %@",newDateConversion, self);
    
    return newDateConversion;
}

-(NSString *)convertDate:(NSString *)date {
    
    NSArray *dateArray = [date componentsSeparatedByString:@" "];
    
    NSString *dateStr = [dateArray objectAtIndex:0];
    
    NSArray *dateComponentArray = [dateStr componentsSeparatedByString:@"-"];
    
    NSString *months;
    
    int month = [[dateComponentArray objectAtIndex:1] intValue];
    
    switch (month) {
            
        case 01: {
            
            months = @"Jan";
            break;
        }
        case 02:{
            
            months = @"Fab";
            break;
        }
        case 03:{
            
            months = @"Mar";
            break;
        }
        case 04:{
            
            months = @"Apr";
            break;
        }
        case 05:{
            
            months = @"May";
            break;
        }
        case 06:{
            
            months = @"Jun";
            break;
        }
        case 07:{
            
            months = @"Jul";
            break;
        }
        case 8:{
            
            months = @"Aug";
            break;
        }
        case 9:{
            
            months = @"Sept";
            break;
        }
        case 10:{
            
            months = @"Oct";
            break;
        }
        case 11:{
            
            months = @"Nov";
            break;
        }
        case 12:{
            
            months = @"Dec";
            break;
        }
            
        default:
            
            months = @"00";
            break;
    }
    
    NSString *day = [dateComponentArray objectAtIndex:2];
    
    NSString *year = [dateComponentArray objectAtIndex:0];
    
    day = [day stringByAppendingString:@" "];
    
    day = [day stringByAppendingString:months];
    
    day = [day stringByAppendingString:@" "];
    
    day = [day stringByAppendingString:year];

    return day;
}

-(NSString *)getDateFromString:(NSString *)string {
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSTimeZone *gmt = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    
    [dateFormat setTimeZone:gmt];
    
    NSDate *ExpDate = [dateFormat dateFromString:string];
    
 //  NSLog(@"expdate=%@",ExpDate);
    
    /****souvikchange for currentdate****/
    
  //  NSLog(@"expdate=%@",[NSDate date ]);
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [calendar components:(NSCalendarUnitDay|NSCalendarUnitWeekOfMonth|NSCalendarUnitMonth|NSCalendarUnitYear|NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond) fromDate:ExpDate toDate:[NSDate date] options:0];
    
    NSString *time;
    
    if(components.year!=0) {
        
        if(components.year==1) {
            
            time=[NSString stringWithFormat:@"%ld year ago",(long)components.year];
            
        } else {
            
            time=[NSString stringWithFormat:@"%ld years ago",(long)components.year];
        }
   
    } else if(components.month!=0) {
        
        if(components.month==1)
        {
            time=[NSString stringWithFormat:@"%ld month ago",(long)components.month];
        }
        else{
            
            time=[NSString stringWithFormat:@"%ld months ago",(long)components.month];
        }
    }
    
    else if(components.weekOfMonth!=0)
        
    {
        
        if(components.weekOfMonth==1)
            
        {
            
            time=[NSString stringWithFormat:@"%ld week ago",(long)components.weekOfMonth];
            
        }
        
        else{
            
            time=[NSString stringWithFormat:@"%ld weeks ago",(long)components.weekOfMonth];
            
        }
    }
    
    else if(components.day!=0)
        
    {
        
        if(components.day==1)
            
        {
            
            time=[NSString stringWithFormat:@"%ld day ago",(long)components.day];
            
        }
        
        else{
            
            time=[NSString stringWithFormat:@"%ld days ago",(long)components.day];
        }
    }
    
    else if(components.hour!=0)
        
    {
        
        if(components.hour==1)
            
        {
            
            time=[NSString stringWithFormat:@"%ld hour ago",(long)components.hour];
            
        }
        
        else{
            
            time=[NSString stringWithFormat:@"%ld hours ago",(long)components.hour];
            
        }
    }
    
    else if(components.minute!=0)
        
    {
        
        if(components.minute==1)
            
        {
            
            time=[NSString stringWithFormat:@"Just Now"];
            
        } else{
            
            time=[NSString stringWithFormat:@"%ld mins ago",(long)components.minute];
            
        }
    
    } else {
        
        time = @"Just Now";
    }
//    else if(components.second>=0){
//
//        if(components.second==0)
//        {
//            time=[NSString stringWithFormat:@"1 sec"];
//            
//        }
//        else{
//            
//            time=[NSString stringWithFormat:@"%ld secs",(long)components.second];
//        }
//    }
  //  NSLog(@"finaltime=%@",time);

    return [NSString stringWithFormat:@"%@",time];
}


-(NSString *)convertTime:(NSString *)time {
    
    NSArray *timeArry = [time componentsSeparatedByString:@":"];
    NSString *hourStr = [timeArry objectAtIndex:0];
    NSString *mintStr = [timeArry objectAtIndex:1];
    NSString *timestr;
    
    int hour = hourStr.intValue;
    
    if(hour < 12){
        
        hourStr = [hourStr stringByAppendingString:@":"];
        mintStr = [mintStr stringByAppendingString:@" AM"];
        timestr = [hourStr stringByAppendingString:mintStr];
        
    } else {
        
        if(hour == 12){
            
            hour = 12;
            
        } else {
            
            hour = hour - 12;
            
        }
        
        if(hour < 10){
            hourStr = [@(hour) stringValue];
            hourStr = [@"0" stringByAppendingString:hourStr];
            hourStr = [hourStr stringByAppendingString:@":"];
            mintStr = [mintStr stringByAppendingString:@" PM"];
            
        } else{
            
            hourStr = [@(hour) stringValue];
            hourStr = [hourStr stringByAppendingString:@":"];
            mintStr = [mintStr stringByAppendingString:@" PM"];
        }
        
        timestr = [hourStr stringByAppendingString:mintStr];
    }
    
    return timestr;
    
}

-(NSString *)convertDate_Time:(NSString *)string {
    
    NSArray *array_str = [string componentsSeparatedByString:@" "];
    
    NSString *dateStr = [array_str objectAtIndex:0];
    
    NSString *timeStr = [array_str objectAtIndex:1];
    
    dateStr = [self convertDate:dateStr];
    
    timeStr = [self convertTime:timeStr];
    
    NSString *date_time_str = [dateStr stringByAppendingString:[NSString stringWithFormat:@" %@", timeStr]];
    
    return date_time_str;
}

@end
