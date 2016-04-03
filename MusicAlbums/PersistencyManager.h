//
//  PersistencyManager.h
//  MusicAlbums
//
//  Created by ycpjobs on 16/4/2.
//  Copyright © 2016年 ycpjobs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Album.h"

@interface PersistencyManager : NSObject

-(NSArray *)getAlbums;
-(void)addAlbums:(Album *)album atIndex:(int)index;
-(void)deleteAlbumAtIndex:(int)index;

-(void)saveImage:(UIImage *)image filename:(NSString *)filename;
-(UIImage*)getImage:(NSString *)filename;

-(void)saveAlbums;
@end
