//
//  CardMatchingGame.m
//  CardGame
//
//  Created by Nykolas Lima on 2/10/14.
//  Copyright (c) 2014 Nykolas Lima. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards;

- (void)matchCardsWithCard:(Card *)card;
@end

@implementation CardMatchingGame

- (NSMutableArray *) cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;
{
    self = [super init];
    if (!self) return nil;
    
    for (int i = 0; i < count; i++) {
        Card *card = [deck drawRandomCard];
        if (card) {
            [self.cards addObject:card];
        } else {
            self = nil;
            break;
        }
    }
    
    return self;
}

#define MISMATCH_PENALTY 2
#define COST_TO_CHOOSE 1
- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (!card.isChosen) {
            card.chosen = NO;
        } else {
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
            [self matchCardsWithCard:card];
        }
    }
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    if (index < [self.cards count]) {
        return self.cards[index];
    } else {
        return nil;
    }
}

- (void)matchCardsWithCard:(Card *)card
{
    for (Card *otherCard in self.cards) {
        if (otherCard.isChosen && !otherCard.isMatched) {
            int matchScore = [card match:@[otherCard]];
            if (matchScore) {
                self.score += matchScore;
                card.matched = YES;
                otherCard.matched = YES;
            } else {
                self.score -= MISMATCH_PENALTY;
                otherCard.chosen = NO;
            }
            break;
        }
    }
}

@end
