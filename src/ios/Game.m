//
//  Game.m
//  Detonate
//
//  Created by Marco Piccardo on 04/02/11.
//  Copyright 2011 Eurotraining Engineering. All rights reserved.
//
/*
 *  Modified and Updated
 *
 *  Copyright 2014 Wizcorp Inc. http://www.wizcorp.jp
 *  Author Ally Ogilvie
 */
//Copyright (c) 2014 Sang Ki Kwon (Cranberrygame)
//Email: cranberrygame@yahoo.com
//Homepage: http://www.github.com/cranberrygame
//License: MIT (http://opensource.org/licenses/MIT)

#import "Game.h"
#import <Cordova/CDVViewController.h>

#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

@interface Game ()
@property (nonatomic, retain) GKScore *localPlayerScore;
@property (nonatomic, retain) GKLeaderboardViewController *leaderboardController;
@property (nonatomic, retain) GKAchievementViewController *achievementsController;
@end

@implementation Game

- (void)setUp:(CDVInvokedUrlCommand *)command {

}

- (void)login:(CDVInvokedUrlCommand *)command {
    
    //[self.commandDelegate runInBackground:^{//cranberrygame
        [[GKLocalPlayer localPlayer] setAuthenticateHandler: ^(UIViewController *viewcontroller, NSError *error) {
/*
            //already logged in
            if ([GKLocalPlayer localPlayer].authenticated) {
			
				NSString *playerID = [GKLocalPlayer localPlayer].playerID;
				NSString *displayName = [GKLocalPlayer localPlayer].displayName;
				
				NSDictionary* playerDetail = @{
					@"playerId":playerID,
					@"playerDisplayName":displayName
				};
						
				CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:playerDetail];
				//[pr setKeepCallbackAsBool:YES];
				[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
				//CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
				//[pr setKeepCallbackAsBool:YES];
				//[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
            }
            else if (viewcontroller != nil) {
                CDVViewController *vc = (CDVViewController *)[super viewController];
                [vc presentViewController:viewcontroller animated:YES completion:^{
                }];
            }
            else {
                // Called the second time with result
                if (error != nil) {	
					//CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
					//[pr setKeepCallbackAsBool:YES];
					//[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
					CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
					//[pr setKeepCallbackAsBool:YES];
					[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
                }
                else {
					NSString *playerID = [GKLocalPlayer localPlayer].playerID;
					NSString *displayName = [GKLocalPlayer localPlayer].displayName;
					
					NSDictionary* playerDetail = @{
						@"playerId":playerID,
						@"playerDisplayName":displayName
					};
							
					CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:playerDetail];		
					//[pr setKeepCallbackAsBool:YES];
					[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
					//CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
					//[pr setKeepCallbackAsBool:YES];
					//[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];	
                }
            }
*/
///*
            //It turns out that you need to go to Settings>Game Center and manually enable Sandbox.
            //http://stackoverflow.com/questions/25916055/application-is-not-recognized-by-game-center-after-building-with-xcode-6-0-1
            if (viewcontroller != nil) {
                
                //UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"1" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                //[alert1 show];
                
                CDVViewController *vc = (CDVViewController *)[super viewController];
                [vc presentViewController:viewcontroller animated:YES completion:^{
                }];
            }
            else {
                //already logged in
                if ([GKLocalPlayer localPlayer].authenticated) {
                    
                    //UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"2" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    //[alert2 show];
                    
                    NSString *playerID = [GKLocalPlayer localPlayer].playerID;
                    NSString *displayName = [GKLocalPlayer localPlayer].alias;
                    
                    NSDictionary* playerDetail = @{
                                                   @"playerId":playerID,
                                                   @"playerDisplayName":displayName
                                                   };
                    
                    CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:playerDetail];
                    //[pr setKeepCallbackAsBool:YES];
                    [self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
                    //CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
                    //[pr setKeepCallbackAsBool:YES];
                    //[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
                }
                else {
                    
                    //UIAlertView *alert3 = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"3" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    //[alert3 show];
                    
                    // Called the second time with result
                    if (error != nil) {
                        
                        UIAlertView *alert4 = [[UIAlertView alloc] initWithTitle:@"Alert" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        [alert4 show];
                        
                        
                        //CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
                        //[pr setKeepCallbackAsBool:YES];
                        //[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
                        CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
                        //[pr setKeepCallbackAsBool:YES];
                        [self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
                    }
                    else {
                        NSString *playerID = [GKLocalPlayer localPlayer].playerID;
                        NSString *displayName = [GKLocalPlayer localPlayer].alias;
                        
                        NSDictionary* playerDetail = @{
                                                       @"playerId":playerID,
                                                       @"playerDisplayName":displayName
                                                       };
                        
                        CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:playerDetail];
                        //[pr setKeepCallbackAsBool:YES];
                        [self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
                        //CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
                        //[pr setKeepCallbackAsBool:YES];
                        //[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
                    }
                }
            }
//*/
        }];
    //}];//cranberrygame
}

- (void)logout:(CDVInvokedUrlCommand *)command {
    //Unfortunately, this takes the user outside your app.
    //http://stackoverflow.com/questions/9995576/how-to-show-game-centers-player-profile-view
    //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"gamecenter:/me/account"]];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"gamecenter:/me/signout"]];
}

- (void)getPlayerImage:(CDVInvokedUrlCommand *)command {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *playerImageUrl = [documentsDirectory stringByAppendingPathComponent: @"user.jpg" ];

    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:playerImageUrl];    
    if(fileExists){
		NSLog(@"%@", playerImageUrl);
		
		CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:playerImageUrl];
		//[pr setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
		//CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
		//[pr setKeepCallbackAsBool:YES];
		//[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];	
    }
    else{
		GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
        [localPlayer loadPhotoForSize:GKPhotoSizeSmall withCompletionHandler: ^(UIImage *photo, NSError *error) {            
            if (photo != nil)
            {
                NSData* data = UIImageJPEGRepresentation(photo, 0.8);
                [data writeToFile:playerImageUrl atomically:YES];
				NSLog(@"%@", playerImageUrl);
				
				CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:playerImageUrl];
				//[pr setKeepCallbackAsBool:YES];
				[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
				//CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
				//[pr setKeepCallbackAsBool:YES];
				//[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];				
            }
            else if (error != nil)
            {
                NSLog(@"%@", [error localizedDescription]);
                
				//CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
				//[pr setKeepCallbackAsBool:YES];
				//[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
				CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
				//[pr setKeepCallbackAsBool:YES];
				[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
            }
        }];
    }
}

- (void)getPlayerScore:(CDVInvokedUrlCommand *)command {
 	NSString *leaderboardId = [command.arguments objectAtIndex:0];
    
	//http://stackoverflow.com/questions/21591123/how-to-get-local-player-score-from-game-center
	GKLeaderboard *leaderboard = [[GKLeaderboard alloc] init];
  	leaderboard.identifier = leaderboardId;
    leaderboard.playerScope = GKLeaderboardPlayerScopeGlobal;
    leaderboard.timeScope = GKLeaderboardTimeScopeAllTime;
	[leaderboard loadScoresWithCompletionHandler: ^(NSArray *scores, NSError *error) {
		if (error) {
			NSLog(@"SyncPlayerScore %@", error);
			
			//CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
			//[pr setKeepCallbackAsBool:YES];
			//[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
			CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
			//[pr setKeepCallbackAsBool:YES];
			[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
		} else if (scores && leaderboard.localPlayerScore) {
			GKScore *score = leaderboard.localPlayerScore;
            
            NSDictionary *playerDetail = @{
                @"score": [NSString stringWithFormat:@"%lld", score.value],
                @"player": score.player.alias,
                @"rank": [NSNumber numberWithLong:score.rank]
            };
            
            NSLog(@"SyncPlayerScore score: %@", playerDetail);
			
            CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:playerDetail];
 			//[pr setKeepCallbackAsBool:YES];
			[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
			//CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
			//[pr setKeepCallbackAsBool:YES];
			//[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
        } else if (self.localPlayerScore){
            /* Storing a cache of the localPlayerScore because after calling the method getTopScores, 
             the API wouldn't return any values when calling it again here, i.e. error and scores were nill */
            
            GKScore *score = self.localPlayerScore;
            
            NSDictionary *playerDetail = @{
                @"score": [NSString stringWithFormat:@"%lld", score.value],
                @"player": score.player.alias,
                @"rank": [NSNumber numberWithLong:score.rank]
            };
            
            NSLog(@"SyncPlayerScore loading from local cache: %@", playerDetail);
            
            CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:playerDetail];
            [self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
            
        } else {

            CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
            [self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
            
        }
	}];
}

- (void)submitScore:(CDVInvokedUrlCommand *)command {

    //[self.commandDelegate runInBackground:^{//cranberrygame
		NSString *leaderboardId = [command.arguments objectAtIndex:0];
        int64_t score = [[command.arguments objectAtIndex:1] integerValue];
		
		GKScore *s = [[GKScore alloc] initWithLeaderboardIdentifier: leaderboardId];
        s.value = score;
        s.context = 0;
			
		[GKScore reportScores:@[s] withCompletionHandler: ^(NSError *error) {
            if (error != nil)
            {				
				//CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
				//[pr setKeepCallbackAsBool:YES];
				//[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
				CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
				//[pr setKeepCallbackAsBool:YES];
				[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
            }
            else
            {
				CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
				//[pr setKeepCallbackAsBool:YES];
				[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
				//CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
				//[pr setKeepCallbackAsBool:YES];
				//[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
			}
		}];
    //}];//cranberrygame
}

- (void)getTopScores:(CDVInvokedUrlCommand *)command {
    
    NSString *leaderboardId = [command.arguments objectAtIndex:0];
    
    GKLeaderboard *leaderboard = [[GKLeaderboard alloc] init];
    leaderboard.identifier = leaderboardId;
    leaderboard.playerScope = GKLeaderboardPlayerScopeGlobal;
    leaderboard.timeScope = GKLeaderboardTimeScopeAllTime;
    leaderboard.range = NSMakeRange(1, 100);
    [leaderboard loadScoresWithCompletionHandler: ^(NSArray<GKScore *> *result, NSError *error) {
        

        if (error) {
            NSLog(@"%@", error);
            
            CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];

            [self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
        }
        else if (result) {
            
            self.localPlayerScore = leaderboard.localPlayerScore;
            
            NSMutableArray *scores = [[NSMutableArray alloc] init];
            for(GKScore *score in result){
                
                [scores addObject:@{
                    @"score": [NSString stringWithFormat:@"%lld", score.value],
                    @"player": score.player.alias
                }];
                
            }
            
            CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary: @{
                @"leaderboard": leaderboard.title,
                @"leaderboardId": leaderboard.identifier,
                @"scores": scores
            }];
            [self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
        } else {
            if(self.localPlayerScore) {
                self.localPlayerScore.value = 0;
            }
            
            CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary: @{
              @"leaderboard": leaderboard.title,
              @"leaderboardId": leaderboard.identifier,
              @"scores": @[]
            }];
            [self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
        }
    }];
    
}

- (void)getLeaderboards:(CDVInvokedUrlCommand *)command {

    [GKLeaderboard loadLeaderboardsWithCompletionHandler: ^(NSArray<GKLeaderboard *> *result, NSError *error) {

        if (error) {
            NSLog(@"%@", error);

            CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];

            [self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
        }
        else {
            
            NSMutableArray * leaderboards = [[NSMutableArray alloc] init];
            for(GKLeaderboard *leaderboard in result){
                [leaderboards addObject:@{@"name": leaderboard.title, @"code": leaderboard.identifier}];
            }
            
            CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArray: leaderboards];
            [self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
        }
    }];

}


- (void)getAchievements:(CDVInvokedUrlCommand *)command {


    [GKAchievement loadAchievementsWithCompletionHandler: ^(NSArray *achievements, NSError *error){
        if (error != nil)
        {
            CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
            
            [self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
        }
        else {
            NSMutableArray *response = [[NSMutableArray alloc] init];
            for(GKAchievement *achiev in achievements){
                [response addObject:achiev.identifier];
            }
            
            CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArray: response ];
            [self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
            
            
        }
        
    }];
    
}

- (void)showLeaderboard:(CDVInvokedUrlCommand *)command {
/*
    //runtime error
    //[self.commandDelegate runInBackground:^{//cranberrygame
        if ( self.leaderboardController == nil ) {
            self.leaderboardController = [[GKLeaderboardViewController alloc] init];
            self.leaderboardController.leaderboardDelegate = self;//
        }
        self.leaderboardController.category = (NSString *) [command.arguments objectAtIndex:0];
        CDVViewController *vc = (CDVViewController *)[super viewController];
        [vc presentViewController:self.leaderboardController animated:YES completion: ^{
        }];
    //}];//cranberrygame
*/
///*
    //https://github.com/leecrossley/cordova-plugin-game-center/blob/master/src/ios/GameCenter.m
    NSString *leaderboardId = (NSString *) [command.arguments objectAtIndex:0];
    
    GKGameCenterViewController *gameCenterController = [[GKGameCenterViewController alloc] init];
    if (gameCenterController != nil)
    {
        gameCenterController.gameCenterDelegate = self;
        
        if (leaderboardId.length > 0)
        {
            gameCenterController.leaderboardIdentifier = leaderboardId;
        }

        gameCenterController.viewState = GKGameCenterViewControllerStateLeaderboards;
        
        [self.viewController presentViewController:gameCenterController animated:YES completion:nil];
    }
    else
    {
    }
//*/
}

- (void)showLeaderboards:(CDVInvokedUrlCommand *)command {
    GKGameCenterViewController *gameCenterController = [[GKGameCenterViewController alloc] init];
    if (gameCenterController != nil)
    {
        gameCenterController.gameCenterDelegate = self;
        
        gameCenterController.viewState = GKGameCenterViewControllerStateLeaderboards;
        
        [self.viewController presentViewController:gameCenterController animated:YES completion:nil];
    }
    else
    {
    }
}

- (void)unlockAchievement:(CDVInvokedUrlCommand *)command {
    //[self.commandDelegate runInBackground:^{//cranberrygame
		NSString *achievementId = [command.arguments objectAtIndex:0];
				
		GKAchievement *achievement = [[GKAchievement alloc] initWithIdentifier: achievementId];
		if (achievement)
		{
			achievement.percentComplete = 100;
			
			[achievement reportAchievementWithCompletionHandler: ^(NSError *error)
			{
				 if (error != nil)
				 {
					//CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
					//[pr setKeepCallbackAsBool:YES];
					//[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
					CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
					//[pr setKeepCallbackAsBool:YES];
					[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
				} 
				 else {
					CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
					//[pr setKeepCallbackAsBool:YES];
					[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
					//CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
					//[pr setKeepCallbackAsBool:YES];
					//[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
					

				 }
			}];
		}
    //}];//cranberrygame
}

- (void)incrementAchievement:(CDVInvokedUrlCommand *)command {
    //[self.commandDelegate runInBackground:^{//cranberrygame
		NSString *achievementId = [command.arguments objectAtIndex:0];
		NSString *stepsOrPercent = [command.arguments objectAtIndex:1];
		float stepsOrPercentFloat = [stepsOrPercent floatValue];
				
		GKAchievement *achievement = [[GKAchievement alloc] initWithIdentifier: achievementId];
		if (achievement)
		{
			achievement.percentComplete = stepsOrPercentFloat;
			
			[achievement reportAchievementWithCompletionHandler: ^(NSError *error)
			{
				 if (error != nil)
				 {
					//CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
					//[pr setKeepCallbackAsBool:YES];
					//[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
					CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
					//[pr setKeepCallbackAsBool:YES];
					[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
				} 
				 else {
					CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
					//[pr setKeepCallbackAsBool:YES];
					[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
					//CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
					//[pr setKeepCallbackAsBool:YES];
					//[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
					

				 }
			}];
		}
    //}];//cranberrygame
}

- (void)showAchievements:(CDVInvokedUrlCommand *)command {//cranberrygame
    //[self.commandDelegate runInBackground:^{
        if ( self.achievementsController == nil ) {
            self.achievementsController = [[GKAchievementViewController alloc] init];
            self.achievementsController.achievementDelegate = self;//
        }
        CDVViewController *vc = (CDVViewController *)[super viewController];
        [vc presentViewController:self.achievementsController animated:YES completion: ^{
        }];
    //}];//cranberrygame
}

- (void) resetAchievements:(CDVInvokedUrlCommand*)command;
{
    [GKAchievement resetAchievementsWithCompletionHandler: ^(NSError *error)
    {
         if (error != nil)
         {
			 
			//CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
			//[pr setKeepCallbackAsBool:YES];
			//[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
			CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
			//[pr setKeepCallbackAsBool:YES];
			[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];			 
         } else {
			CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
			//[pr setKeepCallbackAsBool:YES];
			[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];
			//CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
			//[pr setKeepCallbackAsBool:YES];
			//[self.commandDelegate sendPluginResult:pr callbackId:command.callbackId];				 
         }
	}];    
}

//GKLeaderboardViewControllerDelegate
- (void)leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController {
/*
    CDVViewController *vc = (CDVViewController *)[super viewController];
    [vc dismissViewControllerAnimated:YES completion:nil];
*/
	[viewController dismissViewControllerAnimated:YES completion:nil];
}

//GKAchievementViewControllerDelegate
- (void)achievementViewControllerDidFinish:(GKAchievementViewController *)viewController {
/*
    CDVViewController* vc = (CDVViewController *)[super viewController];
    [vc dismissViewControllerAnimated:YES completion:nil];
*/
    [viewController dismissViewControllerAnimated:YES completion:nil];
}

//GKGameCenterControllerDelegate
- (void) gameCenterViewControllerDidFinish:(GKGameCenterViewController *)gameCenterViewController
{
    [gameCenterViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc {
    self.leaderboardController = nil;
    self.achievementsController = nil;
    self.localPlayerScore = nil;
    
    [super dealloc];
}

@end
