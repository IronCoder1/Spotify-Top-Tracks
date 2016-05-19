//
//  NetworkManager.m
//  Spotify Top Tracks
//
//  Created by MBPinTheAir on 18/05/2016.
//  Copyright © 2016 moorsideinc. All rights reserved.
//


#import "NetworkManager.h"
@interface NetworkManager ()
@property (nonatomic, strong) completionBlock completionHandler;
@property (nonatomic, strong)NSMutableArray *artists;

@end

@implementation NetworkManager

-(void) getArtistWithCompletion:(completionBlock)completionHandler
{
    __weak typeof (self) weakself = self;
    NSString *urlstring = @"https://api.spotify.com/v1/search?q=3T&type=artist";
    
    NSURL *artistUrl = [NSURL URLWithString:urlstring];
    
    self.session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [self.session dataTaskWithURL:artistUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
    {
        if (error)
        {
            //handle errors
        } else
        {
            NSError *jsonError;
            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
            
            NSLog(@"jsondict = %@",jsonDict);
           NSArray *artistArray = jsonDict[@"items"];
        }

    }];
    [dataTask resume];
}

-(void)getTopSongs{
    
    NSString *baseUrl = @"https://api.spotify.com/v1/artists/ %@",  //2TI7qyDE0QfyOlnbtfDo7L/top-tracks?country=GB
    
    
}


@end
