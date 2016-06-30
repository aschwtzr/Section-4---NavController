//
//  AddCompany.h
//  NavCtrl
//
//  Created by Albert Schweitzer on 6/27/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataAccessObject.h"
#import "Company.h"
#import "CompanyViewController.h"
@class CompanyViewController;

@interface AddCompany : UIViewController
@property (retain, nonatomic) IBOutlet UITextField *nameTextField;
@property (retain, nonatomic) IBOutlet UITextField *stock;
@property (retain, nonatomic) IBOutlet UITextField *imageURL;
@property (strong) NSMutableArray *companyList;
@property (retain, nonatomic) IBOutlet UIButton *save;
@property (nonatomic, retain) IBOutlet  CompanyViewController *companyViewController;
@property (nonatomic, strong) Company *userCompany;



@end
