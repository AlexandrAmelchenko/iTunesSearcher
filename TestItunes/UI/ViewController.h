//
//  ViewController.h
//  TestItunes
//
//  Created by Alex Amelchenko on 04/06/16.
//  Copyright © 2016 Alex Amelchenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewModel.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property(nonatomic, weak) IBOutlet UISearchBar *searchBar;
@property(nonatomic, weak) IBOutlet UINavigationBar *navigationBar;
@property ViewModel *viewModel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;


@end

