//
//  GameViewController.m
//  SpeedLetter
//
//  Created by Tobias Wermuth on 27/02/14.
//  Copyright (c) 2014 nextdoor studios. All rights reserved.
//

#import "SingleplayerGameViewController.h"
#import "SingleplayerGameModel.h"

@interface SingleplayerGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *currentLetterLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *answerButtons;
@property (weak, nonatomic) IBOutlet UILabel *gamemodeLabel;

@property (strong, nonatomic) SingleplayerGameModel *game;

@end

@implementation SingleplayerGameViewController


- (IBAction)letterTry:(UIButton *)sender {
    if (self.game) {
        if (self.game.currentLetterStorage.count > 0) {
            [self.game letterPressed:[sender titleForState:UIControlStateNormal]];
            [self updateUI];
        } else {
            self.currentLetterLabel.text = [NSString stringWithFormat:@"%.2fs", self.game.getPassedTime];
            
            for (UIButton *button in self.answerButtons) {
                button.enabled = NO;
                [button setTitle:@"" forState:UIControlStateNormal];
            }
        }
    }
}

- (IBAction)startGame:(UIButton *)sender {
    sender.hidden = YES;
    
    for (UIButton *button in self.answerButtons) {
        button.enabled = YES;
        [button setTitle:@"" forState:UIControlStateNormal];
    }
    
    self.game = [[SingleplayerGameModel alloc] init];
    [self.game startGameWithMode:self.gameMode];
    [self.game popLetter];
    [self updateUI];
}

- (void)updateUI
{
    self.currentLetterLabel.text = self.game.currentLetter;
    
    for (int i = 0; i < self.answerButtons.count; i++) {
        [[self.answerButtons objectAtIndex:i] setTitle:[self.game.buttonLetters objectAtIndex:i]
                                              forState:UIControlStateNormal];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.gamemodeLabel.text = self.gameMode;
    self.title = @"Singleplayer";
    
    for (UIButton *button in self.answerButtons) {
        button.enabled = NO;
        [button setTitle:@"" forState:UIControlStateNormal];
    }
}
@end
