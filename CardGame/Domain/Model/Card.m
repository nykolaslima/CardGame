//
//  Card.m
//  CardGame
//
//  Created by Nykolas Lima on 1/30/14.
//  Copyright (c) 2014 Nykolas Lima. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(Card *)card
{
    int score = 0;
    
    if ([card.contents isEqualToString:self.contents]) {
        return 1;
    }
    
    return score;
}

@end
