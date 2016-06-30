//
//  CompanyViewController.m
//  NavCtrl
//
//  Created by Aditya Narayan on 10/22/13.
//  Copyright (c) 2013 Aditya Narayan. All rights reserved.
//

#import "CompanyViewController.h"
#import "ProductViewController.h"
#import "DataAccessObject.h"


@interface CompanyViewController ()

@end

@implementation CompanyViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
     self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn-navAdd.png"] style:UIBarButtonItemStyleDone target:self action:@selector(addCompany:)];
    
    [self.navigationItem setLeftBarButtonItem:addButton];
    
    _companyList = [[DataAccessObject sharedManager] companyList];
    
    self.title = @"Mobile device makers";
    
    self.tableView.allowsSelectionDuringEditing = TRUE;
    
    self.editCompany = [[EditCompany alloc] init];
    self.editCompany.companyViewController = self;
    
    
    
//    self.dao = [DataAccessObject sharedManager];
}

-(void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_companyList count];
}

-(IBAction)addCompany:(id)sender {
    AddCompany *thatCompany = [[AddCompany alloc] init];
//    AddCompany *userCompany = [[AddCompany alloc] init];
    
    [self.navigationController
     pushViewController:thatCompany
     animated:YES];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell with title and image
    
    
    cell.textLabel.text = [_companyList[[indexPath row]] valueForKey:@"name"];

/*Pre DAO code for reference */
    
// generate the string that will set the background image based on the company name string
//    NSArray *companyNameArray = [[_companyList objectAtIndex:[indexPath row]] componentsSeparatedByString:@" "];
//    
//    NSString *companyLogo = [NSString stringWithFormat:@"img-companyLogo_%@.png", [companyNameArray objectAtIndex:0]];
    
    cell.imageView.image = [UIImage imageNamed:[_companyList[[indexPath row]] valueForKey:@"imageName"]];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [_companyList removeObjectAtIndex:indexPath.row];
        [self.tableView reloadData];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        [self.navigationController
         pushViewController:self.userCompany
         animated:YES];
    }
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    
}


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    

    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    [defaults setObject:[_companyList[[indexPath row]] valueForKey:@"name"] forKey:@"companySelected"];
    [defaults setInteger:indexPath.row forKey:@"row"];

    NSArray *companyNameArray = [[defaults objectForKey:@"companySelected"] componentsSeparatedByString:@" "];

    NSString *lowercaseCompanySelected = [NSString stringWithFormat:@"%@", [companyNameArray objectAtIndex:0]];
    lowercaseCompanySelected = [lowercaseCompanySelected lowercaseString];
    
    [defaults setObject:lowercaseCompanySelected forKey:@"lowercaseCompanySelected"];
    [defaults synchronize];
    NSLog(@"%@", [[NSUserDefaults standardUserDefaults] dictionaryRepresentation]);
    
    if (tableView.editing == YES) {
        
        [self.navigationController
         pushViewController:self.editCompany
         animated:YES];
    }

    
    else {
    self.productViewController.title = [defaults objectForKey:@"companySelected"];

    
    [self.navigationController
        pushViewController:self.productViewController
        animated:YES];
    
    }
}
 


@end
