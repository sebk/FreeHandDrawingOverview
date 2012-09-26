//
//  DrawingController.m
//  DrawLines
//
//  Created by Reetu Raj on 11/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DrawingController.h"


@implementation DrawingController
@synthesize segmentBar;


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

    MyLineDrawingView *drawScreen=[[MyLineDrawingView alloc]initWithFrame:CGRectMake(0, 45, 768, 1004)];
    [self.view addSubview:drawScreen];
    [drawScreen release];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    
}
-(IBAction)segmentBarValueChanged:(id)sender
{
    for(UIView *view in [self.view subviews])
    {
        if(![view isKindOfClass:[UISegmentedControl class]])
            [view removeFromSuperview];
    }
    
    switch ([(UISegmentedControl *)sender selectedSegmentIndex]) {
        case 0:
        {
            MyLineDrawingView *drawScreen=[[MyLineDrawingView alloc]initWithFrame:CGRectMake(0, 45, 768, 1004)];
            [self.view addSubview:drawScreen];
            [drawScreen release];            
        }
            break;
        case 1:
        {
            MyPatternBrush *drawScreen=[[MyPatternBrush alloc]initWithFrame:CGRectMake(0, 45, 768, 1004)];
            [self.view addSubview:drawScreen];
            [drawScreen release];
        
        }
            break;
    }

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
