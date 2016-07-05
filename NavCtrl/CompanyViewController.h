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
@property (nonatomic, retain) IBOutlet AddCompany *addCompany;
@property (nonatomic, retain) IBOutlet EditCompany *editCompany;
@property (nonatomic, strong) NSString *stockTickerRequest;
@property (nonatomic, retain) NSString *stockPrice;
@property (nonatomic, strong) NSMutableArray *priceList;


@end
