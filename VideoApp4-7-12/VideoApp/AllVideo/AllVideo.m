//
//  AllVideo.m
//  VideoApp
//
//  Created by  on 20/06/12.
//  Copyright 2012 . All rights reserved.
//

#import "AllVideo.h"
#import "VideoDetailView.h"
#import "JSONParser.h"
#import "WSStatic.h"

@implementation AllVideo
@synthesize searchIndicator;
@synthesize popLeftView;

int i=0;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [popLeftView release];
    [tablCell release];
    [myTable release];
    [namelabel release];
    [deratedDatelabel release];
    [lenghthlabel release];
    [indicator release];
    [searchTxt release];
    [searchBYNameBtn release];
    [searcgByDateBtn release];
    [datePicker release];
    [searchIndicator release];
    [imageVdo release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [videoList count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
       
        [[NSBundle mainBundle] loadNibNamed:@"AllVideoCell" owner:self options:nil];
        cell=tablCell;
        
    }
    
    namelabel.text =[NSString stringWithFormat:@"%@",  [[videoList objectAtIndex:indexPath.row] valueForKey:@"name"]];
    lenghthlabel.text =[NSString stringWithFormat:@"%@",   [[videoList objectAtIndex:indexPath.row] valueForKey:@"length"]];
    deratedDatelabel.text = [NSString stringWithFormat:@"%@",  [[videoList objectAtIndex:indexPath.row] valueForKey:@"created_at"]];
 
    NSString *imgUrlStr = [[NSString stringWithFormat:@"%@",  [[videoList objectAtIndex:indexPath.row] valueForKey:@"thumbUrl"]] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"%@",imgUrlStr);
    
    imageVdo.imageURL = [NSURL URLWithString:imgUrlStr];
    
    // Configure the cell.
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete)
 {
 // Delete the row from the data source.
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert)
 {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
 }   
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    VideoDetailView *bu = [[VideoDetailView alloc]initWithNibName:@"VideoDetailView" bundle:nil];
   [bu.dictionary addEntriesFromDictionary:[videoList objectAtIndex:indexPath.row] ];
  
      
    NSMutableArray *temp = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults]valueForKey:@"oniPhone"]];
    
    
    for (int i=0; [temp count]>i; i++) {
        
               
            if ([[temp objectAtIndex:i]  isEqualToString:[[videoList  objectAtIndex:indexPath.row ] valueForKey:@"vdo_id"]]) {
                
                bu.onIphone=TRUE;
                break;
 
                
            }  else{
                
                bu.onIphone=FALSE;
 
            }
            
        
    }
    
    
    [self.navigationController pushViewController:bu animated:YES];
    
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

-(void)viewWillDisappear:(BOOL)animated
{
   // self.title = @"<<";

    
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
  //  self.title = @"";
    self.navigationItem.title =@"All Videos";

    
    videoList  = [[NSMutableArray alloc]init];

    UIImage *faceImage = [UIImage imageNamed:@"1341386855_check-all"];
//    UIButton *face = [UIButton buttonWithType:UIButtonTypeCustom];
//    face.bounds = CGRectMake( 0, 0, faceImage.size.width, faceImage.size.height );
//    [face setImage:faceImage forState:UIControlStateNormal];
//    UIBarButtonItem *faceBtn = [[UIBarButtonItem alloc] initWithCustomView:face];
//    UIBarButtonItem *btn = [[UIBarButtonItem alloc]ini:@"==" style:UIBarButtonItemStyleBordered target:self action:@selector(leftButtonItemPres:)];
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithImage:faceImage style:UIBarButtonItemStylePlain target:self action:@selector(leftButtonItemPres:)];
    self.navigationItem.leftBarButtonItem = btn;
    [btn release];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setPopLeftView:nil];
    [tablCell release];
    tablCell = nil;
    [myTable release];
    myTable = nil;
    [namelabel release];
    namelabel = nil;
    [deratedDatelabel release];
    deratedDatelabel = nil;
    [lenghthlabel release];
    lenghthlabel = nil;
    [indicator release];
    indicator = nil;
    [searchTxt release];
    searchTxt = nil;
    [searchBYNameBtn release];
    searchBYNameBtn = nil;
    [searcgByDateBtn release];
    searcgByDateBtn = nil;
    [datePicker release];
    datePicker = nil;
    [self setSearchIndicator:nil];
    [imageVdo release];
    imageVdo = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)leftButtonItemPres:(id)sender {
    
    if (i==0) {
        
        popLeftView.frame = CGRectMake(-320, 0, 300, popLeftView.frame.size.height);   
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.8];
        [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:popLeftView cache:NO];
        popLeftView.frame = CGRectMake(0, 0, 300, popLeftView.frame.size.height);   
        [self.view addSubview:popLeftView];
        [UIView commitAnimations];
        i=1;

        
    }else{
        
        
        popLeftView.frame = CGRectMake(0, 0, 300, popLeftView.frame.size.height);   
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.8];
        [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:popLeftView cache:NO];
        popLeftView.frame = CGRectMake(-320, 0, 300, popLeftView.frame.size.height);   
        [UIView commitAnimations];
        i=0;
        
    
    }
    
    
       
}



