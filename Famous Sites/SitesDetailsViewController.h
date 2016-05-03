//
//  SitesDetailsViewController.h
//  Famous Sites
//
//  Created by Elena Maso Willen on 03/05/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Sites;

@interface SitesDetailsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *nameDetailLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@property (strong, nonatomic) Sites *siteSelected;

@end
