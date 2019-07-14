//
//  ComposeViewController.m
//  InstaCam_2
//
//  Created by belchercd on 7/13/19.
//  Copyright © 2019 belchercd. All rights reserved.
//

#import "ComposeViewController.h"
#import "Parse.h"
#import "Post.h"
#import "InstaCell.h"

@interface ComposeViewController ()
@property (strong, nonatomic) UIImage *originalImage;
@property (strong, nonatomic) UIImage *editedImage;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // Get the image captured by the UIImagePickerController
    self.originalImage = info[UIImagePickerControllerOriginalImage];
    self.editedImage = info[UIImagePickerControllerEditedImage];
    
    self.photoView.image = self.editedImage;
    
    //resize the image before it gets posted
    [self resizeImage:self.editedImage withSize:CGSizeMake(50.0, 50.0)];
    
    
    // Dismiss UIImagePickerController to go back to your original view controller
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */



- (IBAction)cameraTap:(id)sender {
    NSLog(@"Did Tap");
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else {
        NSLog(@"Camera 🚫 available so we will use photo library instead");
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    [self presentViewController:imagePickerVC animated:YES completion:nil];
    
    [self.view endEditing: YES];
}


- (IBAction)cancelButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)shareButton:(id)sender {
    [Post postUserImage: self.editedImage withCaption:self.captionView.text withCompletion:^(BOOL succeeded, NSError * _Nullable error) {
        if (succeeded) {
            NSLog(@"@log success");
        }
        else {
            NSLog(@"@Failure");
        }
    }];
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)didTap:(id)sender {
    NSLog(@"Hello");
    [self.view endEditing: YES];
}


- (UIImage *)resizeImage:(UIImage *)image withSize:(CGSize)size {
    UIImageView *resizeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    
    resizeImageView.contentMode = UIViewContentModeScaleAspectFill;
    resizeImageView.image = image;
    
    UIGraphicsBeginImageContext(size);
    [resizeImageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *photoView = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return photoView;
}



@end
