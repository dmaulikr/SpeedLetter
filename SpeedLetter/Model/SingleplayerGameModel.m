//
//  GameModel.m
//  SpeedLetter
//
//  Created by Tobias Wermuth on 27/02/14.
//  Copyright (c) 2014 nextdoor studios. All rights reserved.
//

#import "SingleplayerGameModel.h"

@implementation SingleplayerGameModel
- (double)getPassedTime
{
    return [self.timeStamp timeIntervalSinceNow] * -1.0;
}

- (void)letterPressed:(NSString *)letter
{
    if ([letter isEqualToString:self.currentLetter]) {
        for (int i = 0; i < self.buttonLetters.count; i++) {
            [self.buttonLetters setObject:@"" atIndexedSubscript:i];
        }
        
        [self popLetter];
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
}

- (void)startGameWithMode:(NSString *)mode
{
    self.buttonLetters = [[NSMutableArray alloc] initWithObjects:@"", @"", @"", @"", nil];
    
    if ([mode isEqualToString:@"Simpel"]) {
        self.currentLetterStorage = [[NSMutableArray alloc] initWithArray:self.alphabet];
    } else if ([mode isEqualToString:@"Complex"]) {
        self.currentLetterStorage = [self shuffleMutableArray:[[NSMutableArray alloc] initWithArray:self.alphabet]];
    }
    
    self.timeStamp = [NSDate date];
}

- (NSMutableArray *)shuffleMutableArray:(NSMutableArray *)array
{
    NSUInteger count = [array count];
    for (NSUInteger i = 0; i < count; ++i) {
        // Select a random element between i and end of array to swap with.
        NSInteger nElements = count - i;
        NSInteger n = arc4random_uniform((int)nElements) + i;
        [array exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
    
    return array;
}

- (NSArray *)alphabet
{
    if (!_alphabet)
        _alphabet = [@"A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z" componentsSeparatedByString:@"|"];
    
    return _alphabet;
}

@end
