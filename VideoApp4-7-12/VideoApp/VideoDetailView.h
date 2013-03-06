//
//  VideoDetailView.h
//  VideoApp
//
//  Created by  on 21/06/12.
//  Copyright 2012 . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGOImageView.h"

@interface VideoDetailView : UIViewController  <UIWebViewDelegate> {
    
    IBOutlet UIActivityIndicatorView *indicator;
     UIWebView *webing;
    
    IBOutlet UILabel *nameTitle;
    
    IBOutlet EGOImageView *inageVi;
    IBOutlet UIButton *saveToIphone;
    IBOutlet UIButton *iphoneBtn;
    
    IBOutlet UIButton *deletePressed;
    IBOutlet UILabel *createdDateTile;
    IBOutlet UITextView *description;
    
    
    
}
- (IBAction)iphonePressed:(id)sender;
- (IBAction)deletePressed:(id)sender;

@property (nonatomic,assign)BOOL onIphone;
- (IBAction)buttonPlay:(id)sender;

- (IBAction)saveToIphonePressed:(id)sender;
@property (nonatomic,retain)NSMutableDictionary *dictionary;

@end
