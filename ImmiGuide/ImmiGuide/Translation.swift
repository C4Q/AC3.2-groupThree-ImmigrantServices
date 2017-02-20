//
//  Translation.swift
//  ImmiGuide
//
//  Created by Cris on 2/19/17.
//  Copyright © 2017 Madushani Lekam Wasam Liyanage. All rights reserved.
//

import Foundation

class Translation {
    enum TranslationLanguage: String {
        case Spanish, English, Chinese
    }
    
    static let supportVC: [String: Any] = [
        "Spanish" : [
            SupportProgramType.legalServices.rawValue : "Servicios Legales",
            SupportProgramType.domesticViolence.rawValue : "Abuso Domestico",
            SupportProgramType.immigrantFamilies.rawValue : "Familias Inmigrantes",
            SupportProgramType.legalAssistance.rawValue : "Servicios Legales",
            SupportProgramType.ndaImmigrants.rawValue : "Área de desarrollo de la vecindad (NDA)",
            SupportProgramType.youthServices.rawValue : "Servicios Para La Juventud",
            SupportProgramType.refugeeAssistance.rawValue : "Asistencia A Los Refugiados"
        ],
        "English" : [
            SupportProgramType.legalServices.rawValue : SupportProgramType.legalAssistance.rawValue,
            SupportProgramType.domesticViolence.rawValue : SupportProgramType.domesticViolence.rawValue,
            SupportProgramType.immigrantFamilies.rawValue : SupportProgramType.immigrantFamilies.rawValue,
            SupportProgramType.legalAssistance.rawValue : SupportProgramType.legalAssistance.rawValue,
            SupportProgramType.ndaImmigrants.rawValue : SupportProgramType.ndaImmigrants.rawValue,
            SupportProgramType.youthServices.rawValue : SupportProgramType.youthServices.rawValue,
            SupportProgramType.refugeeAssistance.rawValue : SupportProgramType.refugeeAssistance.rawValue
        ],
        "Chinese" : [
            SupportProgramType.legalServices.rawValue : "法律服務",
            SupportProgramType.domesticViolence.rawValue : "家庭暴力",
            SupportProgramType.immigrantFamilies.rawValue : "移民家庭",
            SupportProgramType.legalAssistance.rawValue : "法律援助",
            SupportProgramType.ndaImmigrants.rawValue : "鄰里開發區",
            SupportProgramType.youthServices.rawValue : "青年服務",
            SupportProgramType.refugeeAssistance.rawValue : "難民援助"
        ]
    ]
    
    static let programVC: [String : Any] = [
        "Spanish" : [
            "GED" : "GED",
            "Adolescent Literacy" : "Literatura de Adolescentes",
            "grades 6 to 8" : "Los Grados 6 a 8",
            "Adult Literacy" : "Leer, Escribir y Hablar en Inglés",
            "At least 16 Years Old or Older" : "Al menos 16 años de edad o más",
            "ESOL" : "Inglés como Segundo Idioma",
            "ESOL/Civics" : "ESOL/ Civics",
            "Family Literacy" : "Leer, Escribir y Hablar en Inglés para Familias",
            "A parent 16 Years Old or Older " : "Un padre de familia de 16 años o más"
        ],
        "English" : [
            "GED" : "GED",
            "Adolescent Literacy" : "Adolescent Literacy",
            "grades 6 to 8" : "grades 6 to 8",
            "Adult Literacy" :  "Adult Literacy",
            "At least 16 Years Old or Older" : "At least 16 Years Old or Older",
            "ESOL" : "ESOL",
            "ESOL/Civics" : "ESOL/Civics",
            "Family Literacy" : "Family Literacy",
            "A parent 16 Years Old or Older " : "A parent 16 Years Old or Older"
        ],
        "Chinese" : [
            "GED" : "GED",
            "Adolescent Literacy" : "青少年文化",
            "grades 6 to 8" : "六至八年級",
            "Adult Literacy" :  "成人文化",
            "At least 16 Years Old or Older" : "至少16歲或以上",
            "ESOL" : "英語作為第二語言",
            "ESOL/Civics" : "公民",
            "Family Literacy" : "家庭文化",
            "A parent 16 Years Old or Older " : "16歲或以上的父母"
        ]
    ]
    
}
