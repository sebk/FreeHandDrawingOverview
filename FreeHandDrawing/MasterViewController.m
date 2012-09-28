//
//  MasterViewController.m
//  FreeHandDrawing
//
//  Created by Sebastian Kruschwitz on 25.09.12.
//
//

#import "MasterViewController.h"
#import "DetailViewController.h"

#import "DrawLinesTest.h"
#import "SmoothLineView.h"
#import "SmoothLineViewBuffer.h"
#import "PaintingSampleSmoothView.h"
#import "ArrayDrawingView.h"


@interface MasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    _objects = [NSMutableArray arrayWithObjects:@"DrawLines", @"SmoothLineView", @"SmoothLineViewBuffer", @"PaintingSmooth", @"ArrayDrawing", nil];
    
    [self initObjects];
    
}

-(void)initObjects {
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    cell.textLabel.text = [_objects objectAtIndex:indexPath.row];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

/*
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
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

    PaintSuperview* object = nil;
    
    switch (indexPath.row) {
        case 0: {
            object = [[DrawLinesTest alloc] initWithFrame:_detailViewController.view.bounds];
        }
            break;
            
        case 1: {
            object = [[SmoothLineView alloc] initWithFrame:_detailViewController.view.bounds];
        }
            break;
            
        case 2: {
            object = [[SmoothLineViewBuffer alloc] initWithFrame:_detailViewController.view.bounds];
        }
            break;
            
        case 3: {
            object = [[PaintingSampleSmoothView alloc] initWithFrame:_detailViewController.view.bounds];
        }
            break;
            
        case 4: {
            object = [[ArrayDrawingView alloc] initWithFrame:_detailViewController.view.bounds];
        }
            break;
            
        default:
            break;
    }
    
    self.detailViewController.detailItem = object;
    
}


-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}

@end
