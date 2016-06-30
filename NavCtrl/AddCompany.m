//
//  AddCompany.m
//  NavCtrl
//
//  Created by Albert Schweitzer on 6/27/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "AddCompany.h"

@interface AddCompany ()

@end

@implementation AddCompany

- (void)viewDidLoad {
    [super viewDidLoad];
    _companyList = [[DataAccessObject sharedManager] companyList];
    
    self.userCompany = [[Company alloc] init];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)setName:(id)sender {
     self.userCompany.name = _nameTextField.text;

    
}
- (IBAction)setURL:(id)sender {
    self.userCompany.stockSymbol = _stock.text;

}
- (IBAction)setImage:(id)sender {
    self.userCompany.imageName = _imageURL.text;

}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //hides keyboard when another part of layout was touched
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

- (IBAction)addObject:(id)sender {
    
    
    if (self.userCompany.name == nil || self.userCompany.stockSymbol == nil || self.userCompany.imageName == nil)
    {
        
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Missing Fields"
                                                                       message:@"Please ensure all information fields are filled out."
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    else {
    [_companyList addObject:self.userCompany];
    self.companyViewController = [[CompanyViewController alloc] init];

    [self.navigationController pushViewController:self.companyViewController animated:YES];
    }
}

- (void)dealloc {
    [_nameTextField release];
    [_stock release];
    [_imageURL release];
    [_save release];
    [super dealloc];
}
@end
