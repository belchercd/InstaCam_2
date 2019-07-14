//
//  DetailsViewController.m
//  InstaCam_2
//
//  Created by belchercd on 7/13/19.
//  Copyright © 2019 belchercd. All rights reserved.
//

#import "DetailsViewController.h"
#import "Post.h"
#import "UIImageView+AFNetworking.h"
#import "NSDate+DateTools.h"


@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.capLabel.text = self.posts[@"caption"];
    PFFileObject *image = self.posts.image;
    NSURL *detailsPictureURL = [NSURL URLWithString:image.url];
    [self.pictureView setImageWithURL: detailsPictureURL];
    
    //create a date
    NSDate *createdAt = [self.posts createdAt];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd-yyyy HH:mm:ss"];
    NSString *newDate = [dateFormatter stringFromDate:createdAt];
    self.timeLabel.text = newDate;
}






/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
@end
