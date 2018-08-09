## Apple Music API Document

> If you want to help more people to see this document. Just give me the start.

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

##### Generate Developer JWT see:
[Creating Token From Apple](https://developer.apple.com/documentation/applemusicapi/getting_keys_and_creating_tokens)

[Developer Token Generator](https://github.com/pelauimagineering/apple-music-token-generator)


##### Request a user token within your app just use:


```swift
//Import Store Kit
import StoreKit

//At DispatchQueue.main call
requestUserToken(forDeveloperToken:completionHandler:)
```

### Handling Requests and Responses

> After adding the developer token and music user token to the header, you're ready to compose your request to get data from the API.

Compose a Request
Apple Music API requests have common components. To compose a request, first specify the root path, ```https://api.music.apple.com/v1/```.

Follow this part of the path with either the catalog/ or library/ path parameter. The catalog path references the entire Apple Music library. The library path references your personal music library.

Follow this path with path parameters specific to the endpoint. For example, to request a genre, use this request:
```javascript
GET https://api.music.apple.com/v1/catalog/{storefront}/genres/{id}
```

Notice that the storefront is specified in the path for the genre request above. For an Apple Music catalog request, you explicitly include the storefront as part of your path. For personalized requests, the storefront is set implicitly by the user’s information and isn't part of the URL. For example, to get an album rating for a user, you use this request:
```javascript
GET https://api.music.apple.com/v1/me/ratings/albums/{id}
```

Notice the {id} part of the path. Every resource has a unique catalog identifier, but only resources added to your library have unique library identifiers. The catalog identifier for a particular resource is different from a library identifier for that same resource. After a resource has been removed from a library, its library identifier is deleted. A new one is generated if that resource is added back to that library.

For more about storefronts, see Using Storefronts and Localizations. Optionally, you can also customize requests so that you get the resources and related content needed for your app with a single request. To learn more about these features, see Handling Relationships and Pagination.

##### Handle a Response
The core document object that appears in a response is the ResponseRoot object. This object contains different arrays and groups of Resource objects, which contain the information requested about the artist, album, song, and so on.

If a request is successful, the HTTP status code in the response is in the 200 range. The body of the response contains either the requested array of resource objects in the data array or the result of the request as a map called results, where resource types are the members and the corresponding values are groups of resource objects. For example, if you fetch resources by type, the resource objects are contained in the data array of the ResponseRoot object. (For the common resource members, see Resource object and Relationship object.) If you successfully modify or delete resources, the status code is 204 and the body is empty.

If the status code indicates an error, the response may contain information in the errors array about one or more errors that occurred. The status code indicates the primary error, but you should examine the contents of the errors member of the Root object for details about individual errors. (See Error and HTTP Status Codes.)

##### For example:

If the request is for an existing single resource object, the status code is 200 (OK) and the data array contains the requested resource object.

If the request is for a single resource object that doesn’t exist, the status code is 404 (Not Found) and the response doesn’t contain a data array.

If the request is for multiple resource objects by ID, the status code is 200 (OK) and the data array includes the existing resource objects.

If the request is for multiple resource objects by ID and none of the resources exist, the status code is 200 (OK) and the data array is empty.

If you make a successful request to an endpoint that returns results, the status code is 200 (OK) and the response includes the results object.

If the request isn’t supported as specified, the status code is 400 (Bad Request) and the errors array contains an error object for any identified problem.

If errors are encountered when the request is processed, the status code is in the 500 range and the errors array contains error objects for the errors that occurred.


