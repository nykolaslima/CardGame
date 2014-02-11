//
//  CardGameViewController.m
//  CardGame
//
//  Created by Nykolas Lima on 1/29/14.
//  Copyright (c) 2014 Nykolas Lima. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck *deck;

- (NSString *) getTitle:(Card *) card;
@end

@implementation CardGameViewController

- (void) setFlipCount:(int)flipCount {
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", flipCount];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    if (!_deck) {
        _deck = [[PlayingCardDeck alloc] init];
    }
    
    if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else {
        [sender setBackgroundImage:[UIImage imageNamed:@"whiteCard"]
                          forState:UIControlStateNormal];
        Card* card = [_deck drawRandomCard];
        [sender setTitle:[self getTitle:card]
                forState:UIControlStateNormal];
    }
    self.flipCount++;
}

- (NSString *) getTitle:(Card *)card
{
    NSString* title = @"=(";
    if (card) {
        title = card.contents;
    }
    
    return title;
}

@end
