//
//  DetailViewController.m
//  FreeHandDrawing
//
//  Created by Sebastian Kruschwitz on 25.09.12.
//
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        [_detailItem removeFromSuperview];
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        [_detailItem setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
        [_scrollView setZoomScale:1.0f];
        [_scrollView addSubview:_detailItem];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    
    [_scrollView setBackgroundColor:[UIColor lightGrayColor]];
    _scrollView.minimumZoomScale = 1.0f;
    _scrollView.maximumZoomScale = 5.0f;
    
    //UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"picture"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}



-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}

- (void)viewDidUnload {
    [self setScrollView:nil];
    [super viewDidUnload];
}


#pragma mark - ScrollView delegate

-(UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return _detailItem;
}

-(void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale {
    //_detailItem.lineWidth =  (-scale * 10) + 20;
    [_detailItem setNeedsDisplay];
    
}

- (IBAction)changeColor:(id)sender {
    UIButton *button = (UIButton*)sender;
    switch (button.tag) {
        case 1: //red
            _detailItem.lineColor = [UIColor redColor];
            break;
            
        case 2: //green
            _detailItem.lineColor = [UIColor greenColor];
            break;
            
        case 3: //blue
            _detailItem.lineColor = [UIColor blueColor];
            break;
            
        default:
            break;
    }
}

- (IBAction)eraseDrawing:(id)sender {
}
@end
