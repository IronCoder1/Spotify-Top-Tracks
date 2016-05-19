//
//  Track.h
//  Spotify Top Tracks
//
//  Created by MBPinTheAir on 19/05/2016.
//  Copyright © 2016 moorsideinc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Track : NSObject
//@property (copy, nonatomic) NSArray *tracksArray;
@property (copy, nonatomic) NSString *albumName;
@property (copy, nonatomic) NSString *trackName;

-(instancetype)initWithName:(NSString*)trackName
                  albumName:(NSString *)albumName;

@end
