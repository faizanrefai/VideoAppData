//
//  Setings.h
//  VideoApp
//
//  Created by  on 20/06/12.
//  Copyright 2012 . All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Setings : UIViewController <UIPickerViewDelegate,UIPickerViewDataSource> {
    
    IBOutlet UIToolbar *toolbar;
    IBOutlet UITextField *pASSword;
    IBOutlet UITextField *userName;
    IBOutlet UIPickerView *pickerManu;
}
- (IBAction)mauPressed:(id)sender;
- (IBAction)savePressed:(id)sender;
- (IBAction)backPress:(id)sender;

@end
