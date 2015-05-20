//
//  BattleViewController.m
//  MCMS
//
//  Created by Chee Vue on 5/19/15.
//  Copyright (c) 2015 Chee Vue. All rights reserved.
//

#import "BattleViewController.h"

@interface BattleViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *firstImage;
@property (weak, nonatomic) IBOutlet UILabel *firstLabel;
@property (weak, nonatomic) IBOutlet UIImageView *secondImage;
@property (weak, nonatomic) IBOutlet UILabel *secondLabel;

@end

@implementation BattleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.firstImage.image = [UIImage imageNamed:self.firstPlayer.picture];
    self.secondImage.image = [UIImage imageNamed:self.secondPlayer.picture];
    self.firstLabel.text = self.firstPlayer.name;
    self.secondLabel.text = self.secondPlayer.name;
}


- (IBAction)battleButtonPressed:(UIButton *)sender {
    int luck = rand() % 100;
    NSString *winner = [NSString new];
    NSString *loser = [NSString new];

    if (luck > 50) {
        winner = self.firstPlayer.name;
        loser = self.secondPlayer.name;
    } else {
        winner = self.secondPlayer.name;
        loser = self.firstPlayer.name;
    }

    NSString *titlemsg = [NSString stringWithFormat:@"%@ BEATS %@", winner, loser];

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:titlemsg message:@"" preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *dismissButton = [UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){}];

    [alertController addAction:dismissButton];


    [self presentViewController:alertController animated:YES completion:nil];
}



@end
