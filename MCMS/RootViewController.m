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

    MagicalCreature *sunny = [[MagicalCreature alloc] initWithFullName:@"Sunny" detailDescription:@"A yellow, furry bird that likes to play with fire." accesoryList:[NSMutableArray arrayWithObjects:@"Metal Armour", @"Sticky Glue", @"Fire", nil] withPicture:@"creature1.jpg"];
    MagicalCreature *bogle = [[MagicalCreature alloc] initWithFullName:@"Bogle" detailDescription:@"A household pet that can take form of common pets. Very energetic.  Awesome.  Respectful. Committed." accesoryList:[NSMutableArray arrayWithObjects:@"Nunchunks", @"Laser Rays", @"Stone Knives", nil] withPicture:@"creature2.png"];
    MagicalCreature *slinky = [[MagicalCreature alloc] initWithFullName:@"Slinky" detailDescription:@"Small, mischievous creatures who liked to play pranks on people." accesoryList:[NSMutableArray arrayWithObjects:@"Wooden Shield", @"Electric Shock Hands", nil] withPicture:@"creature3.png"];
    MagicalCreature *slime = [[MagicalCreature alloc] initWithFullName:@"Slime" detailDescription:@"Exhibit slimy, green mucus that makes other sick." accesoryList:[NSMutableArray arrayWithObjects:@"Water Hose Shooter", @"Steel Sword", @"Virus infection", nil] withPicture:@"creature4.png"];
    MagicalCreature *griffin = [[MagicalCreature alloc] initWithFullName:@"Glam" detailDescription:@"A creature with the body of a lion, the tail of a snake, and the head and wings of an eagle." accesoryList:[NSMutableArray arrayWithObjects:@"Electric Wings", @"Very fast, up 100 mph speed", @"Superior Strength", nil] withPicture:@"creature5.png"];


    self.creatures = [NSMutableArray arrayWithObjects:sunny,bogle,slinky,slime, griffin, nil];

    for (MagicalCreature *creature in self.creatures) {
        NSLog(@"%@", creature);
    }

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID" forIndexPath:indexPath];
    cell.detailTextLabel.numberOfLines = 10;
    cell.textLabel.text = creature.name;
    cell.detailTextLabel.text = creature.detail;
    cell.detailTextLabel.lineBreakMode = NSLineBreakByWordWrapping;

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


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData]; // to reload selected cell
    
}

@end
