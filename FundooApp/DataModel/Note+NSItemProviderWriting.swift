//
//  Note+NSItemProviderWriting.swift
//  FundooApp
//
//  Created by admin on 12/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

extension Note: NSItemProviderWriting {
    
    public static var writableTypeIdentifiersForItemProvider: [String] {
                []
        }
        
      public func loadData(withTypeIdentifier typeIdentifier: String, forItemProviderCompletionHandler completionHandler: @escaping (Data?, Error?) -> Void) -> Progress? {
          return nil
      }
       
}
