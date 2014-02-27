//
//  SingleplayerViewController.m
//  SpeedLetter
//
//  Created by Tobias Wermuth on 27/02/14.
//  Copyright (c) 2014 nextdoor studios. All rights reserved.
//

#import "SingleplayerViewController.h"
#import "GameViewController.h"

@interface SingleplayerViewController ()

@end

@implementation SingleplayerViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Start Simpel Game"]) {
        [(GameViewController *)segue.destinationViewController setGameMode:@"Simpel"];
    } else if ([segue.identifier isEqualToString:@"Start Complex Game"]) {
        [(GameViewController *)segue.destinationViewController setGameMode:@"Complex"];
    }
}

@end
