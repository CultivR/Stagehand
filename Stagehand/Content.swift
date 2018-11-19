//
//  Content.swift
//  Stagehand
//
//  Created by Jordan Kay on 11/18/18.
//  Copyright © 2018 Cultivr. All rights reserved.
//

public protocol ContentAnimatable {
    associatedtype ContentView: UIView
    
    var contentView: ContentView { get }
}
