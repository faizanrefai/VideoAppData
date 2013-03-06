//
//  onIphone.m
//  VideoApp
//
//  Created by  on 20/06/12.
//  Copyright 2012 . All rights reserved.
//

#import "onIphone.h"
#import "VideoDetailView.h"
#import "JSONParser.h"
#import "WSStatic.h"
@implementation onIphone

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillDisappear:(BOOL)animated
{
   // self.title = @"<<";
    
    
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

    //NSLog(@"%@",dic);
    
    
    NSMutableArray *temp = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults]valueForKey:@"oniPhone"]];
    
    NSMutableArray *temp1 = [[NSMutableArray alloc]init];
    
    
    for (int i=0; [temp count]>i; i++) {
        
        
        for (int j=0; [[dic valueForKey:@"video_list"]count]>j; j++) {
            
            
            
            if ([[temp objectAtIndex:i]  isEqualToString:[[[dic valueForKey:@"video_list"]  objectAtIndex:j ] valueForKey:@"vdo_id"]]) {
                
                [temp1 addObject:[[dic valueForKey:@"video_list"]objectAtIndex:j]];
                
                
            }  else{
                
                
            }
            
        }
        
    }
    
    
        
    [videoList removeAllObjects];
    [videoList addObjectsFromArray:temp1];
    [indicator stopAnimating];

    [myTable reloadData];

}


- (void)dealloc
{
    [tableCell release];
    [myTable release];
    [namevideoLabel release];
    [timelabel release];
    [createdAtlabel release];
    [indicator release];
    [imageVi release];
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
        
        [[NSBundle mainBundle] loadNibNamed:@"OniphoneCell" owner:self options:nil];
        cell=tableCell;
        
    }
    
    namevideoLabel.text = [NSString stringWithFormat:@"%@",  [[videoList objectAtIndex:indexPath.row] valueForKey:@"name"]];
    timelabel.text = [NSString stringWithFormat:@"%@",  [[videoList objectAtIndex:indexPath.row] valueForKey:@"length"]];
    createdAtlabel.text = [NSString stringWithFormat:@"%@",  [[videoList objectAtIndex:indexPath.row] valueForKey:@"created_at"]];
    
    NSString *imgUrlStr = [[NSString stringWithFormat:@"%@",  [[videoList objectAtIndex:indexPath.row] valueForKey:@"thumbUrl"]] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    imageVi.imageURL = [NSURL URLWithString:imgUrlStr];
    
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
    bu.onIphone=TRUE;
    
    [self.navigationController pushViewController:bu animated:YES];

    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}



#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.title = @"";
    self.navigationItem.title =@"Saved Videos";

    
    videoList=[[NSMutableArray alloc]init];
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [tableCell release];
    tableCell = nil;
    [myTable release];
    myTable = nil;
    [namevideoLabel release];
    namevideoLabel = nil;
    [timelabel release];
    timelabel = nil;
    [createdAtlabel release];
    createdAtlabel = nil;
    [indicator release];
    indicator = nil;
    [imageVi release];
    imageVi = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
