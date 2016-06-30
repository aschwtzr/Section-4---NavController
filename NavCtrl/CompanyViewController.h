//
//  CompanyViewController.h
//  NavCtrl
//
//  Created by Aditya Narayan on 10/22/13.
//  Copyright (c) 2013 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddCompany.h"
#import "EditCompany.h"
@class ProductViewController;
@class AddCompany;
@class EditCompany;

@interface CompanyViewController : UITableViewController


@property (nonatomic, strong) NSMutableArray *companyList;
@property (nonatomic, retain) IBOutlet  ProductViewController * productViewController;
@property (nonatomic, retain) IBOutlet AddCompany *userCompany;
@property (nonatomic, retain) IBOutlet EditCompany *editCompany;

@end
