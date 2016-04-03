//
//  HorizontalScroller.h
//  MusicAlbums
//
//  Created by ycpjobs on 16/4/2.
//  Copyright © 2016年 ycpjobs. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HorizontalScrollerDelegate;

@interface HorizontalScroller : UIView

@property (weak) id<HorizontalScrollerDelegate> delegate;

-(void)reload;
@end

@protocol HorizontalScrollerDelegate <NSObject>

@required
//ask the delegate how many views he wants to present inside the horizontal scroller
-(NSInteger)numberOfViewsForHorizontalScroller:(HorizontalScroller *)scroller;

//ask the delegate to return the view that should appear at <index>
-(UIView *)horizontalScroller:(HorizontalScroller *)scroller viewAtIndex:(int)index;

// inform the delegate what the view at <index> has been clicked
-(void)horizontalScroller:(HorizontalScroller *)scroller clickedViewAtIndex:(int)index;

@optional
// ask the delegate for the index of the initial view to display. this method is optional
-(NSInteger)initialViewIndexForHorizontalScroller:(HorizontalScroller *)scroller;
@end