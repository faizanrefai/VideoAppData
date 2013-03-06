//
//  VideoAppAppDelegate.m
//  VideoApp
//
//  Created by  on 20/06/12.
//  Copyright 2012 . All rights reserved.
//

#import "VideoAppAppDelegate.h"
#import "AllVideo.h"
#import "onIphone.h"
#import "Setings.h"

@implementation VideoAppAppDelegate


@synthesize window=_window;

@synthesize navigationController=_navigationController;
@synthesize tabbarController = _tabbarController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    // Add the navigation controller's view to the window and display.
    
      
    
    UIViewController *viewController1 = [[[AllVideo alloc] initWithNibName:@"AllVideo" bundle:nil] autorelease];
    UIViewController *viewController2 = [[[onIphone alloc] initWithNibName:@"onIphone" bundle:nil] autorelease];
    UIViewController *viewController3 = [[[Setings alloc] initWithNibName:@"Setings" bundle:nil] autorelease];
    
    
    UINavigationController *navi1=[[UINavigationController alloc]initWithRootViewController:viewController1];
    UINavigationController *navi2=[[UINavigationController alloc]initWithRootViewController:viewController2];
    UINavigationController *navi3=[[UINavigationController alloc]initWithRootViewController:viewController3];
    
    
    navi1.navigationBar.barStyle = UIBarStyleBlack;
    navi1.tabBarItem.title = @"All Videos";
    navi1.tabBarItem.image = [UIImage imageNamed:@"ply.png"];
    
    navi2.navigationBar.barStyle = UIBarStyleBlack;
    navi2.tabBarItem.title = @"On iPhone";
    navi2.tabBarItem.image = [UIImage imageNamed:@"iphone_icon.png"];
    
    navi3.navigationBar.barStyle = UIBarStyleBlack;
    navi3.tabBarItem.title = @"Setings";
    navi3.tabBarItem.image = [UIImage imageNamed:@"sett.png"];
   
    
    if ([[NSUserDefaults standardUserDefaults]valueForKey:@"oniPhone"]) {
        
    }else{
    
        NSMutableArray *arry = [[NSMutableArray alloc]init];
        [[NSUserDefaults standardUserDefaults]setValue:arry forKey:@"oniPhone"];
        [[NSUserDefaults standardUserDefaults]synchronize];
    
    }
    
    
    //   self.tabBarController = [[[UITabBarController alloc] init] autorelease];
    
    //    self.tabBarController.tabBar 
    
    
    if ([self.tabbarController.tabBar respondsToSelector:@selector(setBackgroundImage:)])
    {
        // set it just for this instance
        //[self.tabbarController.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbar.png"]];
        
        
        // set for all
        // [[UITabBar appearance] setBackgroundImage: ...
    }
    
    self.tabbarController = [[UITabBarController alloc]init];
    self.tabbarController.delegate=self;
     
    self.tabbarController.viewControllers = [NSArray arrayWithObjects:navi1,navi2,navi3, nil];
     
   
    
    self.navigationController.navigationBarHidden=TRUE;
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}


-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{

    [(UINavigationController*)viewController popToRootViewControllerAnimated:NO];

}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [_navigationController release];
    [_tabbarController release];
    [super dealloc];
}

@end
