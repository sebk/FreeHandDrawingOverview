//
//  DetailViewController.h
//  FreeHandDrawing
//
//  Created by Sebastian Kruschwitz on 25.09.12.
//
//

#import <UIKit/UIKit.h>
#import "PaintSuperview.h"

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate, UIScrollViewDelegate>

@property (strong, nonatomic) PaintSuperview *detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

- (IBAction)changeColor:(id)sender;
- (IBAction)eraseDrawing:(id)sender;

@end
