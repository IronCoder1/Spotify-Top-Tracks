//
//  ArtistBuilder.m
//  Spotify Top Tracks
//
//  Created by MBPinTheAir on 19/05/2016.
//  Copyright © 2016 moorsideinc. All rights reserved.
//

#import "ArtistBuilder.h"

@implementation ArtistBuilder


-(Artist *)artistFromDict:(NSDictionary *)artistDict

{
    NSString *name = artistDict[@"name"];
    NSString *artistID = artistDict[@"id"];
    
    Artist *newArtist = [[Artist alloc]initWithName:name artistID:artistID];
    
    return newArtist;
}


@end
