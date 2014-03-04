//
//  MultiplayerGameViewController.m
//  SpeedLetter
//
//  Created by Tobias Wermuth on 01/03/14.
//  Copyright (c) 2014 nextdoor studios. All rights reserved.
//

#import "MultiplayerGameViewController.h"
#import "MultiplayerGameModel.h"

@interface MultiplayerGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *currentLetterLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentLetterLabelMirrored;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *answerPlayer1Buttons;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *answerPlayer2Buttons;
@property (weak, nonatomic) IBOutlet UILabel *statsPlayer1Label;
@property (weak, nonatomic) IBOutlet UILabel *statsPlayer1LabelMirrored;
@property (weak, nonatomic) IBOutlet UILabel *statsPlayer2Label;
@property (weak, nonatomic) IBOutlet UILabel *statsPlayer2LabelMirrored;
@property (weak, nonatomic) IBOutlet UIButton *startButtonMirrored;
@property (weak, nonatomic) IBOutlet UIButton *startButton;

@property (strong, nonatomic) MultiplayerGameModel *game;

@end

@implementation MultiplayerGameViewController

- (IBAction)letterTry:(UIButton *)sender {
    if (self.game) {
        if (self.game.currentLetterStorage.count > 0) {
            NSUInteger playerNumber = 0;
            
            if ([self.answerPlayer1Buttons containsObject:sender])
                playerNumber = 1;
            else if ([self.answerPlayer2Buttons containsObject:sender])
                playerNumber = 2;
            
            [self.game letterPressed:[sender titleForState:UIControlStateNormal] byPlayerNumber:playerNumber];            
            [self updateUI];
        } else {
            if (self.game.pointsPlayer1 > self.game.pointsPlayer2) {
                self.currentLetterLabel.text = @"WON";
                self.currentLetterLabelMirrored.text = @"LOST";
            } else if (self.game.pointsPlayer2 > self.game.pointsPlayer2) {
                self.currentLetterLabel.text = @"LOST";
                self.currentLetterLabelMirrored.text = @"WON";
            } else {
                self.currentLetterLabel.text = @"DRAW";
                self.currentLetterLabelMirrored.text = @"DRAW";
            }
            
            for (UIButton *button in self.answerPlayer1Buttons) {
                button.enabled = NO;
                [button setTitle:@"" forState:UIControlStateNormal];
            }
            
            for (UIButton *button in self.answerPlayer2Buttons) {
                button.enabled = NO;
                [button setTitle:@"" forState:UIControlStateNormal];
            }
        }
    }
}

- (IBAction)startGame:(UIButton *)sender {
    self.startButton.hidden = YES;
    self.startButtonMirrored.hidden = YES;

    for (UIButton *button in self.answerPlayer1Buttons) {
        button.enabled = YES;
        [button setTitle:@"" forState:UIControlStateNormal];
    }
    
    for (UIButton *button in self.answerPlayer2Buttons) {
        button.enabled = YES;
        [button setTitle:@"" forState:UIControlStateNormal];
    }

    self.game = [[MultiplayerGameModel alloc] init];
    [self.game startGameWithMode:self.gameMode];
    [self.game popLetter];
    [self updateUI];
}

- (void)updateUI
{
    self.currentLetterLabel.text = self.game.currentLetter;
    self.currentLetterLabelMirrored.text = self.game.currentLetter;
    
    self.statsPlayer1Label.text = [NSString stringWithFormat:@"%d", self.game.pointsPlayer1];
    self.statsPlayer1LabelMirrored.text = [NSString stringWithFormat:@"%d", self.game.pointsPlayer1];
    self.statsPlayer2Label.text = [NSString stringWithFormat:@"%d", self.game.pointsPlayer2];
    self.statsPlayer2LabelMirrored.text = [NSString stringWithFormat:@"%d", self.game.pointsPlayer2];

    for (int i = 0; i < self.answerPlayer1Buttons.count; i++) {
        [[self.answerPlayer1Buttons objectAtIndex:i] setTitle:[self.game.buttonLetters objectAtIndex:i]
                                              forState:UIControlStateNormal];
    }
    
    for (int i = 0; i < self.answerPlayer2Buttons.count; i++) {
        [[self.answerPlayer2Buttons objectAtIndex:i] setTitle:[self.game.buttonLetters objectAtIndex:i]
                                              forState:UIControlStateNormal];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Multiplayer";
    
    [self rotateLabel:self.currentLetterLabelMirrored];
    [self rotateLabel:self.statsPlayer1LabelMirrored];
    [self rotateLabel:self.statsPlayer2LabelMirrored];
    [self rotateButton:self.startButtonMirrored];

    for (UIButton *button in self.answerPlayer1Buttons) {
        button.enabled = NO;
        [button setTitle:@"" forState:UIControlStateNormal];
    }
    
    for (UIButton *button in self.answerPlayer2Buttons) {
        button.enabled = NO;
        [button setTitle:@"" forState:UIControlStateNormal];
        [self rotateButton:button];
    }
}

- (void)rotateLabel:(UILabel*)label {
    CGAffineTransform transform = label.transform;
    transform = CGAffineTransformRotate(transform, M_PI);
    label.transform = transform;
}

- (void)rotateButton:(UIButton*)button {
    CGAffineTransform transform = button.transform;
    transform = CGAffineTransformRotate(transform, M_PI);
    button.transform = transform;
}
@end
