//
//  TopTracksTableViewController.m
//  Spotify Top Tracks
//
//  Created by MBPinTheAir on 19/05/2016.
//  Copyright © 2016 moorsideinc. All rights reserved.
//

#import "TopTracksTableViewController.h"
#import "NetworkManager.h"

@interface TopTracksTableViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) NSMutableArray *tracksList;


@end

@implementation TopTracksTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.aArtist = [[Artist alloc]init];
    NSInteger row = [_indexPath row];
    
    if (self.aArtist.artistID)
    {
    NetworkManager *netMgr = [[NetworkManager alloc]init];
    [netMgr getTopTracksForArtist:self.aArtist.artistID andDothisOnCompletion:^(NSArray *topTracks, NSError *error) {
        
        TrackBuilder *newBuild = [[TrackBuilder alloc]init];
        for (NSDictionary *dict in topTracks)
        {
            Track  *newTrack = [newBuild trackFromDict:dict];
            
            [self.tracksList addObject:newTrack];
            //do we want to run this on main thread or background?
        }
    }];
}
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [_tracksList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"topTracksCell" forIndexPath:indexPath];
    
    Track *aTrack = [[Track alloc]init];
    
    cell.textLabel.text = aTrack.trackName;
    cell.detailTextLabel.text = aTrack.albumName;
    
    return cell;
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

@end
