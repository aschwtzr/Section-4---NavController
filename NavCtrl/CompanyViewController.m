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
    self.addCompany = [[AddCompany alloc] init];
    self.stockPrice = [[NSString alloc] init];
    self.editCompany.companyViewController = self;
    self.addCompany.companyViewController = self;
    

    
    
//    self.dao = [DataAccessObject sharedManager];
}

-(void)viewWillAppear:(BOOL)animated {
    [self fetchMarket];
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
    
    [self.navigationController
     pushViewController:_addCompany
     animated:YES];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell with title and image
    
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[_companyList[[indexPath row]] valueForKey:@"name"]];
    if (self.priceList != nil){
//        _priceList = [self.stockPrice componentsSeparatedByString:@"\n"];
        cell.detailTextLabel.text = [NSString stringWithFormat: @"%@", self.priceList[[indexPath row]]];
    }
    //                           [_companyList[[indexPath row]] valueForKey:@"name"],[self.priceList[0]]];

    
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
         pushViewController:self.addCompany
         animated:YES];
    }
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    
}

- (IBAction)fetchMarket;
{
    
    self.stockTickerRequest = [[self.companyList valueForKey:@"stockSymbol"] componentsJoinedByString:@"+"];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://finance.yahoo.com/d/quotes.csv?s=%@&f=a",self.stockTickerRequest]];
    
    //GET request is below
    NSMutableURLRequest *request =  [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error) {
                                      NSLog(@"Got response %@ with error %@.\n", response, error);
                                      NSLog(@"DATA:\n%@\nEND DATA\n",
                                            [[NSString alloc] initWithData: data
                                                                  encoding: NSUTF8StringEncoding]);
                                      
                                      NSString *askPrice = [[NSString alloc] initWithData: data
                                                                                 encoding: NSUTF8StringEncoding];
                                      
                                      self.priceList = [[[NSMutableArray alloc] init] autorelease];
                                      self.stockPrice = askPrice;
                                      self.priceList = (NSMutableArray*)[askPrice componentsSeparatedByString:@"\n"];
                                      
                                      dispatch_async(dispatch_get_main_queue(), ^{
                                          [self.tableView reloadData];
                                      });
                                      

                                      
                                      
                                      
                                  }];
    
    
    [task resume];
    
    
    
    
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
