//
//  ProductViewController.h
//  NavCtrl
//
//  Created by Aditya Narayan on 10/22/13.
//  Copyright (c) 2013 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Company.h"
#import "Product.h"
#import "WebViewController.h"

@interface ProductViewController : UITableViewController
@property (nonatomic, retain) IBOutlet  WebViewController *productWebView;
@property (nonatomic, strong) NSMutableArray *companyList;


@end
