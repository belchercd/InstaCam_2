//
//  ComposeViewController.h
//  InstaCam_2
//
//  Created by belchercd on 7/13/19.
//  Copyright © 2019 belchercd. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ComposeViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (weak, nonatomic) IBOutlet UITextView *captionView;

- (UIImage *)resizeImage:(UIImage *)image withSize:(CGSize)size;


- (IBAction)cameraTap:(id)sender;
- (IBAction)cancelButton:(id)sender;
- (IBAction)shareButton:(id)sender;
- (IBAction)didTap:(id)sender;

@end

NS_ASSUME_NONNULL_END
