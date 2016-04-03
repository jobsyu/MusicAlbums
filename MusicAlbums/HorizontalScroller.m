//
//  HorizontalScroller.m
//  MusicAlbums
//
//  Created by ycpjobs on 16/4/2.
//  Copyright © 2016年 ycpjobs. All rights reserved.
//

#import "HorizontalScroller.h"
#define VIEW_PADDING 10
#define VIEW_DIMENSIONS 100
#define VIEWS_OFFSET 100

@interface HorizontalScroller()<UIScrollViewDelegate>

@end

@implementation HorizontalScroller
{
    UIScrollView * scroller;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        scroller = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        scroller.delegate = self;
        [self addSubview:scroller];
        UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollerTapped:)];
        [scroller addGestureRecognizer:tapRecognizer];
    }
    return self;
}

-(void)scrollerTapped:(UITapGestureRecognizer *)gesture
{
    CGPoint location = [gesture locationInView:gesture.view];
    // we can't use an enumerator here, because we don't want to enumerate over ALL of the
    //UIScrollView subviews
    //we want to enumerate only subviews that we added
    for(int index=0; index<[self.delegate numberOfViewsForHorizontalScroller:self]; index++)
    {
        UIView *view = scroller.subviews[index];
        if (CGRectContainsPoint(view.frame, location)) {
            [self.delegate horizontalScroller:self clickedViewAtIndex:index];
            [scroller setContentOffset:CGPointMake(view.frame.origin.x-self.frame.size.width/2+view.frame.size.width/2, 0) animated:YES];
            break;
        }
    }
    
}

-(void)didMoveToSuperview
{
    [self reload];
}

//execute reload when your data has changed
-(void)reload
{
    // nothing to load if there's no delegate
    if (self.delegate == nil) return;
    
    // remove all subviews
    [scroller.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    
    // xValue is the starting point of the views inside the scroller
    CGFloat xValue = VIEWS_OFFSET;
    for (int i=0; i<[self.delegate numberOfViewsForHorizontalScroller:self];i++) {
        // add a view at the right position
        xValue += VIEW_PADDING;
        UIView *view = [self.delegate horizontalScroller:self viewAtIndex:i];
        view.frame = CGRectMake(xValue, VIEW_PADDING, VIEW_DIMENSIONS, VIEW_DIMENSIONS);
        [scroller addSubview:view];
        xValue += VIEW_DIMENSIONS+VIEW_PADDING;
    }
    
    [scroller setContentSize:CGSizeMake(xValue+VIEWS_OFFSET, self.frame.size.height)];
    
    // if an initial view is defined , center the scroller on it
    if ([self.delegate respondsToSelector:@selector(initialViewIndexForHorizontalScroller:)]) {
        int initialView = [self.delegate initialViewIndexForHorizontalScroller:self];
        [scroller setContentOffset:CGPointMake(initialView*(VIEW_DIMENSIONS+(VIEW_PADDING*2)), 0) animated:YES];
    }
}

//Centered inside the scroll view
-(void)centerCurrentView
{
    int xFinal = scroller.contentOffset.x + (VIEWS_OFFSET/2)+VIEW_PADDING;
    int viewIndex = xFinal / (VIEW_DIMENSIONS+(2*VIEW_PADDING));
    xFinal = viewIndex * (VIEW_DIMENSIONS+(2*VIEW_PADDING));
    [scroller setContentOffset:CGPointMake(xFinal, 0) animated:YES];
    [self.delegate horizontalScroller:self clickedViewAtIndex:viewIndex];
}


#pragma mark - UIScrollDelegate
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate) {
        [self centerCurrentView];
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self centerCurrentView];
}
@end
