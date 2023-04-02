//
//  ProfileActionModel.swift
//  
//
//  Created by Ильдар Аглиуллов on 02.04.2023.
//

import Foundation

public struct ProfileActionModel {
    public enum SelecteionType {
        case arrow
        case text(String)
        case none
        case logOut
    }
    
    public let selectionType: SelecteionType

    public let iconName: String
    public let title: String
    
    public init(iconName: String, title: String, selectionType: SelecteionType) {
        self.iconName = iconName
        self.title = title
        self.selectionType = selectionType
    }
}
