//
//  Extensions.swift
//  EnhanceQuizStarter
//
//  Created by nikko444 on 2019-02-05.
//  Copyright © 2019 Treehouse. All rights reserved.
//

import UIKit

extension UIColor {
    struct GameColor {
        static var defaultScreenColor: UIColor  { return UIColor(red: 8/255.0, green: 43/255.0, blue: 62/255.0, alpha: 1.0) }
        static var correctAnswerColor: UIColor { return UIColor(red: 59/255.0, green: 177/255.0, blue: 90/255.0, alpha: 1.0) }
        static var wrongAnswerColor: UIColor { return UIColor(red: 209/255.0, green: 68/255.0, blue: 66/255.0, alpha: 1.0) }
    }
}
extension UIFont {
    struct GameFont {
        static var labelDefault: UIFont { return UIFont(name:"HelveticaNeue-Bold", size: 17.0)! }
        static var labelBold: UIFont { return UIFont(name:"HelveticaNeue-Bold", size: 19.0)! }
        static var buttonDefault: UIFont { return UIFont(name:"HelveticaNeue", size: 16.0)! }
        static var buttonBold: UIFont { return UIFont(name:"HelveticaNeue-Bold", size: 17.0)! }
    }
}
