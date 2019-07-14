//
//  Post.h
//  InstaCam_2
//
//  Created by belchercd on 7/13/19.
//  Copyright © 2019 belchercd. All rights reserved.
//

#import "PFObject.h"
#import "Parse.h"

NS_ASSUME_NONNULL_BEGIN

@interface Post : PFObject<PFSubclassing>

@property (nonatomic, strong) NSString *postID;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) PFUser *author;

@property (nonatomic, strong) NSString *caption;
@property (nonatomic, strong) PFFileObject *image;
@property (nonatomic, strong) NSNumber *likeCount;
@property (nonatomic, strong) NSNumber *commentCount;
@property (strong, nonatomic) Post *post;




//declaring a method from my .m, so it can be used in other files
+ (void) postUserImage: ( UIImage * _Nullable )image withCaption: ( NSString * _Nullable )caption withCompletion: (PFBooleanResultBlock  _Nullable)completion;

//declaring a method from my .m, so it can be used in other files
+ (PFFileObject *)getPFFileFromImage: (UIImage * _Nullable)image;


@end

NS_ASSUME_NONNULL_END
