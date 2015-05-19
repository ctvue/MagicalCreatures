//
//  ViewController.m
//  MCMS
//
//  Created by Chee Vue on 5/19/15.
//  Copyright (c) 2015 Chee Vue. All rights reserved.
//

#import "RootViewController.h"
#import "CreatureViewController.h"
#import "MagicalCreature.h"

@interface RootViewController () <UITableViewDelegate, UITableViewDataSource>

@property NSMutableArray *creatures;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    MagicalCreature *sunny = [[MagicalCreature alloc] initWithFullName:@"Sunny" detailDescription:@"A yellow, furry bird that likes to play with fire."];
    MagicalCreature *bogle = [[MagicalCreature alloc] initWithFullName:@"Bogle" detailDescription:@"A household pet that can take form of common pets. Very energetic.  Awesome.  Respectful. Committed."];
    MagicalCreature *slinky = [[MagicalCreature alloc] initWithFullName:@"Slinky" detailDescription:@"Always make people and other createure laught."];
    MagicalCreature *slime = [[MagicalCreature alloc] initWithFullName:@"Slime" detailDescription:@"Exhibit slimy, green mucus that makes other sick."];
    MagicalCreature *glam = [[MagicalCreature alloc] initWithFullName:@"Glam" detailDescription:@"Likes all the glamous things."];

    self.creatures = [NSMutableArray arrayWithObjects:sunny,bogle,slinky,slime, glam, nil];

    for (MagicalCreature *creature in self.creatures) {
        NSLog(@"%@", creature);
    }

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID" forIndexPath:indexPath];
    cell.textLabel.text = creature.name;
    cell.detailTextLabel.text = creature.detail;
    cell.detailTextLabel.lineBreakMode = NSLineBreakByWordWrapping;

    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.creatures.count;
}

- (IBAction)addButtonPressed:(UIButton *)sender {
    MagicalCreature *genericCreature = [[MagicalCreature alloc] initWithFullName:self.nameTextField.text];
    [self.creatures addObject:genericCreature];
    [self.tableView reloadData];
    self.nameTextField.text = nil;
    [self.view endEditing:YES]; //hides keyboard

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow]; //select creature
    MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row];
    [segue.destinationViewController setTitle:creature.name];
    CreatureViewController *creatureVC = segue.destinationViewController;
    creatureVC.creature = creature;
    
}

@end
