//
//  DetailsViewController.h
//  InstaCam_2
//
//  Created by belchercd on 7/13/19.
//  Copyright © 2019 belchercd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *pictureView;
@property (strong, nonatomic) IBOutlet UILabel *capLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) Post *posts;


@end

NS_ASSUME_NONNULL_END
