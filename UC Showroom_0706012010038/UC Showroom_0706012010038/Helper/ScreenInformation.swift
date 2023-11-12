//
//  ScreenInformation.swift
//  UC Showroom_0706012010038
//
//  Created by Averill Saladin Atma Setiawan on 11/11/23.
//

import UIKit

struct ScreenInformation {
    private var screenHeight = UIScreen.main.bounds.height
    private var screenWidth = UIScreen.main.bounds.width
    
    func getScreenHeight() -> CGFloat {
        return screenHeight
    }
    
    func getScreenWidth() -> CGFloat {
        return screenWidth
    }  
}
