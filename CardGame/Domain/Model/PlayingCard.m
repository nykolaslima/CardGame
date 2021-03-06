//
//  PlayingCard.m
//  CardGame
//
//  Created by Nykolas Lima on 1/30/14.
//  Copyright (c) 2014 Nykolas Lima. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit;

- (NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

- (int)match:(NSArray *)cards
{
    int score = 0;
    if ([cards count] > 1) return score;
    
    PlayingCard *otherCard = [cards firstObject];
    if (otherCard.rank == self.rank) {
        score = 4;
    } else if ([otherCard.suit isEqualToString:self.suit]) {
        score = 1;
    }
    
    return score;
}

- (NSString *) suit
{
    return _suit ? _suit : @"?";
}

- (void) setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (void) setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

+ (NSArray *)validSuits
{
    return @[@"♥",@"♦",@"♠",@"♣"];
}

+ (NSUInteger) maxRank
{
    return [[PlayingCard rankStrings] count] - 1;
}

+ (NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

@end
