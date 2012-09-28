//
//  DrawingController.m
//  DrawLines
//
//  Created by Reetu Raj on 11/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DrawingController.h"


@implementation DrawingController



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
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{

    [self.view setBackgroundColor:[UIColor whiteColor]];

    drawScreen=[[MyLineDrawingView alloc]initWithFrame:CGRectMake(0, 45, 768, 1004)];
    [drawScreen setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:drawScreen];

    
    UIButton *undoButton=[UIButton  buttonWithType:UIButtonTypeCustom];
    [undoButton setTitle:@"UNDO" forState:UIControlStateNormal];
    [undoButton setBackgroundColor:[UIColor blackColor]];
    undoButton.frame=CGRectMake(0, 0, 100, 40);
    [undoButton addTarget:self action:@selector(undoButtonClicked:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:undoButton];
    
    
    UIButton *redoButton=[UIButton  buttonWithType:UIButtonTypeCustom];
    [redoButton setTitle:@"REDO" forState:UIControlStateNormal];
    [redoButton setBackgroundColor:[UIColor blackColor]];
    redoButton.frame=CGRectMake(120, 0, 100, 40);
    [redoButton addTarget:self action:@selector(redoButtonClicked:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:redoButton];
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    
}

-(IBAction)undoButtonClicked:(id)sender
{
    [drawScreen undoButtonClicked];

}

-(IBAction)redoButtonClicked:(id)sender
{
    [drawScreen redoButtonClicked];
    
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}






@end
