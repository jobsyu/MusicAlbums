//
//  Album.h
//  MusicAlbums
//
//  Created by ycpjobs on 16/4/1.
//  Copyright © 2016年 ycpjobs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Album : NSObject

@property (nonatomic, copy, readonly) NSString *title, *artist, *genre, *coverUrl, *year;

-(instancetype)initWithTitle:(NSString *)title artist:(NSString *)artist coverUrl:(NSString *)coverUrl year:(NSString *)year;

@end
