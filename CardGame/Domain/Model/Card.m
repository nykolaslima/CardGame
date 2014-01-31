//
//  Card.m
//  CardGame
//
//  Created by Nykolas Lima on 1/30/14.
//  Copyright (c) 2014 Nykolas Lima. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(NSArray *)cards
{
    int score = 0;
    
    for (Card *card in cards) {
        if ([card.contents isEqualToString:self.contents]) {
            score++;
        }
    }
    
    return score;
}

@end
