//
//  OptLog.swift
//  yjps-swift
//
//  Created by 吴银春 on 16/3/18.
//  Copyright © 2016年 吴银春. All rights reserved.
//

import Foundation

func println(_ object: Any) {
    #if DEBUG
        Swift.print(object)
    #endif
}
