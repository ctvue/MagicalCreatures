//
//  ViewController.m
//  MCMS
//
//  Created by Chee Vue on 5/19/15.
//  Copyright (c) 2015 Chee Vue. All rights reserved.
//

#import "RootViewController.h"
#import "CreatureViewController.h"
#import "BattleViewController.h"
#import "MagicalCreature.h"

@interface RootViewController () <UITableViewDelegate, UITableViewDataSource>

@property NSMutableArray *creatures;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    MagicalCreature *sunny = [[MagicalCreature alloc] initWithFullName:@"Sunny" detailDescription:@"A yellow, furry bird that likes to play with fire." accesoryList:[NSMutableArray arrayWithObjects:@"Metal Armour", @"Sticky Glue", @"Fire", nil] withPicture:@"creature1.jpg"];
    MagicalCreature *bogle = [[MagicalCreature alloc] initWithFullName:@"Bogle" detailDescription:@"A household pet that can take form of common pets. Very energetic.  Awesome.  Respectful. Committed." accesoryList:[NSMutableArray arrayWithObjects:@"Nunchunks", @"Laser Rays", @"Stone Knives", nil] withPicture:@"creature2.png"];
    MagicalCreature *slinky = [[MagicalCreature alloc] initWithFullName:@"Slinky" detailDescription:@"Small, mischievous creatures who liked to play pranks on people." accesoryList:[NSMutableArray arrayWithObjects:@"Wooden Shield", @"Electric Shock Hands", nil] withPicture:@"creature3.png"];
    MagicalCreature *slime = [[MagicalCreature alloc] initWithFullName:@"Slime" detailDescription:@"Exhibit slimy, green mucus that makes other sick." accesoryList:[NSMutableArray arrayWithObjects:@"Water Hose Shooter", @"Steel Sword", @"Virus infection", nil] withPicture:@"creature4.png"];
    MagicalCreature *griffin = [[MagicalCreature alloc] initWithFullName:@"Glam" detailDescription:@"A creature with the body of a lion, the tail of a snake, and the head and wings of an eagle." accesoryList:[NSMutableArray arrayWithObjects:@"Electric Wings", @"Very fast, up 100 mph speed", @"Superior Strength", nil] withPicture:@"creature5.png"];


    self.creatures = [NSMutableArray arrayWithObjects:sunny,bogle,slinky,slime, griffin, nil];

    self.nameTextField.text = @"Creature Name";
    self.nameTextField.clearButtonMode = UITextFieldViewModeAlways;
    self.descriptionTextField.text = @"Creature Description";
    self.descriptionTextField.clearButtonMode = UITextFieldViewModeAlways;

//    for (MagicalCreature *creature in self.creatures) {
//        NSLog(@"%@", creature);
//    }

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID" forIndexPath:indexPath];


    if (creature == self.selectedCreature || creature == self.selectedCreatureOne) {
        cell.backgroundColor = [UIColor grayColor];
    } else {
        cell.backgroundColor = [UIColor whiteColor];
    }
    
    cell.detailTextLabel.numberOfLines = 10;
    cell.textLabel.text = creature.name;
    cell.detailTextLabel.text = creature.detail;


    UIImage * image = [UIImage imageNamed:creature.picture];
    CGSize sacleSize = CGSizeMake(100, 100);
    UIGraphicsBeginImageContextWithOptions(sacleSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, sacleSize.width, sacleSize.height)];
    UIImage * resizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    cell.imageView.image = resizedImage;

    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.creatures.count;
}

- (IBAction)addButtonPressed:(UIButton *)sender {
    MagicalCreature *genericCreature = [[MagicalCreature alloc] initWithFullName:self.nameTextField.text detailDescription:self.descriptionTextField.text withPicture:@"default.png"];
    [self.creatures addObject:genericCreature];
    [self.tableView reloadData];
    self.nameTextField.text = @"Creature Name";
    self.nameTextField.textColor = [UIColor grayColor];
    self.descriptionTextField.text = @"Creature Description";
    self.descriptionTextField.textColor = [UIColor grayColor];
    [self.view endEditing:YES]; //hides keyboard

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{


    if ([segue.identifier isEqualToString:@"segueBattle"])
    {
        //[segue.destinationViewController setTitle:@"Let's Battle"];
        BattleViewController *battleVC = segue.destinationViewController;
        battleVC.firstPlayer = self.selectedCreatureOne;
        battleVC.secondPlayer = self.selectedCreature;


    } else {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row]; //selected creature
        [segue.destinationViewController setTitle:creature.name];
        CreatureViewController *creatureVC = segue.destinationViewController;
        creatureVC.creature = creature;
    }
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData]; // to reload selected cell
    
}

- (IBAction)unwindFromViewController:(UIStoryboardSegue *)segue
{
    CreatureViewController *creaturevc = segue.sourceViewController;
    self.selectedCreatureOne = self.selectedCreature;
    self.selectedCreature = creaturevc.selectedPlayer;

}

- (IBAction)battleButtonPressed:(UIButton *)sender {
}


@end
