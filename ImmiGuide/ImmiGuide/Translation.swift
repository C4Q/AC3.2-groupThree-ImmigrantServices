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
        case Spanish, English
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
            "Family Literacy" : "Leer, Escribir y Hablar en Inglés para Familias"
        ],
        "English" : [
            "GED" : "GED",
            "Adolescent Literacy" : "Adolescent Literacy",
            "grades 6 to 8" : "grades 6 to 8",
            "Adult Literacy" :  "Adult Literacy",
            "At least 16 Years Old or Older" : "At least 16 Years Old or Older",
            "ESOL" : "ESOL",
            "ESOL/Civics" : "ESOL/Civics",
            "Family Literacy" : "Family Literacy"
        ]
    ]
    
}
