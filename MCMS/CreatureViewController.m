//
//  CreatureViewController.m
//  MCMS
//
//  Created by Chee Vue on 5/19/15.
//  Copyright (c) 2015 Chee Vue. All rights reserved.
//

#import "CreatureViewController.h"

@interface CreatureViewController () <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageCreatureView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"%@", self.creature);
    self.nameTextField.text = self.creature.name;
    self.nameLabel.text = self.creature.name;
    self.imageCreatureView.image = [UIImage imageNamed:self.creature.picture];
    self.nameTextField.enabled = NO;
    self.nameTextField.hidden = YES;

}

- (IBAction)onEditButtonPressed:(UIButton *)sender {

    if ([[sender currentTitle] isEqualToString:@"Done"]) {
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        self.nameTextField.enabled = NO;
        self.nameTextField.hidden = YES;
    } else {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        self.nameTextField.hidden = NO;
        self.nameTextField.enabled = YES;

    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [self.creature.accessories objectAtIndex:indexPath.row]];

    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

@end
