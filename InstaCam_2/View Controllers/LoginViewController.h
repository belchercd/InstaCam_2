//
//  LoginViewController.h
//  InstaCam_2
//
//  Created by belchercd on 7/13/19.
//  Copyright © 2019 belchercd. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface LoginViewController : UIViewController
- (IBAction)loginButton:(id)sender;
- (IBAction)signupButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
- (IBAction)onTap:(id)sender;



@end

NS_ASSUME_NONNULL_END
