//
//  Deck.h
//  CardGame
//
//  Created by Nykolas Lima on 1/30/14.
//  Copyright (c) 2014 Nykolas Lima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void) addCard: (Card *)card atTop:(BOOL)atTop;

- (void) addCard: (Card *)card;

- (Card *) drawRandomCard;

@end
