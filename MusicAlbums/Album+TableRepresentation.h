//
//  Album+TableRepresentation.h
//  MusicAlbums
//
//  Created by ycpjobs on 16/4/2.
//  Copyright © 2016年 ycpjobs. All rights reserved.
//

#import "Album.h"

@interface Album (TableRepresentation)

-(NSDictionary *)tr_tableRepresentation;

@end
