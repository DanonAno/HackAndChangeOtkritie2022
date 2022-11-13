//
//  Colors.swift
//  HackAndChangeOtkritie2022
//
//  Created by  Даниил on 11.11.2022.
//

import UIKit

extension UIColor {
    
    // MARK: - Color Scheme

    public class var primary100: UIColor
    {
        UIColor(red: 228/255, green: 242/255, blue: 248/255, alpha: 1)
    }
    
    public class var primary300: UIColor
    {
        UIColor(red: 193/255, green: 229/255, blue: 245/255, alpha: 1)
    }
    
    public class var primary500: UIColor
    {
        UIColor(red: 85/255, green: 187/255, blue: 235/255, alpha: 1)
    }
    
    public class var primary700: UIColor
    {
        UIColor(red: 69/255, green: 122/255, blue: 151/255, alpha: 1)
    }
    
    public class var primary900: UIColor
    {
        UIColor(red: 53/255, green: 57/255, blue: 66/255, alpha: 1)
    }
    
    public class var system100: UIColor
    {
        UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    }
    
    public class var system400: UIColor
    {
        UIColor(red: 222/255, green: 222/255, blue: 222/255, alpha: 1)
    }
    public class var Brand: UIColor
    {
        UIColor(red: 58/255, green: 182/255, blue: 236/255, alpha: 1)
    }
    public class var constant_whie: UIColor
    {
        UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    }
    public class var morning: UIColor
    {
        UIColor(red: 240/255, green: 244/255, blue: 247/255, alpha: 1)
    }
    public class var morning2: UIColor
    {
        UIColor(red: 224/255, green: 233/255, blue: 236/255, alpha: 1)
    }
    public class var noonday: UIColor
    {
        UIColor(red: 193/255, green: 204/255, blue: 211/255, alpha: 1)
    }
    public class var day: UIColor
    {
        UIColor(red: 129/255, green: 137/255, blue: 144/255, alpha: 1)
    }
    public class var afterdark: UIColor
    {
        UIColor(red: 40/255, green: 40/255, blue: 45/255, alpha: 1)
    }
    public class var constant_red: UIColor
    {
        UIColor(red: 249/255, green: 66/255, blue: 65/255, alpha: 1)
    }
    public class var constant_green: UIColor
    {
        UIColor(red: 31/255, green: 186/255, blue: 102/255, alpha: 1)
    }
    public class var constant_orange: UIColor
    {
        UIColor(red: 255/255, green: 160/255, blue: 0/255, alpha: 1)
    }
    
    // MARK: - Lifecycle
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}

