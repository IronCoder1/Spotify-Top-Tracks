//
//  TopTracksTableViewController.h
//  Spotify Top Tracks
//
//  Created by MBPinTheAir on 19/05/2016.
//  Copyright © 2016 moorsideinc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Artist.h"
#import "ArtistBuilder.h"
#import "Track.h"
#import "TrackBuilder.h"

@interface TopTracksTableViewController : UITableViewController

@property (strong, nonatomic) NSArray *artistArray;
@property  (strong, nonatomic) Artist *aArtist;
@property (strong, nonatomic) NSIndexPath *indexPath;

@end
