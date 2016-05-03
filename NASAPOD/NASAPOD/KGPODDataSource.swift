//
//  KGPODDataSource.swift
//  NASAPOD
//
//  Created by Kayla Galway on 4/27/16.
//  Copyright © 2016 edu.self. All rights reserved.
//

import Foundation

class KGPODDataSource {
    var podInfo = KGPODInfo?()
    
    func getPictureDictionary(pictureDictionary: [String : String]) {
        getPicture { (pictureDict) in
            
        }
    }
}

//let newPerson = Person(name: "Jim", lastName: "Campagno", height: 6.2)

/*
 -(void)reloadData
 {
 __weak typeof(self) weakSelf = self;
 [GGSquarespaceAPIClient fetchNewsStoryDictionariesWithCompletion:^(NSArray *stories) {
 __strong typeof(weakSelf) strongSelf = weakSelf;
 NSMutableArray *articles = [@[] mutableCopy];
 for (NSDictionary *newsDict in stories) {
 [articles addObject: [[GGNewsArticle alloc]initWithDictionary: newsDict]];
 }
 strongSelf.newsStoriesArray = articles;
 if (strongSelf.delegate && [strongSelf.delegate respondsToSelector:@selector(dataSourceDidLoad)]) {
 [strongSelf.delegate dataSourceDidLoad];
 }
 }];
 }
 */

