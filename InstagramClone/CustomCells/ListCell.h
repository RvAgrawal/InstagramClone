//
//  ListCell.h
//  InstagramClone
//
//  Created by Ravi Agrawal on 20/05/18.
//  Copyright © 2018 Ravi Agrawal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListCell : UITableViewCell

@property(weak,nonatomic) IBOutlet UIImageView *imgInsta;
@property(weak,nonatomic) IBOutlet UILabel *lblAuthor;
@property(weak,nonatomic) IBOutlet UILabel *lblURL;
@property(weak,nonatomic) IBOutlet NSLayoutConstraint *constHeight;

@end
