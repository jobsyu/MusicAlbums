//
//  Album.m
//  MusicAlbums
//
//  Created by ycpjobs on 16/4/1.
//  Copyright © 2016年 ycpjobs. All rights reserved.
//

#import "Album.h"

@implementation Album

-(instancetype)initWithTitle:(NSString *)title artist:(NSString *)artist coverUrl:(NSString *)coverUrl year:(NSString *)year
{
    self = [super init];
    if(self)
    {
        _title = title;
        _artist = artist;
        _coverUrl = coverUrl;
        _year = year;
        _genre = @"Pop";
    }
    return self;
}

@end
