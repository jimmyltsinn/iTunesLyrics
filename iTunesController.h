//
//  ITunesController.h
//  iTunesNowPlayingLyrics
//
//  Created by Jimmy Sinn on 29/2/2016.
//  Copyright © 2016 Jimmy Sinn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iTunes.h"

@interface ITunesController : NSObject

@property (strong, readonly) iTunesApplication* application;

- (NSString *) getCurrentTrackName;
- (NSString *) getCurrentTrackArtist;
- (NSString *) getCurrentTrackAlbum;
- (NSString *) getCurrentTrackAlbumArtist;
- (int) getCurrentTrackDuration;
- (int) getCurrentStatus; 


@end
