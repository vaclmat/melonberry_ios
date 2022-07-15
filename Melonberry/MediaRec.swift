//
//  MediaRec.swift
//  Melonberry
//
//  Created by Václav Matoušek on 14.12.2021.
//
///*
import Foundation

struct MediaRec: Codable, Equatable, Identifiable {
    let id: Int
    let date: String
    let date_gmt: String
//    let guid: R
    let modified: String
    let modified_gmt: String
    let slug: String
    let status: String
    let type: String
    let link: String
//    let title: R
    let author: Int
    let comment_status: String
    let ping_status: String
    let template: String
//    let meta: []?
//    let description: R
//    let caption: R
    let alt_text: String
    let media_type: String
    let mime_type: String
//    let media_details: MD
//    let post: Int
    let source_url: String
//    let _links: LD
    
    enum CodingKeys: String, CodingKey {
        case id
        case date
        case date_gmt
//        case guid
        case modified
        case modified_gmt
        case slug
        case status
        case type
        case link
//        case title
        case author
        case comment_status
        case ping_status
        case template
//        case description
//        case caption
        case alt_text
        case media_type
        case mime_type
//        case media_details
//        case post
        case source_url
//        case _links
    }
///*
    init(
        id: Int? = 1,
        date: String? = "",
        date_gmt: String? = "",
//        guid: R?,
        modified: String? = "",
        modified_gmt: String? = "",
        slug: String? = "",
        status: String? = "",
        type: String? = "",
        link: String? = "",
//        title: R?,
        author: Int? = 1,
        comment_status: String? = "",
        ping_status: String? = "",
        template: String? = "",
//        description: String? = "",
//        caption: R?,
        alt_text: String? = "",
        media_type: String? = "",
        mime_type: String? = "",
//        media_details: MD?,
//        post: Int? = 0,
        source_url: String? = ""
//        _links: LD?
    ) {
        self.id = id!
        self.date = date!
        self.date_gmt = date_gmt!
//        self.guid = guid!
        self.modified = modified!
        self.modified_gmt = modified_gmt!
        self.slug = slug!
        self.status = status!
        self.type = type!
        self.link = link!
//        self.title = title!
        self.author = author!
        self.comment_status = comment_status!
        self.ping_status = ping_status!
        self.template = template!
//        self.description = description!
//        self.caption = caption!
        self.alt_text = alt_text!
        self.media_type = media_type!
        self.mime_type = mime_type!
//        self.media_details = media_details!
//        self.post = post!
        self.source_url = source_url!
//        self._links = _links!
    }
//*/
}

struct R: Codable, Equatable {
    let rendered: String
    
    enum CodingKeys: String, CodingKey {
        case rendered
    }
    
    init(
    rendered: String? = ""
    ) {
        self.rendered = rendered!
    }
}

struct MD: Codable, Equatable {
    let filesize: Int
    let mime_type: String
    let length: Int
    let length_formatted: String
    let width: Int
    let height: Int
    let fileformat: String
    let dataformat: String
    let audio: AD
    let created_timestamp: Int
//    var sizes: {}
    
    enum CodingKeys: String, CodingKey {
        case filesize
        case mime_type
        case length
        case length_formatted
        case width
        case height
        case fileformat
        case dataformat
        case audio
        case created_timestamp
    }
///*
    init(
        filesize: Int? = 0,
        mime_type: String? = "",
        length: Int? = 0,
        length_formatted: String? = "",
        width: Int? = 0,
        height: Int? = 0,
        fileformat: String? = "",
        dataformat: String? = "",
        audio: AD?,
        created_timestamp: Int? = 0
    ) {
        self.filesize = filesize!
        self.mime_type = mime_type!
        self.length = length!
        self.length_formatted = length_formatted!
        self.width = width!
        self.height = height!
        self.fileformat = fileformat!
        self.dataformat = dataformat!
        self.audio = audio!
        self.created_timestamp = created_timestamp!
    }
 //*/
}

