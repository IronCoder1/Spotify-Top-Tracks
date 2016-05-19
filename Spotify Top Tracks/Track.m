//
//  Track.m
//  Spotify Top Tracks
//
//  Created by MBPinTheAir on 19/05/2016.
//  Copyright © 2016 moorsideinc. All rights reserved.
//

#import "Track.h"

@implementation Track
-(instancetype)initWithName:(NSString*)trackName
                   albumName:(NSString *)albumName
{
    
    if (self = [super init])
    {
        _trackName = trackName;
        _albumName = albumName ;
    }
    //4. retrn valu of self. -> next step is to look at the networking creating new network manager
    return self;
}


@end
