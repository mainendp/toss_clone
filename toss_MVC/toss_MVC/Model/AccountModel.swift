//
//  AccountModel.swift
//  toss_MVC
//
//  Created by 장창순 on 07/07/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import Foundation

struct Services {
    private var list = ["계좌","카드","투자","대출","자동차"]
    var listCount: Int {
        return list.count
    }
    func getServiceAt(_ at: Int) -> String {
        return list[at]
    }
}

struct Contact {
    let name: String
    let phoneNumber: String
    
    var getName: String {
        return name
    }
    
    var getPhoneNumber: String {
        return phoneNumber
    }
}

struct BankAccount {
    var bankName: String
    var accountNumber: String
    var bankLogo: String
    var userName: String
    var balance: String
    
    init(bankName: String, accountNumber: String, bankLogo: String, userName: String, balance: String) {
        self.bankName = bankName
        self.accountNumber = accountNumber
        self.bankLogo = bankLogo
        self.userName = userName
        self.balance = balance
    }
    
    init() {
        self.bankName = ""
        self.accountNumber = ""
        self.bankLogo = ""
        self.userName = ""
        self.balance = ""
    }
    
    var getBankName: String {
        return bankName
    }
    
    var getAccountNumber: String {
        return accountNumber
    }
    
    var getBankLogo: String {
        return bankLogo
    }
    
    var getUserName: String {
        return userName
    }
    
    var getBalance: String {
        return balance
    }
}

struct Reciever {
    var bankData: BankAccount
}

struct User {
    var userName: String
    var userBankAccount: [BankAccount]
    var contact: [Contact]
    
    var contactCount: Int {
        return contact.count
    }
    
    var userBankAccountCount: Int {
        return userBankAccount.count
    }
    
    var getUsername: String {
        return userName
    }
    
    init() {
        userName = "장창순"
        userBankAccount = [
            BankAccount(bankName: "토스머니", accountNumber: "010-3013-0663", bankLogo: "tossLogo", userName: userName, balance: "25000"),
            BankAccount(bankName: "KB국민은행", accountNumber: "0123456789", bankLogo: "kbLogo", userName: userName, balance: "5000000"),
            BankAccount(bankName: "카카오뱅크", accountNumber: "333311112222333", bankLogo: "kakaoLogo", userName: userName, balance: "30")
        ]
        contact = [
            Contact(name: "장창순", phoneNumber: "010-3013-0663"),
            Contact(name: "왓슨", phoneNumber: "010-12343-56783"),
            Contact(name: "라이프라인", phoneNumber: "010-43210-90876"),
            Contact(name: "블러드하운드", phoneNumber: "010-38483-28377"),
            Contact(name: "옥테인", phoneNumber: "010-58394-12384"),
            Contact(name: "레이스", phoneNumber: "010-59068-12783"),
            Contact(name: "코스틱", phoneNumber: "010-99999-434444"),
            Contact(name: "레버넌트", phoneNumber: "010-11111-22222"),
            Contact(name: "크립토", phoneNumber: "010-44222-46865"),
            Contact(name: "미라지", phoneNumber: "010-58483-27272"),
            Contact(name: "지브롤터", phoneNumber: "010-51223-77331"),
            Contact(name: "방갈로르", phoneNumber: "010-79721-11346"),
            Contact(name: "로바", phoneNumber: "010-97855-23566"),
            Contact(name: "패스파인더", phoneNumber: "010-68582-68678")
        ]
    }
    
    func getUserContactAt(_ at: Int) -> Contact {
        return contact[at]
    }
    
    func getUserBankAccountAt(_ at: Int) -> BankAccount {
        return userBankAccount[at]
    }
    
}
