//
//  String.swift
//  Yuki
//
//  Created by Rémy Da Costa Faro on 24.10.19.
//

import Foundation

extension String {
  public var time: String {
    if Int(self) ?? 0 > 60 {
      let hour = (Int(self) ?? 0) / 60
      let minutes = (Int(self) ?? 0) % 60
      return "\(hour)h\(minutes < 10 ? "0\(minutes)" : "\(minutes)")"
    } else {
      return self
    }
  }
  
  static public func random(_ length: Int) -> String {
    let letters: NSString =
    "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_"
    let len = UInt32(letters.length)
    
    var randomString = ""
    
    for _ in 0 ..< length {
      let rand = arc4random_uniform(len)
      var nextChar = letters.character(at: Int(rand))
      randomString += NSString(characters: &nextChar, length: 1) as String
    }
    
    return randomString
  }
  
  public var escaped: String {
    self
      .folding(options: NSString.CompareOptions.diacriticInsensitive,
               locale: Locale.current)
      .replacingOccurrences(of: " ", with: "")
      .replacingOccurrences(of: "+", with: "")
      .replacingOccurrences(of: "-", with: "")
      .lowercased()
  }
  
  public var localized: String {
    return NSLocalizedString(self,
                             tableName: nil,
                             bundle: Bundle.main,
                             value: "",
                             comment: "")
  }
  
  public func score(word: String, fuzziness: Double? = nil) -> Double {
    // If the string is equal to the word, perfect match.
    if self == word {
      return 1
    }
    
    //if it's not a perfect match and is empty return 0
    if word.isEmpty || self.isEmpty {
      return 0
    }
    
    var
    runningScore = 0.0,
    charScore = 0.0,
    finalScore = 0.0,
    string = self,
    lString = string.lowercased(),
    strLength = string.count,
    lWord = word.lowercased(),
    wordLength = word.count,
    idxOf: String.Index!,
    startAt = lString.startIndex,
    fuzzies = 1.0,
    fuzzyFactor = 0.0,
    fuzzinessIsNil = true
    
    // Cache fuzzyFactor for speed increase
    if let fuzziness = fuzziness {
      fuzzyFactor = 1 - fuzziness
      fuzzinessIsNil = false
    }
    
    for i in 0 ..< wordLength {
      // Find next first case-insensitive match of word's i-th character.
      // The search in "string" begins at "startAt".
      
      if let range = lString.range(of:
        String(lWord[lWord.index(lWord.startIndex, offsetBy: i)] as Character),
                                   options: NSString.CompareOptions.caseInsensitive,
                                   range: (startAt..<lString.endIndex),
                                   locale: nil
        ) {
        // start index of word's i-th character in string.
        idxOf = range.lowerBound
        if startAt == idxOf {
          // Consecutive letter & start-of-string Bonus
          charScore = 0.7
        } else {
          charScore = 0.1
          
          // Acronym Bonus
          // Weighing Logic: Typing the first character of an acronym is as if you
          // preceded it with two perfect character matches.
          if string[string.index(idxOf, offsetBy: -1)] == " " {
            charScore += 0.8
          }
        }
      } else {
        // Character not found.
        if fuzzinessIsNil {
          // Fuzziness is nil. Return 0.
          return 0
        } else {
          fuzzies += fuzzyFactor
          continue
        }
      }
      
      // Same case bonus.
      if string[idxOf] == word[word.index(word.startIndex, offsetBy: i)] {
        charScore += 0.1
      }
      
      // Update scores and startAt position for next round of indexOf
      runningScore += charScore
      startAt = string.index(idxOf, offsetBy: 1)
    }
    
    // Reduce penalty for longer strings.
    finalScore = 0.5
      * (runningScore / Double(strLength) + runningScore / Double(wordLength))
      / fuzzies
    
    if (lWord[lWord.startIndex] == lString[lString.startIndex]),
      (finalScore < 0.85) {
      finalScore += 0.15
    }
    
    return finalScore
  }
}
