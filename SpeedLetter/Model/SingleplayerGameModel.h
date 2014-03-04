//
//  GameModel.h
//  SpeedLetter
//
//  Created by Tobias Wermuth on 27/02/14.
//  Copyright (c) 2014 nextdoor studios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingleplayerGameModel : NSObject
@property (strong, nonatomic) NSArray *alphabet;
@property (strong, nonatomic) NSMutableArray *currentLetterStorage;
@property (strong, nonatomic) NSString *currentLetter;
@property (strong, nonatomic) NSMutableArray *buttonLetters;
@property (strong, nonatomic) NSDate *timeStamp;
@property (nonatomic) double penalty;

- (void)startGameWithMode:(NSString *)mode;
- (void)popLetter;
- (void)letterPressed:(NSString *)letter;
- (double)getPassedTime;
@end
