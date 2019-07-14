//
//  LoginViewController.m
//  InstaCam_2
//
//  Created by belchercd on 7/13/19.
//  Copyright © 2019 belchercd. All rights reserved.
//
#import "LoginViewController.h"
#import "Parse/Parse.h"


@interface LoginViewController ()

@end

@implementation LoginViewController

- (IBAction)onTap:(id)sender {
    NSLog(@"Hello");
    [self.view endEditing: YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view endEditing:YES];
    // Do any additional setup after loading the view.
}


- (IBAction)loginButton:(id)sender {
    NSString *username = self.usernameField.text;
    NSString *password = self.passwordField.text;
    
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
        if (error != nil) {
            NSLog(@"User log in failed: %@", error.localizedDescription);
        } else {
            NSLog(@"User logged in successfully");
            [self performSegueWithIdentifier:@"loginSegue" sender:self];
        }
    }];
    
}


- (IBAction)signupButton:(id)sender {
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
