//
//  SitesDetailsViewController.m
//  Famous Sites
//
//  Created by Elena Maso Willen on 03/05/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import "SitesDetailsViewController.h"
#import "Sites.h"

@interface SitesDetailsViewController ()

@end

@implementation SitesDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.nameDetailLabel.text = self.siteSelected.name;
    self.imageView.image = [UIImage imageNamed:self.siteSelected.image];
    
    self.detailLabel.text = self.siteSelected.detail;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
