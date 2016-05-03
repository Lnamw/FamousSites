//
//  SitesTableViewController.m
//  Famous Sites
//
//  Created by Elena Maso Willen on 03/05/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import "SitesTableViewController.h"
#import "Sites.h"
#import "SiteTableViewCell.h"
#import "SitesDetailsViewController.h"

@interface SitesTableViewController ()

@property (strong, nonatomic) NSMutableArray *sitesArray;


@end

@implementation SitesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"World's Famous Sites";
    
    self.sitesArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    [self loadSites];
    
}

- (void)loadSites {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"sites" ofType:@"json"];
    NSArray *siteList = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:NSJSONReadingAllowFragments error:nil];
    
    for (NSDictionary *dict in siteList) {
        Sites *newSite = [[Sites alloc]init];
        newSite.name = dict[@"name"];
        newSite.location = dict[@"location"];
        newSite.detail = dict[@"detail"];
        newSite.image = dict[@"image"];
        
        [self.sitesArray addObject:newSite];
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sitesArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SiteTableViewCell *cell = (SiteTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"SiteCell" forIndexPath:indexPath];
    
    Sites *site = self.sitesArray[indexPath.row];
    
    cell.nameCellLabel.text = site.name;
    cell.locationCellLabel.text = site.location;
    
    
    return cell;
}

#pragma mark - Table view delegate 

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self performSegueWithIdentifier:@"ShowSiteDetailSegue" sender:nil];
    
}


 #pragma mark - Navigation
 
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

     if ([segue.identifier isEqualToString:@"ShowSiteDetailSegue"]) {
         SitesDetailsViewController *vc = (SitesDetailsViewController *)[segue destinationViewController];
         
         NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
         Sites *site = self.sitesArray[indexPath.row];
         vc.siteSelected = site;
     }
     
 
 }





/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/



@end
