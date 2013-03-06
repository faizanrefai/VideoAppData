//
//  VideoAppAppDelegate.h
//  VideoApp
//
//  Created by  on 20/06/12.
//  Copyright 2012 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoAppAppDelegate : NSObject <UIApplicationDelegate,UITabBarControllerDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@property (nonatomic,retain) UITabBarController *tabbarController;


@end



@interface UITabBarController(My)  

@end



@implementation UITabBarController (My)

//-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
//{
//
//    return YES;
//}

@end