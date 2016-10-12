//
//  ITunesController.m
//  iTunesNowPlayingLyrics
//
//  Created by Jimmy Sinn on 29/2/2016.
//  Copyright © 2016 Jimmy Sinn. All rights reserved.
//

#import "iTunesController.h"

@implementation ITunesController

@synthesize application = _application;

- (iTunesApplication *) application {
    if (_application == nil) {
        _application = [SBApplication applicationWithBundleIdentifier:@"com.apple.iTunes"];
    }
    return _application;
}

- (NSString *) getCurrentTrackName {
    return [[self.application currentTrack] name];
}

- (NSString *) getCurrentTrackArtist {
    return [[self.application currentTrack] artist];
}

- (NSString *) getCurrentTrackAlbum {
    return [[self.application currentTrack] album];
}

- (NSString *) getCurrentTrackAlbumArtist {
    return [[self.application currentTrack] albumArtist];
}

- (int) getCurrentTrackDuration {
    return [[self.application currentTrack] duration];
}

- (int) getCurrentTrackStatus {
    return 0;
}

- (int) getCurrentStatus {
    switch (self.application.playerState) {
        case iTunesEPlSStopped: return 0;
        case iTunesEPlSPlaying: return 2;
        case iTunesEPlSPaused:
        case iTunesEPlSFastForwarding:
        case iTunesEPlSRewinding:
            return 1;
    }
    return -1;
}

@end
