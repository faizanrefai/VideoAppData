//
//  onIphone.h
//  VideoApp
//
//  Created by  on 20/06/12.
//  Copyright 2012 . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGOImageView.h"

@interface onIphone : UIViewController {
    
    
    IBOutlet UIActivityIndicatorView *indicator;
    IBOutlet UILabel *timelabel;
    IBOutlet UILabel *namevideoLabel;
    IBOutlet EGOImageView *imageVi;
    IBOutlet UILabel *createdAtlabel;
    IBOutlet UITableView *myTable;
    IBOutlet UITableViewCell *tableCell;
    
    NSMutableArray * videoList;
    
}

@end
