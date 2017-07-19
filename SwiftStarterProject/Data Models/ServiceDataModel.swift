//
//  ServiceDataModel.swift
//  SwiftStarterProject
//
//  Created by Pandey on 18/07/17.
//  Copyright © 2017 Pandey. All rights reserved.
//

import Foundation
import Gloss

struct ITunesResultDataModel: Glossy {
    
    let artistId: Int?
    let artistName: String?
    let artistViewUrl: String?
    let artworkUrl100: String?
    let artworkUrl30: String?
    let artworkUrl60: String?
    let collectionArtistId: Int?
    let collectionArtistName: String?
    let collectionArtistViewUrl: String?
    let collectionCensoredName: String?
    let collectionExplicitness: String?
    let collectionId: Int?
    let collectionName: String?
    let collectionPrice: Int?
    let collectionViewUrl: String?
    let country: String?
    let currency: String?
    let discCount: Int?
    let discNumber: Int?
    let isStreamable: Bool?
    let kind: String?
    let previewUrl: String?
    let primaryGenreName: String?
    let releaseDate: String?
    let trackCensoredName: String?
    let trackCount: Int?
    let trackExplicitness: String?
    let trackId: Int?
    let trackName: String?
    let trackNumber: Int?
    let trackPrice: Int?
    let trackTimeMillis: Int?
    let trackViewUrl: String?
    let wrapperType: String?
    
    init?(json: JSON) {
        guard let artId: Int = "artistId" <~~ json else {
                return nil
        }
        
        artistId = artId
        artistName = "artistName" <~~ json
        artistViewUrl = "artistViewUrl" <~~ json
        artworkUrl100 = "artworkUrl100" <~~ json
        artworkUrl30 = "artworkUrl30" <~~ json
        artworkUrl60 = "artworkUrl60" <~~ json
        collectionArtistId = "collectionArtistId" <~~ json
        collectionArtistName = "collectionArtistName" <~~ json
        collectionArtistViewUrl = "collectionArtistViewUrl" <~~ json
        collectionCensoredName = "collectionCensoredName" <~~ json
        collectionExplicitness = "collectionExplicitness" <~~ json
        collectionId = "collectionId" <~~ json
        collectionName = "collectionName" <~~ json
        collectionPrice = "collectionPrice" <~~ json
        collectionViewUrl = "collectionViewUrl" <~~ json
        country = "country" <~~ json
        currency = "currency" <~~ json
        discCount = "discCount" <~~ json
        discNumber = "discNumber" <~~ json
        isStreamable = "isStreamable" <~~ json
        kind = "kind" <~~ json
        previewUrl = "previewUrl" <~~ json
        primaryGenreName = "primaryGenreName" <~~ json
        releaseDate = "releaseDate" <~~ json
        trackCensoredName = "trackCensoredName" <~~ json
        trackCount = "trackCount" <~~ json
        trackExplicitness = "trackExplicitness" <~~ json
        trackId = "trackId" <~~ json
        trackName = "trackName" <~~ json
        trackNumber = "trackNumber" <~~ json
        trackPrice = "trackPrice" <~~ json
        trackTimeMillis = "trackTimeMillis" <~~ json
        trackViewUrl = "trackViewUrl" <~~ json
        wrapperType = "wrapperType" <~~ json
    }
    
    // MARK: - Serialization
    func toJSON() -> JSON? {
        return jsonify([
            
            "artistId" ~~> self.artistId,
            "artistName" ~~> self.artistName,
            "artistViewUrl" ~~> self.artistViewUrl,
            "artworkUrl100" ~~> self.artworkUrl100,
            "artworkUrl30" ~~> self.artworkUrl30,
            "artworkUrl60" ~~> self.artworkUrl60,
            "collectionArtistId" ~~> self.collectionArtistId,
            "collectionArtistName" ~~> self.collectionArtistName,
            "collectionArtistViewUrl" ~~> self.collectionArtistViewUrl,
            "collectionCensoredName" ~~> self.collectionCensoredName,
            "collectionExplicitness" ~~> self.collectionExplicitness,
            "collectionId" ~~> self.collectionId,
            "collectionName" ~~> self.collectionName,
            "collectionPrice" ~~> self.collectionPrice,
            "collectionViewUrl" ~~> self.collectionViewUrl,
            "country" ~~> self.country,
            "currency" ~~> self.currency,
            "discCount" ~~> self.discCount,
            "discNumber" ~~> self.discNumber,
            "isStreamable" ~~> self.isStreamable,
            "kind" ~~> self.kind,
            "previewUrl" ~~> self.previewUrl,
            "primaryGenreName" ~~> self.primaryGenreName,
            "releaseDate" ~~> self.releaseDate,
            "trackCensoredName" ~~> self.trackCensoredName,
            "trackCount" ~~> self.trackCount,
            "trackExplicitness" ~~> self.trackExplicitness,
            "trackId" ~~> self.trackId,
            "trackName" ~~> self.trackName,
            "trackNumber" ~~> self.trackNumber,
            "trackPrice" ~~> self.trackPrice,
            "trackTimeMillis" ~~> self.trackTimeMillis,
            "trackViewUrl" ~~> self.trackViewUrl,
            "wrapperType" ~~> self.wrapperType,
            ])
    }

}
