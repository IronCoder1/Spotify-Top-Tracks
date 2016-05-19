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

-(void) getArtistWithSearchTerm:(NSString *)artistname andCompletion:(completionBlock)completionHandler
{
    __weak typeof (self) weakself = self;
    
    
    
   // NSString *urlstring = [NSString stringWithFormat:@"https://api.spotify.com/v1/search?q=%@&type=artist",artistname];
     //NSURL *artistUrl = [[NSURL alloc]init];
    if ([artistname containsString:@" "])
    {
       
    NSString *common = @"https://api.spotify.com/v1/search?q=";
    NSString *artistnameWithPlus = artistname;
    
    NSRange replaceRange = [artistname rangeOfString:@" "];
    if (replaceRange.location != NSNotFound){
     artistnameWithPlus = [artistnameWithPlus stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    }
    
    NSString *secondURL = [common stringByAppendingString:artistnameWithPlus];
    NSString *thirdURL = [secondURL stringByAppendingString:@"&type=artist"];
   
    NSURL *artistUrl = [NSURL URLWithString:thirdURL];
    
    self.session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [self.session dataTaskWithURL:artistUrl completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
        if (error)
        {
            //handle errors
        } else
        {
            NSError *jsonError;
            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
NSLog(@"jsondict = %@",jsonDict);
            NSDictionary *dict1 = jsonDict[@"artists"];
           NSArray *artistArray = dict1[@"items"];
            dispatch_async(dispatch_get_main_queue(), ^{
          
                completionHandler(artistArray, error);
            //instead of saving as a copy for this class we send over as argument for completion handler
//            self.artists = [artistArray mutableCopy];
            });
        }
        
    }];
    [dataTask resume];
    }
}

-(void) getTopTracksForArtist:(NSString *)tracksUrlString andDothisOnCompletion:(completionBlockforTopTracks)completionHandler2
{
  NSString *baseUrl = [NSString stringWithFormat:@"https://api.spotify.com/v1/artists/%@",tracksUrlString];
    NSString *finalString = [baseUrl stringByAppendingString:@"/top-tracks?country=GB"];
    
    //https://api.spotify.com/v1/artists/5rAaG3OuMuWvPWYji9TDgh/top-tracks?country=GB
    
    NSURL *topTrackUrl = [NSURL URLWithString:finalString];
    NSURLSession *session2= [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask2 = [session2 dataTaskWithURL:topTrackUrl completionHandler:^(NSData *  data, NSURLResponse *response, NSError * error)
    {
        if(error)
        {
            //handle errors
        }
        else
        {
            NSError *jsonError;
            NSDictionary *jsoonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
            NSArray *topTracks = jsoonDict[@"tracks"];
    NSLog(@"jsondict = %@",jsoonDict);
            
            dispatch_async(dispatch_get_main_queue(),
            ^{
                completionHandler2(topTracks, error);
                //instead of saving as a copy for this class we send over as argument for completion handler
            });
        }
        
    }];
    [dataTask2 resume];
    
}




@end
