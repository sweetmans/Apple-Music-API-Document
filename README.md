## Apple Music API Document

> A web services API that lets you integrate streaming music with Apple Music content.

> From https://developer.apple.com

### Overview
The Apple Music API is the web services portion of MusicKit. Using the Apple Music API, you can access information about media—such as albums, songs, artists, and playlists—in the Apple Music catalog and in a user’s personal cloud library. If authorized by a user, you can also access or modify data associated with that user. For example, you can find music recommendations for the user or change their rating of a particular song, both in the catalog and in their library.

Requests to the Apple Music API are sent securely using HTTPS commands. All requests to the Apple Music API are associated with your app or website. A request includes a developer token that authenticates you as a trusted developer and member of the Apple Developer Program. Requests that access information for a specific user must also include a music user token that authorizes you to access that user’s information. See Getting Keys and Creating Tokens.

Responses are provided as JSON objects. Apple Music provides a rich object model with many predefined resource types. For example, the Album resource type specifies the data associated with an album. Resources in the Apple Music object model are often related to each other. For example, an album has artists, genres, and tracks, all of which are represented by other object types. See Handling Requests and Responses.

Apple Music is a worldwide service that operates in many countries and languages. However, the available content varies by region. In Apple Music, a region is called a storefront, and each storefront vends a different music catalog. In most cases, a request URL includes a storefront code that specifies which storefront the request should be routed to. For example, when you search for an album, the request specifies a storefront, and the response tells you whether that album is available in that storefront. Choose an appropriate storefront for the user’s location. For example, in an iOS app, you can call StoreKit to find out which storefront the user is logged in to on that device.

With localization, responses are automatically localized in an appropriate language for the storefront you select. Each storefront has a default language, but a storefront can support multiple languages. For example, the United States storefront supports both American English and Mexican Spanish. When you create a request, you can optionally specify that the response should be returned in one of the other languages instead. See Using Storefronts and Localizations.

The Apple Music API balances usefulness with processing time and bandwidth usage. By default, it might not provide all of the information in a single response. For example, when returning a resource that has relationships with other resources, some or all of the information about those relationships might be omitted. Similarly, if a request results in a large number of objects, Apple Music might return a subset of those objects in the initial response and ask you to make subsequent requests to get the rest of the data. If your app has specific needs, you can modify your request so that more information is returned in a single response. See Handling Relationships and Pagination.

#### Before you do anything you should have developer token & user token.

##### Generate Developer jwt token see:
https://github.com/pelauimagineering/apple-music-token-generator

##### Request a user token within your app just use:


```swift
//Import Store Kit
import StoreKit

//At DispatchQueue.main call
requestUserToken(forDeveloperToken:completionHandler:)
```



