//
//  Artist.m
//  Spotify Top Tracks
//
//  Created by MBPinTheAir on 18/05/2016.
//  Copyright © 2016 moorsideinc. All rights reserved.
//

#import "Artist.h"
#import "Track.h"

@implementation Artist

//3. implement init method to initialiuase artist object with properties

-(instancetype)initWithName:(NSString*)name
                   artistID:(NSString *)artistID
{
    
    if (self = [super init]) {
        _name = name;
        _artistID = artistID;
    }
    //4. retrn valu of self. -> next step is to look at the networking creating new network manager
    return self;
}

@end
