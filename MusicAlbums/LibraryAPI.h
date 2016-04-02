//
//  LibraryAPI.h
//  MusicAlbums
//
//  Created by ycpjobs on 16/4/2.
//  Copyright © 2016年 ycpjobs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Album.h"

@interface LibraryAPI : NSObject

+(LibraryAPI *)sharedInstance;
-(NSArray *)getAlbums;
-(void)addAlbums:(Album *)album atIndex:(int)index;
-(void)deleteAlbumAtIndex:(int)index;

@end
