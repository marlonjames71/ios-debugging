//
//  EntryRepresentation.swift
//  JournalCoreData
//
//  Created by Spencer Curtis on 8/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

struct EntryRepresentation: Decodable {
    var title: String?
    var bodyText: String?
    var mood: String?
    var timestamp: Date?
    var identifier: String?

	enum EntryKeys: String, CodingKey {
		case title
		case bodyText
		case mood
		case timestamp
		case identifier
	}

	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: EntryKeys.self)

		title = try? container.decode(String.self, forKey: .title)
		bodyText = try? container.decode(String.self, forKey: .bodyText)
		mood = try? container.decode(String.self, forKey: .mood)
		timestamp = try? container.decode(Date.self, forKey: .timestamp)
		identifier = try? container.decode(String.self, forKey: .identifier)

//		let tempIdentifier = try? container.decode(Int.self, forKey: .identifier)
//
//		if identifier == tempIdentifier {
//			identifier = "\(tempIdentifier)"
//		} else {
//			identifier = try container.decode(String.self, forKey: .identifier)
//		}
	}
}



func ==(lhs: EntryRepresentation, rhs: Entry) -> Bool {
    return rhs.title == lhs.title &&
        rhs.bodyText == lhs.bodyText &&
        rhs.mood == lhs.mood &&
        rhs.identifier == lhs.identifier
}

func ==(lhs: Entry, rhs: EntryRepresentation) -> Bool {
    return rhs == lhs
}

func !=(lhs: EntryRepresentation, rhs: Entry) -> Bool {
    return !(lhs == rhs)
}

func !=(lhs: Entry, rhs: EntryRepresentation) -> Bool {
    return rhs != lhs
}
