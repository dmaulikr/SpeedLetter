//
//  MultiplayerGameModel.h
//  SpeedLetter
//
//  Created by Tobias Wermuth on 04/03/14.
//  Copyright (c) 2014 nextdoor studios. All rights reserved.
//

#import "SingleplayerGameModel.h"

@interface MultiplayerGameModel : SingleplayerGameModel
@property (nonatomic) int pointsPlayer1;
@property (nonatomic) int pointsPlayer2;

- (void)letterPressed:(NSString *)letter byPlayerNumber:(NSUInteger)playerNumber;
@end
