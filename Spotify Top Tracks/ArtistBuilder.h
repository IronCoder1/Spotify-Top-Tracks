//
//  ArtistBuilder.h
//  Spotify Top Tracks
//
//  Created by MBPinTheAir on 19/05/2016.
//  Copyright © 2016 moorsideinc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Artist.h"

@interface ArtistBuilder : NSObject

//13. method to return artist array when given the album dict
-(Artist *)artistFromDict:(NSDictionary *)artistDict;

@end
