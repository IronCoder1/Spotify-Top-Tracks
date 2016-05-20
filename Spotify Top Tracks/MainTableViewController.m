//
//  MainTableViewController.m
//  Spotify Top Tracks
//
//  Created by MBPinTheAir on 18/05/2016.
//  Copyright © 2016 moorsideinc. All rights reserved.
//

#import "MainTableViewController.h"
#import "NetworkManager.h"
#import "Artist.h"
#import "ArtistBuilder.h"
#import "MainCellView.h"
#import "TopTracksTableViewController.h"

@interface MainTableViewController ()<UITextFieldDelegate,UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) NSMutableArray *artistList;
//@property (strong, nonatomic) Artist *bArtist;
@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.artistList = [[NSMutableArray alloc]initWithCapacity:0];
    self.tableView.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.artistList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MainCellView *cell = (MainCellView *)[tableView dequeueReusableCellWithIdentifier:@"customCell" forIndexPath:indexPath];
    
    Artist *bArtist = self.artistList[indexPath.row];
    
        cell.artistIDLabel.text = bArtist.artistID;
        cell.artistLabel.text = bArtist.name;
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"toDetailSegue" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:@"toDetailSegue"])
    {
        TopTracksTableViewController *tvc = (TopTracksTableViewController *)[segue destinationViewController];
        NSIndexPath *newPath = [self.tableView indexPathForSelectedRow];
        
        tvc.artistArray = self.artistList;
        tvc.indexPath = newPath;
        
        
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - textfied delegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (![textField.text isEqualToString:@""]) {
        NetworkManager *netMgr = [[NetworkManager alloc]init];
        
       // [self.artistList removeAllObjects];  to reset array contents if you want
        
        [netMgr getArtistWithSearchTerm:textField.text andCompletion:^(NSArray *artists, NSError *error) {
            if(!error)
            {
                ArtistBuilder *newBuild = [[ArtistBuilder alloc]init];
                for (NSDictionary *dict in artists)
                {
                  Artist *newArtist = [newBuild artistFromDict:dict];
                    
                    [self.artistList addObject:newArtist];
                    //do we want to run this on main thread or background?
                }
                [self.tableView reloadData];
            }
        }];
            }
    [textField resignFirstResponder];
    return YES;
}
@end
