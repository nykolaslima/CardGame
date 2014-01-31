//
//  PlayingCardDeck.m
//  CardGame
//
//  Created by Nykolas Lima on 1/31/14.
//  Copyright (c) 2014 Nykolas Lima. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (instancetype)init
{
    self = [super init];
    if (!self) return self;
    
    for (NSString *suit in [PlayingCard validSuits]) {
        for (unsigned rank = 1; rank <= [PlayingCard maxRank]; rank++) {
            PlayingCard *card = [[PlayingCard alloc] init];
            card.suit = suit;
            card.rank = rank;
            [self addCard:card];
        }
    }
    
    return self;
}

@end
