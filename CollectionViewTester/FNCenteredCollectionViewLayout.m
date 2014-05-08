//
//  FNCenteredCollectionViewLayout.m
//  Findery
//
//  Created by John Fox on 4/29/14.
//  Copyright (c) 2014 Jed Lau. All rights reserved.
//

#import "FNCenteredCollectionViewLayout.h"

@interface FNCenteredCollectionViewLayout()
{
}

@property (nonatomic, strong) NSDictionary *layoutInfo;

@end

@implementation FNCenteredCollectionViewLayout

- (id)init
{
    if (!(self = [super init])) return nil;
    
    return self;
}

- (CGSize)collectionViewContentSize
{
    NSInteger itemCount = [self.collectionView numberOfItemsInSection:0];
    
    NSLog(@"itemSize is %@", NSStringFromCGSize(self.itemSize));
    
    CGSize mySize = CGSizeMake(self.itemSize.width * itemCount, self.itemSize.height);
    
    NSLog(@"will return this size %@", NSStringFromCGSize(mySize));
    
   return mySize;
}


@end
