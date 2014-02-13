//
//  CardGameViewController.m
//  CardGame
//
//  Created by Nykolas Lima on 1/29/14.
//  Copyright (c) 2014 Nykolas Lima. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

- (void)updateUI;
- (NSString *)getTitleForCard:(Card *)card;
- (UIImage *)getBackgroundForCard:(Card *)card;
@end

@implementation CardGameViewController

- (IBAction)touchCardButton:(UIButton *)sender {
    int choosenCardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:choosenCardIndex];
}

- (void)updateUI
{
    for (int i = 0; i < [self.cardButtons count]; i++) {
        UIButton *cardButton = self.cardButtons[i];
        Card *card = [self.game cardAtIndex:i];
        [cardButton setTitle:[self getTitleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self getBackgroundForCard:card] forState:UIControlStateNormal];
        if (card.isMatched) {
            cardButton.enabled = false;
        }
    }
}

- (NSString *)getTitleForCard:(Card *)card;
{
    if (card.chosen) {
        return card.contents;
    } else {
        return @"";
    }
}

- (UIImage *)getBackgroundForCard:(Card *)card
{
    if (card.chosen) {
        return [UIImage imageNamed:@"whiteCard"];
    } else {
        return [UIImage imageNamed:@"cardback"];
    }
}

- (Deck *)deck
{
    if (!_deck) {
        _deck = [[Deck alloc] init];
    }
    
    return _deck;
}

- (CardMatchingGame *)game
{
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:self.deck];
    }
    
    return _game;
}

@end
