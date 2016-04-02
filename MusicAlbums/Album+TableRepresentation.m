//
//  Album+TableRepresentation.m
//  MusicAlbums
//
//  Created by ycpjobs on 16/4/2.
//  Copyright © 2016年 ycpjobs. All rights reserved.
//

#import "Album+TableRepresentation.h"

@implementation Album (TableRepresentation)

-(NSDictionary *)tr_tableRepresentation
{
    return @{@"titles":@[@"Artist",@"Album",@"Genre",@"Year"],
             @"values":@[self.artist,self.title,self.genre,self.year]};
}

@end
