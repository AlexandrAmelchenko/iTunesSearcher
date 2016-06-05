//
//  ViewController.m
//  TestItunes
//
//  Created by Alex Amelchenko on 04/06/16.
//  Copyright © 2016 Alex Amelchenko. All rights reserved.
//

#import "ViewController.h"
#import "SearchEntityTableViewCell.h"
#import "RKDropdownAlert.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.estimatedRowHeight = 80;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.viewModel = [ViewModel new];
    self.activityIndicator.hidden = true;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SearchEntityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EntityTableViewCell"
                                                                      forIndexPath:indexPath];
    if (cell != nil) {
        [cell bindWithEntity:self.viewModel.model.results[indexPath.row]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else {
        return [[UITableViewCell alloc] init];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.viewModel != nil) {
        return self.viewModel.numberOfItems;
    }
    else {
        return 0;
    }
}

- (IBAction)sendSearchLine:(id)sender {
    [self.view endEditing:YES];
    if (self.searchBar.text.length > 0) {
        [self.activityIndicator startAnimating];
        self.activityIndicator.hidden = false;
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
            [[self.viewModel searchLineAPISignalForLine:self.searchBar.text] subscribeNext:^(id x) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.activityIndicator stopAnimating];
                    self.activityIndicator.hidden = true;
                    [self.tableView reloadData];
                    if (self.viewModel.numberOfItems > 0) {
                        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
                    }
                    else {
                        [RKDropdownAlert title:@"Nothing found"];
                    }
                });
            }                                               error:^(NSError *error) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [RKDropdownAlert title:@"Loading error"];
                    [self.activityIndicator stopAnimating];
                    self.activityIndicator.hidden = true;
                });
            }];
        });
    }
    else {
    }
}

@end
