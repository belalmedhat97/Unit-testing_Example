//
//  ValidatorProtocols.swift
//  GameWO
//
//  Created by Belal medhat on 6/21/20.
//  Copyright © 2020 Belal medhat. All rights reserved.
//

import Foundation
protocol ValidateFunctions {
      func validateName(name: String) throws
      func validateEmail(email: String) throws
      func validatePassword(password: String) throws
      func ValidationPasswordRequiredFirst(Password:String) throws
      func validationConfirmPassword(Password:String,ConfirmPassword: String) throws
}
