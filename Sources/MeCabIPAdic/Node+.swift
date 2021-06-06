//
//  Node+.swift
//  
//
//  Created by trickart on 2021/06/02.
//

import Foundation
import MeCab

extension Node {
    public enum PartOfSpeech: String, CustomDebugStringConvertible {
        case other = "その他"
        case filler = "フィラー"
        case interjection = "感動詞"
        case symbol = "記号"
        case adjective = "形容詞"
        case postPositionalParticle = "助詞"
        case auxiliaryVerb = "助動詞"
        case conjunction = "接続詞"
        case prefix = "接頭詞"
        case verb = "動詞"
        case adverb = "副詞"
        case noun = "名詞"
        case adnominalAdjective = "連体詞"

        public var debugDescription: String {
            self.rawValue
        }
    }

    public enum SymbolType: String {
        case alphabet = "アルファベット"
        case common = "一般"
        case openBrackets = "括弧開"
        case closeBrackets = "括弧閉"
        case period = "句点"
        case space = "空白"
        case comma = "読点"
    }

    override open var debugDescription: String {
        let part: String
        if let partOfSpeech = partOfSpeech {
            part = "\(partOfSpeech)"
        } else {
            part = "nil"
        }
        return "Node(surface: \(surface ?? "nil"), feature: \(feature ?? "nil"), partOfSpeech: \(part))"
    }

    open var features: [String] {
        guard let feature = feature else { return [] }
        return Array(feature.split(separator: ",").map { String($0) })
    }

    open var partOfSpeech: PartOfSpeech? {
        guard let firstFeature = features.first else { return nil }
        return PartOfSpeech(rawValue: firstFeature)
    }
}
