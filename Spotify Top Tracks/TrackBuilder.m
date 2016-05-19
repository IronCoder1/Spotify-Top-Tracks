//
//  TrackBuilder.m
//  Spotify Top Tracks
//
//  Created by MBPinTheAir on 19/05/2016.
//  Copyright © 2016 moorsideinc. All rights reserved.
//

#import "TrackBuilder.h"
#import "Track.h"

@implementation TrackBuilder


-(Track *)trackFromDict:(NSDictionary *)trackDict
{
    NSString *trackName = trackDict[@"name"];
    NSDictionary *dict = trackDict[@"album"];
    NSString *albumName = dict[@"name"];
    
    Track *newTrack = [[Track alloc]initWithName:trackName albumName:albumName];
    
    return newTrack;
    
    /*
     NSString *trackName = trackDict[@"name"];
     NSString *albumName = trackDict[@"album"][@"name"];
     
     NSArray *artists = trackDict[@"artists"];
     NSDictionary *artistDict = artists[0];
     NSString *artistName = artistDict[@"name"];
     */
}
@end
