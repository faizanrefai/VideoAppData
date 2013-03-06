//
//  AllVideo.h
//  VideoApp
//
//  Created by  on 20/06/12.
//  Copyright 2012 . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGOImageView.h"

@interface AllVideo : UIViewController <UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource> {
    
    IBOutlet UITextField *searchTxt;
    IBOutlet UITableView *myTable;
    IBOutlet UIButton *searchBYNameBtn;
    IBOutlet EGOImageView *imageVdo;
    IBOutlet UIActivityIndicatorView *indicator;
    IBOutlet UITableViewCell *tablCell;
    UIView *popLeftView;
    IBOutlet UIDatePicker *datePicker;
    IBOutlet UILabel *namelabel;
    IBOutlet UILabel *deratedDatelabel;
    IBOutlet UIButton *searcgByDateBtn;
    IBOutlet UILabel *lenghthlabel;
    
    NSMutableArray * videoList;

    
}
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *searchIndicator;
- (IBAction)leftButtonItemPres:(id)sender;
@property (nonatomic, retain) IBOutlet UIView *popLeftView;
- (IBAction)closeBtnPress:(id)sender;
- (IBAction)searchByNamePressed:(id)sender;
- (IBAction)searchByDate:(id)sender;
- (IBAction)datepickerChanged:(id)sender;
- (IBAction)searchPresssed:(id)sender;

@end
