//
//  TrackBuilder.h
//  Spotify Top Tracks
//
//  Created by MBPinTheAir on 19/05/2016.
//  Copyright © 2016 moorsideinc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Track.h"

@interface TrackBuilder : NSObject
-(Track *)trackFromDict:(NSDictionary *)trackDict;
@end
