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
    
    NSArray *images = dict[@"images"];
    NSDictionary *imageDict = images[0];
    NSString *posterUrl = imageDict[@"url"];
    
    
    Track *newTrack = [[Track alloc]initWithName:trackName albumName:albumName posterLink:posterUrl];
    
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
