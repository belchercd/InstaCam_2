//
//  HomeViewController.m
//  InstaCam_2
//
//  Created by belchercd on 7/13/19.
//  Copyright © 2019 belchercd. All rights reserved.
//

#import "HomeViewController.h"
#import "Parse/Parse.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
#import "InstaCell.h"
#import "Post.h"
#import "UIImageView+AFNetworking.h"
#import "DetailsViewController.h"




@interface HomeViewController ()

@property (nonatomic, strong) UIViewController *loginViewController;
@property (nonatomic, strong) NSArray *posts;
@property (nonatomic, strong) UIRefreshControl *refreshControl;


@end


@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Initialize a UIRefreshControl
    self.refreshControl = [[UIRefreshControl alloc] init];
    //    binds the action to the UIRefreshControl
    [self.refreshControl addTarget:self action:@selector(beginRefresh:) forControlEvents:UIControlEventValueChanged];
    //    adds UIRefreshControl to the tableview
    [self.tableView insertSubview:self.refreshControl atIndex:0];
    
    //declaring fetch text method
    [self fetchText];
    [self.refreshControl beginRefreshing];
    
    self.tableView.rowHeight = 420;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)fetchText {
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    query.limit = 20;
    // fetch data asynchronously
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts != nil) {
            [self.tableView reloadData];
            NSLog(@"😎😎😎 Successfully loaded home timeline");
            // do something with the array of object returned by the call
            self.posts = posts;
            [self.tableView reloadData];
        }
        else {
            NSLog(@"😫😫😫 Error getting home timeline: %@", error.localizedDescription);
        }
        // Tell the refreshControl to stop spinning
        [self.refreshControl endRefreshing];
    }];
    
    
}

- (void)beginRefresh:(UIRefreshControl *)refreshControl {
    //declaring fetchText method
    [self fetchText];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"detailSegue"]) {
        UITableViewCell *tappedCell = sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:tappedCell];
        Post *post = self.posts[indexPath.row];
        //     Get the new view controller using [segue destinationViewController].
        //        UINavigationController *navcontroller = [segue destinationViewController];
        DetailsViewController *detailsViewController = [segue destinationViewController];
        //     Pass the selected object to the new view controller.
        detailsViewController.posts = post;
        NSLog(@"Tapping on a post!");
        
    }
}


- (IBAction)logoutButton:(id)sender {
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
        appDelegate.window.rootViewController = loginViewController;
    }];
}



- (IBAction)cameraButton:(id)sender {
    [self performSegueWithIdentifier:@"cameraSegue" sender:self];
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    InstaCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InstaCell"];
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    Post *post = self.posts[indexPath.row];
    cell.captionLabel.text = post.caption;
    PFFileObject *image = post.image;
    NSURL *instaPictureURL = [NSURL URLWithString:image.url];
    [cell.imageView setImageWithURL: instaPictureURL];
    
    return cell; 
}


- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.posts.count;
}






//- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
//    <#code#>
//}
//
//- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
//    <#code#>
//}
//
//- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
//    <#code#>
//}
//
//- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
//    <#code#>
//}
//
//- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
//    <#code#>
//}

//- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
//    <#code#>
//}
//
//- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
//    <#code#>
//}
//
//- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {
//    <#code#>
//}
//
//- (void)setNeedsFocusUpdate {
//    <#code#>
//}
//
////- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
////    <#code#>
////}
//
//- (void)updateFocusIfNeeded {
//    <#code#>
//}

@end
