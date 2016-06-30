//
//  EditCompany.m
//  NavCtrl
//
//  Created by Albert Schweitzer on 6/29/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "EditCompany.h"

@interface EditCompany ()

@end

@implementation EditCompany

- (void)viewDidLoad {
    [super viewDidLoad];
    _companyList = [[DataAccessObject sharedManager] companyList];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    
    self.userCompany = _companyList[[defaults integerForKey:@"row"]];

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)setName:(id)sender {
    self.userCompany.name = _nameTextField.text;
}
- (IBAction)setStock:(id)sender {
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
- (IBAction)save:(id)sender {
//    self.companyViewController = [[CompanyViewController alloc] init];
    
    [self.navigationController pushViewController:self.companyViewController animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
