//
//  SingleplayerViewController.m
//  SpeedLetter
//
//  Created by Tobias Wermuth on 27/02/14.
//  Copyright (c) 2014 nextdoor studios. All rights reserved.
//

#import "LobbySingleplayerViewController.h"
#import "SingleplayerGameViewController.h"

@interface LobbySingleplayerViewController ()

@end

@implementation LobbySingleplayerViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Start Simpel Game"]) {
        [(SingleplayerGameViewController *)segue.destinationViewController setGameMode:@"Simpel"];
    } else if ([segue.identifier isEqualToString:@"Start Complex Game"]) {
        [(SingleplayerGameViewController *)segue.destinationViewController setGameMode:@"Complex"];
    }
}

@end
