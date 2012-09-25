//
//  DetailViewController.h
//  FreeHandDrawing
//
//  Created by Sebastian Kruschwitz on 25.09.12.
//
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
