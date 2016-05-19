//
//  main.m
//  NSString&_NSMutableString
//
//  Created by 曾偉亮 on 2015/4/27.
//  Copyright (c) 2015年 曾偉亮. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])

//NSString 不可變更
//NSMutableString 可變更

{
    @autoreleasepool
    {
        NSString *str_01=@"This_is_string_A";
        NSString *str_02=@"This_is_string_B";
        NSString *str_03;
        NSString *search;
        NSString *replace;
        NSRange locationstr;
        
        NSMutableString *mutablestr;
        
        //copy
        str_03=[NSString stringWithString:str_01];
        NSLog(@"str_03 = %@",str_03);
        mutablestr=[NSMutableString stringWithString:str_02];
        NSLog(@"mutablestr = %@",mutablestr);
        NSLog(@"=============================================================");
        
        //length of string
        NSLog(@"The length of str_01 = %lu",[str_01 length]);
        NSLog(@"The length of str_03 = %lu",[str_03 length]);
        NSLog(@"The length of mutablestr = %lu",[mutablestr length]);
        NSLog(@"=============================================================");
        
        //copy one string to the end of anthor
        str_03=[str_01 stringByAppendingString: str_02];
        NSLog(@"str_03 = %@",str_03);
        NSLog(@"=============================================================");
        
        //subString by difference ways
        str_03=[str_01 substringToIndex:4];
        NSLog(@"First 4 chars of str_01 = %@",str_03);
        
//        mutablestr=[str_01 substringToIndex:3];
//        NSLog(@"First 3 chars of str_01 = %@",mutablestr);
        
        str_03=[str_02 substringFromIndex:8];
        NSLog(@"Chars from index 8 of str_02 = %@",str_03);
        
        str_03=[[str_01 substringFromIndex:5]substringToIndex:11];
        NSLog(@"Chars from index 5 to index 10 of str_01 = %@",str_03);
//        
//        mutablestr=[str_01 substringToIndex:6];
//        NSLog(@"%@",mutablestr);
        
        str_03=[str_02 substringWithRange:NSMakeRange(5, 11)];
        NSLog(@"Chars from index 5 to index 10 of str_01 = %@",str_03);
        NSLog(@"=============================================================");
        
        //search string and it'slocation & length
        locationstr=[str_01 rangeOfString:@"string_A"];
        if(locationstr.location == NSNotFound)
        {
            NSLog(@"Can't find string_A");
        }
        else
        {
            NSLog(@"string_A is at index:%lu,length:%lu",locationstr.location,locationstr.length);
        }
         NSLog(@"=============================================================");
        
        //add string
        mutablestr=[NSMutableString stringWithString:str_01];
        [mutablestr insertString:@"Mutable" atIndex:8];
        NSLog(@"add Mutable on mutablestr:%@",mutablestr);
        [mutablestr insertString:@" and string_B" atIndex:mutablestr.length];//[mutablestr length]
        NSLog(@"addd ""and string_B""on mutablestr:%@",mutablestr);
        NSLog(@"=============================================================");
        
        //add one string to the end of anthor
        [mutablestr appendString:@" and string_C"];
        NSLog(@"%@",mutablestr);
        NSLog(@"=============================================================");
        
        //search & replace
        search =@"string_B";
        locationstr=[mutablestr rangeOfString:search];
        NSLog(@"string_B is at index:%lu,length:%lu",locationstr.location,locationstr.length);
        
        replace=@"Mutablestring_b";
        
        [mutablestr replaceCharactersInRange:NSMakeRange(28, 8) withString:replace];
        NSLog(@"%@",mutablestr);
        
        search=@"Mutablestring_b";
        locationstr=[mutablestr rangeOfString:search];
        replace=@"Mutablestring_B";
        [mutablestr replaceCharactersInRange:locationstr withString:replace];
        NSLog(@"%@",mutablestr);
        NSLog(@"=============================================================");
        
        //delete
        locationstr=[mutablestr rangeOfString:@"and string_C"];
        [mutablestr deleteCharactersInRange:locationstr];
        NSLog(@"%@",mutablestr);

    }
    return 0;
}