-(void)viewWillAppear:(BOOL)animated
{
    [indicator startAnimating];

    NSString *strUrl = [NSString stringWithFormat:@"%@?action=user_video&userid=%@",allVideolist,[[NSUserDefaults standardUserDefaults]valueForKey:@"userId"]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:strUrl]];
    
    JSONParser *parser  = [[JSONParser alloc]initWithRequestForThread:request sel:@selector(parsingFinixh:) andHandler:self];
    NSLog(@"%@",parser);
    
    
    
}

-(void)parsingFinixh:(NSDictionary*)dic
{
    
 //   NSLog(@"%@",dic);
    
    [searchIndicator stopAnimating];

    
    [videoList removeAllObjects];
    [videoList addObjectsFromArray:[dic valueForKey:@"video_list"]];
    [myTable reloadData];
    
    if ([videoList count]==0) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"No Data Found" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
    }
    
    [indicator stopAnimating];
   [self closeBtnPress:nil];

    
}



-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;

}
- (IBAction)closeBtnPress:(id)sender {
    
    if (i==0) {
        
//        popLeftView.frame = CGRectMake(-300, 0, 300, popLeftView.frame.size.height);   
//        [UIView beginAnimations:nil context:nil];
//        [UIView setAnimationDuration:0.8];
//        [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:popLeftView cache:NO];
//        popLeftView.frame = CGRectMake(0, 0, 300, popLeftView.frame.size.height);   
//        [self.view addSubview:popLeftView];
//        [UIView commitAnimations];
//        i=1;
        
        
    }else{
        
        
        popLeftView.frame = CGRectMake(0, 0, 300, popLeftView.frame.size.height);   
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.8];
        [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:popLeftView cache:NO];
        popLeftView.frame = CGRectMake(-320, 0, 300, popLeftView.frame.size.height);   
        [UIView commitAnimations];
        i=0;
        
        
    }

    
}

- (IBAction)searchByNamePressed:(UIButton*)sender {
    
    searcgByDateBtn.selected=FALSE;
    searchBYNameBtn.selected=TRUE;

    [searchTxt becomeFirstResponder];
    datePicker.hidden=TRUE;
}

- (IBAction)searchByDate:(UIButton*)sender {
    
    
    searchBYNameBtn.selected=FALSE;
    searcgByDateBtn.selected=TRUE;
    [searchTxt resignFirstResponder];

    datePicker.hidden=FALSE;

    
}

- (IBAction)datepickerChanged:(UIDatePicker*)sender {
    

    NSDateFormatter *formattor = [[NSDateFormatter alloc]init];
    [formattor setDateFormat:@"yyyy-MM-dd"];
    
    searchTxt.text = [formattor stringFromDate: [datePicker date]];
    
    
    [formattor release];
    datePicker.hidden=TRUE;
    
    
    
}

- (IBAction)searchPresssed:(id)sender {
    
    NSString *strUrl ;
    
    [searchIndicator startAnimating];
    
    if ([searcgByDateBtn isSelected]) {
        
        strUrl = [NSString stringWithFormat:@"%@?action=filter_video&userid=%@&name=%@",allVideolist,[[NSUserDefaults standardUserDefaults]valueForKey:@"userId"],searchTxt.text];

        
    }
    else{
    
        strUrl = [NSString stringWithFormat:@"%@?action=filter_video&userid=%@&created_at=%@",allVideolist,[[NSUserDefaults standardUserDefaults]valueForKey:@"userId"],searchTxt.text];

    
    }
    
    
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:strUrl]];
    
    JSONParser *parser  = [[JSONParser alloc]initWithRequestForThread:request sel:@selector(parsingFinixh:) andHandler:self];
    NSLog(@"%@",parser);
    

    
    
}



@end
