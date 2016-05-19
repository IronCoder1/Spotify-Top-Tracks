//
//  Artist.h
//  Spotify Top Tracks
//
//  Created by MBPinTheAir on 18/05/2016.
//  Copyright © 2016 moorsideinc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Artist : NSObject


//1. model object properties

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *artistID;


//2. setup an init method since not a lot of propst
-(instancetype)initWithName:(NSString*)name
             artistID:(NSString *)artistID;
@end
