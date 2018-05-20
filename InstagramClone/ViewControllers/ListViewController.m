//
//  ViewController.m
//  InstagramClone
//
//  Created by Ravi Agrawal on 20/05/18.
//  Copyright © 2018 Ravi Agrawal. All rights reserved.
//

#import "ListViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.indicator startAnimating];
    
    NetworkLayer *networkLayer = [NetworkLayer new];
    networkLayer.delegate = self;
    [networkLayer getImageListCallAPI];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableview Delegate & Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell"];
    
    ListModel *listModel = [self.arrData objectAtIndex:indexPath.row];
    cell.lblAuthor.text = [NSString stringWithFormat:@"Author : %@",listModel.author];
    cell.lblURL.text = [NSString stringWithFormat:@"URL : %@",listModel.post_url];
    
    cell.imgInsta.image = [UIImage imageNamed:@"placeholder"];
    
    if ([ImageCaching checkIfImageIsCachedOrNot:listModel.filename]) {
        cell.imgInsta.image = [ImageCaching getCachedImage:listModel.filename];
    } else {
        
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://picsum.photos/%@/%@?image=%@",listModel.width,listModel.height,listModel.id]];
        
        cell.imgInsta.image = [UIImage imageNamed:@"placeholder"];
        
        // download the image asynchronously
        [self downloadImageWithURL:url andImageName:listModel.filename andIndexPath:indexPath completionBlock:^(BOOL succeeded, UIImage *image) {
            if (succeeded) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    cell.imgInsta.image = image;
                });
            }
        }];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ListModel *listModel = [self.arrData objectAtIndex:indexPath.row];
    
    CGFloat imgHeight = [listModel.height floatValue];
    CGFloat imgWidth = [listModel.width floatValue];
    
    CGFloat orgWidth = UIScreen.mainScreen.bounds.size.width;
    CGFloat orgHeight = (orgWidth * imgHeight) / imgWidth;
    
    return orgHeight + 80;
}

- (void)downloadImageWithURL:(NSURL *)url andImageName:(NSString*)imgName andIndexPath:(NSIndexPath *)indexPath completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock
{
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * data, NSURLResponse * response, NSError * error)
      {
          if (!error && data)
          {
              UIImage *image = [UIImage imageWithData:data];
              [ImageCaching saveImageForCaching:data andFileName:imgName];
              
              if (image)
              {
                  dispatch_async(dispatch_get_main_queue(),
                     ^{
                         ListCell *cell = (id)[self.tblViewList cellForRowAtIndexPath:indexPath];
                         if (cell)
                             cell.imgInsta.image = image;
                     });
              }
          }
          else
          {
              NSLog(@"Failed to load the image from URL: %@", url);
          }
      }];
    [task resume];
    
}


#pragma mark - NetworkLayer Delegate

-(void)completeDownloadingData:(NSArray *)arrData
{
    [self.indicator stopAnimating];
    self.arrData = [[NSMutableArray alloc] initWithArray:arrData];
    
    [self.tblViewList reloadData];
}


@end
