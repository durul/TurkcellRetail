//
//  AppDelegate.m
//  turkcellretail2
//
//  Created by ddalkanat on 24/10/14.
//  Copyright (c) 2014 netservis. All rights reserved.
//
#import "AppDelegate.h"
#import "Flurry.h"
#import <Parse/Parse.h>
#import "Utils.h"
#import <FlightRecorder/FlightRecorder.h>
#import "SJOPaperboyViewController.h"
#import "TestFlight.h"
#import <Rollout/Rollout.h>


@interface AppDelegate ()
{
    //License Time Checking
    int counterA;
    bool startA;
    NSTimer *timerA;
    IBOutlet UILabel *secondsA;
}

- (void) updateTimer;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
#if defined( DEBUG )
    [Rollout setupWithDebug:YES];
#else
    [Rollout setupWithDebug:NO];
#endif
    
    [TestFlight takeOff:@"4b15cbaa-0d56-474c-86ca-45f9f407ea65"];
    // The rest of your application:didFinishLaunchingWithOptions method// ...

    //Drain configuration
    [[UIApplication sharedApplication] setIdleTimerDisabled:YES];
    
    //Storyboard Configuration
     if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
        UIStoryboard *storyBoard;
        
        CGSize result = [[UIScreen mainScreen] bounds].size;
        CGFloat scale = [UIScreen mainScreen].scale;
        result = CGSizeMake(result.width * scale, result.height * scale);
        
        if(result.height == 1136){  // iPhone 5 Konfigurasyon
            storyBoard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
            UIViewController *initViewController = [storyBoard instantiateInitialViewController];
            [self.window setRootViewController:initViewController];
        }
        
        if(result.height == 1334) { // iPhone 6 Konfigurasyon
            storyBoard = [UIStoryboard storyboardWithName:@"Storyboard6" bundle:nil];
            UIViewController *initViewController = [storyBoard instantiateInitialViewController];
            [self.window setRootViewController:initViewController];
        }
         
         if(result.height == 2048) { // iPad Konfigurasyon
             storyBoard = [UIStoryboard storyboardWithName:@"Storyboard_ipad" bundle:nil];
             UIViewController *initViewController = [storyBoard instantiateInitialViewController];
             [self.window setRootViewController:initViewController];
         }
         
    }

    
    //TODO: UDID Konfigüre edilecek.
    [[FlightRecorder sharedInstance] setSessionUserID:@"100"];
    
    // Initialize the FlightRecorder!
    [[FlightRecorder sharedInstance] setAccessKey:@"08b6997f-62a2-449b-9640-a65d52b1e347" secretKey:@"bbae9bb8-a184-4c5d-a13e-51e0f9c0e087"];
    [[FlightRecorder sharedInstance] setShouldStartLocationManager:YES];
    [[FlightRecorder sharedInstance] startFlight];
    
    // Tema Yükle
    [self customizeTheme];
    
    
    //iCloud Configuration
    NSURL *ubiq = [[NSFileManager defaultManager] URLForUbiquityContainerIdentifier:nil];
    if (ubiq) {
        NSLog(@"iCloud access at %@", ubiq);
        // TODO: Load document...
    } else {
        NSLog(@"No iCloud access");
    }

    
    // For iOS 8:
    UIUserNotificationSettings *settings =
    [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert |
     UIUserNotificationTypeBadge |
     UIUserNotificationTypeSound
                                      categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    [[UIApplication sharedApplication] registerForRemoteNotifications];
    
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    } else {
        // iOS < 8 Notifications
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
         (UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert)];
    }
#else
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes: UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge];
#endif
    
    
    
    // ****************************************************************************
    // Uncomment and fill in with your Parse credentials:
    [Parse setApplicationId:@"E5pg3xBVb5zDbLlPeuXpiRvpLuao71rQnZRBK66r" clientKey:@"AZqmiI1NunOx53Kp4iyg6eSN72K1HTy0jixPC1wa"];
    //


    //note: iOS only allows one crash reporting tool per app; if using another, set to: NO
    //[Flurry setCrashReportingEnabled:YES];
    
    // Replace YOUR_API_KEY with the api key in the downloaded package
    [Flurry startSession:@"V6KNBJP4KKG7GXG5ZKB2"];
    
    //Countdown for shutdown program
    if(startA == TRUE) //Check that another instance is not already running.
    {
        secondsA.text = @"172790";
        startA = FALSE;
        timerA = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
    }

    
    return YES;
}


#pragma mark - Push notifications

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    // Store the deviceToken in the current installation and save it to Parse.
    PFInstallation *currentInstallation = [PFInstallation currentInstallation];
    [currentInstallation setDeviceTokenFromData:deviceToken];
    currentInstallation.channels = @[ @"Turkcell" ];
    [currentInstallation saveInBackground];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    [PFPush handlePush:userInfo];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    if (error.code == 3010) {
        NSLog(@"Push notifications are not supported in the iOS Simulator.");
    } else {
        // show some alert or otherwise handle the failure to register.
        NSLog(@"application:didFailToRegisterForRemoteNotificationsWithError: %@", error);
    }
}

#ifdef __IPHONE_8_0
- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
{
    //register to receive notifications
    [application registerForRemoteNotifications];
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void(^)())completionHandler
{
    //handle the actions
    if ([identifier isEqualToString:@"declineAction"]){
    }
    else if ([identifier isEqualToString:@"answerAction"]){
    }
}
#endif


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - Timer
- (void)awakeFromNib{
    
    counterA = 5;
    startA = TRUE;
    
}

- (void)updateTimer{ //Happens every time updateTimer is called. Should occur every second.
    
    counterA -= 1;
    secondsA.text = [NSString stringWithFormat:@"%i", counterA];
    
    if (counterA < 0) // Once timer goes below 0, reset all variables.
    {
        
        secondsA.text = @"1 year later";
        
        [timerA invalidate];
        startA = TRUE;
        counterA = 31557600;
        
        exit(0);
    }
    
}



#pragma mark - Theme

- (void)customizeTheme {

    // Change the appearance of back button
    UIImage *backButtonImage = [[UIImage imageNamed:@"home_buton.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 22, 0, 0)];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    
    UIImage *navBarImage = [UIImage imageNamed:@"navbar.png"];
    if(![Utils isVersion6AndBelow])
        navBarImage = [UIImage imageNamed:@"navbar-7.png"];
    
    [[UINavigationBar appearance] setBackgroundImage:navBarImage forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIColor darkGrayColor],
      [UIColor whiteColor],
      nil]];
  }


@end
