//
//  Fonts.swift
//  WalkPaws
//
//  Created by Sofia Barrientos Raszkowska on 23/6/26.
//

import UIKit

class Fonts
{
    class Manrope
    {
        static func bold(_ size: CGFloat) -> UIFont { UIFont(name: "Manrope-Bold", size: size) ?? UIFont.boldSystemFont(ofSize: size) }
        
        static func semiBold(_ size: CGFloat) -> UIFont { UIFont(name: "Manrope-SemiBold", size: size) ?? UIFont.boldSystemFont(ofSize: size) }
        
        static func extraBold(_ size: CGFloat) -> UIFont { UIFont(name: "Manrope-ExtraBold", size: size) ?? UIFont.boldSystemFont(ofSize: size) }
        
        static func extraLight(_ size: CGFloat) -> UIFont { UIFont(name: "Manrope-ExtraLight", size: size) ?? UIFont.boldSystemFont(ofSize: size) }
        
        static func medium(_ size: CGFloat) -> UIFont { UIFont(name: "Manrope-Medium", size: size) ?? UIFont.boldSystemFont(ofSize: size) }
        
        static func regular(_ size: CGFloat) -> UIFont { UIFont(name: "Manrope-Regular", size: size) ?? UIFont.boldSystemFont(ofSize: size) }
    }
}
