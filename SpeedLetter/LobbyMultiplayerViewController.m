//
//  MultiplayerViewController.m
//  SpeedLetter
//
//  Created by Tobias Wermuth on 01/03/14.
//  Copyright (c) 2014 nextdoor studios. All rights reserved.
//

#import "LobbyMultiplayerViewController.h"
#import "MultiplayerGameViewController.h"

@implementation LobbyMultiplayerViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Start Simpel Game"]) {
        [(MultiplayerGameViewController *)segue.destinationViewController setGameMode:@"Simpel"];
    } else if ([segue.identifier isEqualToString:@"Start Complex Game"]) {
        [(MultiplayerGameViewController *)segue.destinationViewController setGameMode:@"Complex"];
    }
}


@end
