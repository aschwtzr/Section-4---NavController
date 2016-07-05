//
//  EditCompany.h
//  NavCtrl
//
//  Created by Albert Schweitzer on 6/29/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CompanyViewController.h"
#import "DataAccessObject.h"
#import "Company.h"
@class CompanyViewController;

@interface EditCompany : UIViewController
@property (retain, nonatomic) IBOutlet UITextField *nameTextField;
@property (retain, nonatomic) IBOutlet UITextField *stock;
@property (retain, nonatomic) IBOutlet UITextField *imageURL;
@property (retain, nonatomic) IBOutlet UIButton *save;
@property (retain, nonatomic) IBOutlet CompanyViewController *companyViewController;
@property (strong) NSMutableArray *companyList;
@property (nonatomic, strong) Company *userCompany;




@end
