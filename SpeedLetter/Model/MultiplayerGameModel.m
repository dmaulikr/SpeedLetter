//
//  MultiplayerGameModel.m
//  SpeedLetter
//
//  Created by Tobias Wermuth on 04/03/14.
//  Copyright (c) 2014 nextdoor studios. All rights reserved.
//

#import "MultiplayerGameModel.h"

@implementation MultiplayerGameModel
- (void)letterPressed:(NSString *)letter byPlayerNumber:(NSUInteger)playerNumber
{
    if ([letter isEqualToString:self.currentLetter] && [self getPassedTime] > 0.2) {
        for (int i = 0; i < self.buttonLetters.count; i++) {
            [self.buttonLetters setObject:@"" atIndexedSubscript:i];
        }
        
        if (playerNumber == 1)
            self.pointsPlayer1++;
        else if (playerNumber == 2)
            self.pointsPlayer2++;
        
        [self popLetter];
    } else {
        if (playerNumber == 1)
            self.pointsPlayer1--;
        else if (playerNumber == 2)
            self.pointsPlayer2--;
    }
}

- (void)popLetter
{
    self.currentLetter = self.currentLetterStorage.firstObject;
    [self.currentLetterStorage removeObjectAtIndex:0];
    
    [self.buttonLetters setObject:self.currentLetter
               atIndexedSubscript:arc4random_uniform((int)self.buttonLetters.count)];
    
    NSMutableArray *tempAlphabet = [[NSMutableArray alloc] initWithArray:self.alphabet];
    [tempAlphabet removeObject:self.currentLetter];
    
    for (int i = 0; i < self.buttonLetters.count; i++) {
        if ([[self.buttonLetters objectAtIndex:i] isEqualToString:@""]) {
            NSString *letter = [tempAlphabet objectAtIndex:arc4random_uniform((int)tempAlphabet.count)];
            [tempAlphabet removeObject:letter];
            
            [self.buttonLetters setObject:letter atIndexedSubscript:i];
        }
    }
    
    self.timeStamp = [NSDate date];
}
@end
