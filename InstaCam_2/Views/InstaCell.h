//
//  InstaCell.h
//  InstaCam_2
//
//  Created by belchercd on 7/13/19.
//  Copyright © 2019 belchercd. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface InstaCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *photoView;
@property (strong, nonatomic) IBOutlet UILabel *captionLabel;

- (IBAction)didTapLike:(id)sender;


@end

NS_ASSUME_NONNULL_END
