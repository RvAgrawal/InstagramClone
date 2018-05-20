//
//  ViewController.h
//  InstagramClone
//
//  Created by Ravi Agrawal on 20/05/18.
//  Copyright © 2018 Ravi Agrawal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListCell.h"
#import "ListModel.h"
#import "ImageCaching.h"
#import "NetworkLayer.h"

@interface ListViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,NetworkLayerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tblViewList;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;

@property(strong,nonatomic) NSMutableArray *arrData;

@end

