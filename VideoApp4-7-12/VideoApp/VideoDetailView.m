//
//  VideoDetailView.m
//  VideoApp
//
//  Created by  on 21/06/12.
//  Copyright 2012 . All rights reserved.
//

#import "VideoDetailView.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <CoreMedia/CMTime.h>
#import <CoreMedia/CMTimeRange.h>
#include <CoreMedia/CMBase.h>
#include <CoreFoundation/CoreFoundation.h>
#import "JSONParser.h"


#import <MediaPlayer/MediaPlayer.h>
#import "WSStatic.h"
#import <QuartzCore/QuartzCore.h>


@implementation VideoDetailView

@synthesize dictionary;

@synthesize onIphone;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        dictionary =[[NSMutableDictionary alloc]init ];
        
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [webing release];
    [description release];
    [nameTitle release];
    [createdDateTile release];
    [iphoneBtn release];
    [deletePressed release];
    [indicator release];
    [saveToIphone release];
    [inageVi release];
    [super dealloc];
    [dictionary release];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [indicator stopAnimating];
    

}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    webing = [[UIWebView alloc]initWithFrame:inageVi.frame];    

    
    description.text =     [dictionary valueForKey:@"description"];
    nameTitle.text = [NSString stringWithFormat:@"%@",      [dictionary valueForKey:@"name"]];
    createdDateTile.text =  [NSString stringWithFormat:@"%@",     [dictionary valueForKey:@"created_at"]];
    NSString *imgUrlStr = [[NSString stringWithFormat:@"%@",  [dictionary valueForKey:@"thumbUrl"]] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    inageVi.imageURL = [NSURL URLWithString:imgUrlStr];

    self.title=@"Video Detail";
    // Do any additional setup after loading the view from its nib.jing
}

-(void)parsingFinixh:(NSDictionary*)dic
{
    
    
    
}


-(void)viewWillAppear:(BOOL)animated{

    if (onIphone) {
        
        iphoneBtn.hidden=FALSE;
        deletePressed.hidden=FALSE;
        saveToIphone.hidden=TRUE;

        
    }else{
        
        saveToIphone.hidden=FALSE;
        iphoneBtn.hidden=TRUE;
        deletePressed.hidden=TRUE;

        
    }


}

- (void)viewDidUnload
{
    [webing release];
    webing = nil;
    [description release];
    description = nil;
    [nameTitle release];
    nameTitle = nil;
    [createdDateTile release];
    createdDateTile = nil;
    [iphoneBtn release];
    iphoneBtn = nil;
    [deletePressed release];
    deletePressed = nil;
    [indicator release];
    indicator = nil;
    [saveToIphone release];
    saveToIphone = nil;
    [inageVi release];
    inageVi = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return  YES ;
    
    //for supported orientations
    //return (interfaceOrientation == UIInterfaceOrientationPortrait )||(interfaceOrientation == UIInterfaceOrientationLandscapeLeft );

}

- (IBAction)iphonePressed:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Success" message:@"Video Added" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
    
}

- (IBAction)deletePressed:(id)sender {
    
    
    NSMutableArray *temp = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults]valueForKey:@"oniPhone"]];
   
    NSMutableArray *temp1 = [[NSMutableArray alloc]init];
    
    
    
    
    for (int i=0; [temp count]>i; i++) {
        
        
        if ([[temp objectAtIndex:i]  isEqualToString:[dictionary valueForKey:@"vdo_id"]]) {
            
            
        }  else{
        
            [temp1 addObject:[temp objectAtIndex:i]];
        
        }
        
    }
    
    [[NSUserDefaults standardUserDefaults]setValue:temp1 forKey:@"oniPhone"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    [temp1 release];

    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Success" message:@"Video Deleted" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];

    
    [self.navigationController popViewControllerAnimated:YES];

    
}
- (IBAction)buttonPlay:(id)sender {
    
    
    NSString *strUrl = [NSString stringWithFormat:@"%@?vdo_id=%@",videoPlay,[dictionary valueForKey:@"vdo_id"]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:strUrl]];
    //    JSONParser *parser  = [[JSONParser alloc]initWithRequestForThread:request sel:@selector(parsingFinixh:) andHandler:self];
    //    NSLog(@"%@",parser);
    
    

//    
//  MPMoviePlayerController*  player = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL URLWithString:strUrl]];
//   player.view.frame = inageVi.frame;
//    
//    [self.view addSubview:player.view];
//    
//    [player play];
    
  //  [webing sizeToFit];
    webing.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    webing.scalesPageToFit = NO;
    webing.autoresizesSubviews = YES;
   [webing loadRequest:request];
    [self.view addSubview:webing];
    [indicator startAnimating];


}

- (IBAction)saveToIphonePressed:(id)sender {
    
    
    
    NSMutableArray *temp = [[NSMutableArray alloc]initWithArray:[[NSUserDefaults standardUserDefaults]valueForKey:@"oniPhone"]];
    
    [temp addObject:[dictionary valueForKey:@"vdo_id"]];
    
    [[NSUserDefaults standardUserDefaults]setValue:temp forKey:@"oniPhone"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    [temp release];

    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Success" message:@"Video Added" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
    

   self.onIphone=TRUE;
    
    [self viewWillAppear:YES];
}
@end
