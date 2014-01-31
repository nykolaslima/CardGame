//
//  PlayingCard.h
//  CardGame
//
//  Created by Nykolas Lima on 1/30/14.
//  Copyright (c) 2014 Nykolas Lima. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger) maxRank;

@end
