import Foundation

struct Vocabulary {
    let words: [String]

    /// - returns: `count` unique, random words from `words`, guaranteed unsorted
    func selectRandomWords(count: Int) -> [String] {
        var newWords = Array(words.shuffled().prefix(count))
        // make sure that the words are not already sorted
        // (because the game is to put them in order, Don't want it already solved!)
        while newWords.sorted() == newWords {
            newWords.shuffle()
        }
        return newWords
    }
    
    static let icons: [String: String] = [
        "Bear": "🐻",
        "Crab": "🦀",
        "Duck": "🦆",
        "Frog": "🐸",
        "Fox": "🦊",
        "Goose": "🪿",
        "Horse": "🐴",
        "Jellyfish": "🪼",
        "Lizard": "🦎",
        "Octopus": "🐙",
        "Panda": "🐼",
        "Rabbit": "🐰",
        "Sheep": "🐑",
        "Whale": "🐳",
    ]
}

extension Vocabulary {
    static let landAnimals = Vocabulary(words: [
        "Bear",
        "Duck",
        "Frog",
        "Fox",
        "Goose",
        "Lizard",
        "Panda",
        "Rabbit",
        "Sheep",
    ])

    static let oceanAnimals = Vocabulary(words: [
        "Crab",
        "Jellyfish",
        "Octopus",
        "Whale",
    ])
}
