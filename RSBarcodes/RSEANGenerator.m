//
//  RSEANGenerator.m
//  RSEarcodes
//
//  Created by zhangxi on 14-1-6.
//  http://zhangxi.me
//  Copyright (c) 2014年 P.D.Q. All rights reserved.
//

#import "RSEANGenerator.h"

@interface RSEANGenerator ()

@property (nonatomic, strong) NSArray *types;

@property (nonatomic, strong) NSArray *map;

@end

@implementation RSEANGenerator

- (id)init
{
    self = [super init];
    if (self) {
        self.types = @[@"OOOOOO",
                       @"OOOOOO",
                       @"OOEOEE",
                       @"OOEEOE",
                       @"OEOOEE",
                       @"OEEOOE",
                       @"OEEEOO",
                       @"OEOEOE",
                       @"OEOEEO",
                       @"OEEOEO"];
        
        self.map = @[@{@"O" : @"0001101", @"E" : @"0100111", @"R" : @"1110010"},
                     @{@"O" : @"0011001", @"E" : @"0110011", @"R" : @"1100110"},
                     @{@"O" : @"0010011", @"E" : @"0011011", @"R" : @"1101100"},
                     @{@"O" : @"0111101", @"E" : @"0100001", @"R" : @"1000010"},
                     @{@"O" : @"0100011", @"E" : @"0011101", @"R" : @"1011100"},
                     @{@"O" : @"0110001", @"E" : @"0111001", @"R" : @"1001110"},
                     @{@"O" : @"0101111", @"E" : @"0000101", @"R" : @"1010000"},
                     @{@"O" : @"0111011", @"E" : @"0010001", @"R" : @"1000100"},
                     @{@"O" : @"0110111", @"E" : @"0001001", @"R" : @"1001000"},
                     @{@"O" : @"0001011", @"E" : @"0010111", @"R" : @"1110100"}];
    }
    return self;
}

- (BOOL)isContentsValid:(NSString *)contents
{
    if ([super isContentsValid:contents] && contents.length == self.length) {
        int sum_odd = 0;
        int sum_even = 0;
        
        for (int i = 0; i < (self.length - 1); i++) {
            int digit = [[contents substringWithRange:NSMakeRange(i, 1)] intValue];
            if (i % 2 == 1) {
                sum_even += digit;
            } else {
                sum_odd += digit;
            }
        }
        int a = (10 - (sum_even + sum_odd * 3) % 10);
        return [[contents substringFromIndex:contents.length - 1] intValue] == a;
    }
    return NO;
}

- (NSString *)initiator
{
    return @"101";
}

- (NSString *)terminator
{
    return @"101";
}

- (NSString *)centerGuardPattern
{
    return @"01010";
}

@end
