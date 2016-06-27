//
//  Company.h
//  NavCtrl
//
//  Created by Albert Schweitzer on 6/10/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Company : NSObject
@property (strong, nonatomic) NSMutableArray *products;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *stockSymbol;
@property (strong, nonatomic) NSString *imageName;

@end
