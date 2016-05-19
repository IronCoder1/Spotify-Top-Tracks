//
//  NetworkManager.h
//  Spotify Top Tracks
//
//  Created by MBPinTheAir on 18/05/2016.
//  Copyright © 2016 moorsideinc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Artist.h"

@interface NetworkManager : NSObject
@property (strong, nonatomic) NSURLSession *session;
//15. because block type needs to be called from outside the class in artistbuilder we define a type



//5. method to get (model) need a method with callback to retrieve data from api and send to view controller  write a completion block to return artisit then implement the mothod for the completion block in m file.

//dict in dict called artist with array called items with dict with key name:"3t", "id": "7Hr0OAzZbj4lzNit1djyHM",

typedef void (^completionBlock)(NSArray *artists, NSError *error);
typedef void (^completionBlockforTopTracks)(NSArray *topTracks, NSError *error);

-(void) getArtistWithSearchTerm:(NSString *)artistname andCompletion:(completionBlock)completionHandler;

-(void) getTopTracksForArtist:(NSString *)tracksUrlString andDothisOnCompletion:(completionBlockforTopTracks)completionHandler2;

@end