struct AD: Codable, Equatable {
        let dataformat: String
        let codec: String
        let sample_rate: Int
        let channels: Int
        let bits_per_sample: Int
        let lossless: Bool
        let channelmode: String
    
    enum CodingKeys: String, CodingKey {
        case dataformat
        case codec
        case sample_rate
        case channels
        case bits_per_sample
        case lossless
        case channelmode
    }
///*
    init(
        dataformat: String? = "",
        codec: String? = "",
        sample_rate: Int? = 0,
        channels: Int? = 0,
        bits_per_sample: Int? = 0,
        lossless: Bool? = false,
        channelmode: String? = ""
    ) {
        
        self.dataformat = dataformat!
        self.codec = codec!
        self.sample_rate = sample_rate!
        self.channels = channels!
        self.bits_per_sample = bits_per_sample!
        self.lossless = lossless!
        self.channelmode = channelmode!
    }
 //*/
}

struct LD: Codable, Equatable {
    let `self`: [ SD ]?
    let collection: [ SD ]?
    let about: [ SD ]?
    let author: [ ARD ]?
    let replies: [ ARD ]?
}

struct SD: Codable, Equatable {
    let href: String
    
    enum CodingKeys: String, CodingKey {
        case href
    }
    
    init(
    href: String? = ""
    ) {
        self.href = href!
    }
}

struct ARD: Codable, Equatable {
    let embeddable: Bool
    let href: String
    
    enum CodingKeys: String, CodingKey {
        case embeddable
        case href
    }
    
    init(embeddable: Bool? = false,
    href: String? = ""
    ) {
        
        self.embeddable = embeddable!
        self.href = href!
    }
}
//*/
/*
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct MediaRec: Codable {
    let id: Int
    let date, date_gmt: String
    let guid: Caption
    let modified, modified_gmt, slug, status: String
    let type: String
    let link: String
    let title: Caption
    let author: Int
    let comment_status, ping_status, template: String
    let meta: [JSONAny]
    let description, caption: Caption
    let alt_text, media_type, mime_type: String
    let media_details: MediaDetails
    let post: JSONNull?
    let source_url: String
    let _links: Links

    enum CodingKeys: String, CodingKey {
        case id, date
        case date_gmt
        case guid, modified
        case modified_gmt
        case slug, status, type, link, title, author
        case comment_status
        case ping_status
        case template, meta
        case description
        case caption
        case alt_text
        case media_type
        case mime_type
        case media_details
        case post
        case source_url
        case _links
    }
}

// MARK: - Caption
struct Caption: Codable {
    let rendered: String
}

// MARK: - Links
struct Links: Codable {
    let linksSelf, collection, about: [About]
    let author, replies: [Author]

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case collection, about, author, replies
    }
}

// MARK: - About
struct About: Codable {
    let href: String
}

// MARK: - Author
struct Author: Codable {
    let embeddable: Bool
    let href: String
}

// MARK: - MediaDetails
struct MediaDetails: Codable {
    let filesize: Int
    let mimeType: String
    let length: Int
    let lengthFormatted: String
    let width, height: Int
    let fileformat, dataformat: String
    let audio: Audio
    let createdTimestamp: Int
    let sizes: Sizes

    enum CodingKeys: String, CodingKey {
        case filesize
        case mimeType = "mime_type"
        case length
        case lengthFormatted = "length_formatted"
        case width, height, fileformat, dataformat, audio
        case createdTimestamp = "created_timestamp"
        case sizes
    }
}

// MARK: - Audio
struct Audio: Codable {
    let dataformat, codec: String
    let sampleRate, channels, bitsPerSample: Int
    let lossless: Bool
    let channelmode: String

    enum CodingKeys: String, CodingKey {
        case dataformat, codec
        case sampleRate = "sample_rate"
        case channels
        case bitsPerSample = "bits_per_sample"
        case lossless, channelmode
    }
}

// MARK: - Sizes
struct Sizes: Codable {
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
 */

