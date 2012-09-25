//
//  MasterViewController.h
//  FreeHandDrawing
//
//  Created by Sebastian Kruschwitz on 25.09.12.
//
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
