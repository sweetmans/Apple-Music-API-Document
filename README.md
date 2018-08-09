## Apple Music API Document

> If you want to help more people to see this document. Just give me the start.

> A web services API that lets you integrate streaming music with Apple Music content.

> From https://developer.apple.com

### The Main APIs

#### Fetch Storefronts
- [ ] [**Get a store front**](https://github.com/sweetmans/Apple-Music-API-Document#get-a-storefront)
- [ ] [**Get multiple storefronts**](https://github.com/sweetmans/Apple-Music-API-Document#get-a-storefront)
- [ ] [**Get all storefronts**](https://github.com/sweetmans/Apple-Music-API-Document#get-a-storefront)
- [ ] [**Get a user's storefront**](https://github.com/sweetmans/Apple-Music-API-Document#get-a-storefront)
#### Fetch Resources
- [ ] [**Catalog Resources**](https://github.com/sweetmans/Apple-Music-API-Document#get-a-storefront)
- [ ] [**Library Resources**](https://github.com/sweetmans/Apple-Music-API-Document#get-a-storefront)
#### Fetch Charts
- [ ] [**Get catalog charts**](https://github.com/sweetmans/Apple-Music-API-Document#get-a-storefront)
#### Fetch Genres
- [ ] [**Get a catalog genre**](https://github.com/sweetmans/Apple-Music-API-Document#get-a-storefront)
- [ ] [**Get multiple catalog genres**](https://github.com/sweetmans/Apple-Music-API-Document#get-a-storefront)
- [ ] [**Get catalog top charts genres**](https://github.com/sweetmans/Apple-Music-API-Document#get-a-storefront)
#### Search the Catalog
- [ ] [**Search for catalog resources**](https://github.com/sweetmans/Apple-Music-API-Document#get-a-storefront)
- [ ] [**Get catalog search hints**](https://github.com/sweetmans/Apple-Music-API-Document#get-a-storefront)
#### Search the Library
- [ ] [**Search for library resources**](https://github.com/sweetmans/Apple-Music-API-Document#get-a-storefront)
#### Fetch Recent History
- [ ] [**Get heavy rotation content**](https://github.com/sweetmans/Apple-Music-API-Document#get-a-storefront)
- [ ] [**Get recently played**](https://github.com/sweetmans/Apple-Music-API-Document#get-a-storefront)
- [ ] [**Get recent stations**](https://github.com/sweetmans/Apple-Music-API-Document#get-a-storefront)
- [ ] [**Get recently added**](https://github.com/sweetmans/Apple-Music-API-Document#get-a-storefront)
#### Modify Library and Library Playlists
- [ ] [**Add a resource to a library**](https://github.com/sweetmans/Apple-Music-API-Document#get-a-storefront)
- [ ] [**Create a new library playlist**](https://github.com/sweetmans/Apple-Music-API-Document#get-a-storefront)
- [ ] [**Add tracks to library playlist**](https://github.com/sweetmans/Apple-Music-API-Document#get-a-storefront)
#### Manage Ratings
- [ ] [**Catalog Ratings**](https://github.com/sweetmans/Apple-Music-API-Document#get-a-storefront)
- [ ] [**Library Ratings**](https://github.com/sweetmans/Apple-Music-API-Document#get-a-storefront)
#### Fetch Recommendations
- [ ] [**Get a recommendation**](https://github.com/sweetmans/Apple-Music-API-Document#get-a-storefront)
- [ ] [**Get multiple recommendations**](https://github.com/sweetmans/Apple-Music-API-Document#get-a-storefront)
- [ ] [**Get default recommendations**](https://github.com/sweetmans/Apple-Music-API-Document#get-a-storefront)
#### Object Models
- [ ] [**Apple Music API Objects**](https://github.com/sweetmans/Apple-Music-API-Document#get-a-storefront)
#### Endpoints
- [ ] [**Get a catalog genre's relationship directly by name**](https://github.com/sweetmans/Apple-Music-API-Document#get-a-storefront)

# Apple Music API Overview
The Apple Music API is the web services portion of MusicKit. Using the Apple Music API, you can access information about media—such as albums, songs, artists, and playlists—in the Apple Music catalog and in a user’s personal cloud library. If authorized by a user, you can also access or modify data associated with that user. For example, you can find music recommendations for the user or change their rating of a particular song, both in the catalog and in their library.

Requests to the Apple Music API are sent securely using HTTPS commands. All requests to the Apple Music API are associated with your app or website. A request includes a developer token that authenticates you as a trusted developer and member of the Apple Developer Program. Requests that access information for a specific user must also include a music user token that authorizes you to access that user’s information. See Getting Keys and Creating Tokens.

Responses are provided as JSON objects. Apple Music provides a rich object model with many predefined resource types. For example, the Album resource type specifies the data associated with an album. Resources in the Apple Music object model are often related to each other. For example, an album has artists, genres, and tracks, all of which are represented by other object types. See Handling Requests and Responses.

Apple Music is a worldwide service that operates in many countries and languages. However, the available content varies by region. In Apple Music, a region is called a storefront, and each storefront vends a different music catalog. In most cases, a request URL includes a storefront code that specifies which storefront the request should be routed to. For example, when you search for an album, the request specifies a storefront, and the response tells you whether that album is available in that storefront. Choose an appropriate storefront for the user’s location. For example, in an iOS app, you can call StoreKit to find out which storefront the user is logged in to on that device.

With localization, responses are automatically localized in an appropriate language for the storefront you select. Each storefront has a default language, but a storefront can support multiple languages. For example, the United States storefront supports both American English and Mexican Spanish. When you create a request, you can optionally specify that the response should be returned in one of the other languages instead. See Using Storefronts and Localizations.

The Apple Music API balances usefulness with processing time and bandwidth usage. By default, it might not provide all of the information in a single response. For example, when returning a resource that has relationships with other resources, some or all of the information about those relationships might be omitted. Similarly, if a request results in a large number of objects, Apple Music might return a subset of those objects in the initial response and ask you to make subsequent requests to get the rest of the data. If your app has specific needs, you can modify your request so that more information is returned in a single response. See Handling Relationships and Pagination.

## Before you do anything you should have developer token & user token.

### Generate Developer JWT see:
[Creating Token From Apple](https://developer.apple.com/documentation/applemusicapi/getting_keys_and_creating_tokens)

[Developer Token Generator](https://github.com/pelauimagineering/apple-music-token-generator)


### Request a user token within your app just use:


```swift
//Import Store Kit
import StoreKit

//At DispatchQueue.main call
requestUserToken(forDeveloperToken:completionHandler:)
```

## Handling Requests and Responses

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

### Handle a Response
The core document object that appears in a response is the ResponseRoot object. This object contains different arrays and groups of Resource objects, which contain the information requested about the artist, album, song, and so on.

If a request is successful, the HTTP status code in the response is in the 200 range. The body of the response contains either the requested array of resource objects in the data array or the result of the request as a map called results, where resource types are the members and the corresponding values are groups of resource objects. For example, if you fetch resources by type, the resource objects are contained in the data array of the ResponseRoot object. (For the common resource members, see Resource object and Relationship object.) If you successfully modify or delete resources, the status code is 204 and the body is empty.

If the status code indicates an error, the response may contain information in the errors array about one or more errors that occurred. The status code indicates the primary error, but you should examine the contents of the errors member of the Root object for details about individual errors. (See Error and HTTP Status Codes.)

### For example:

If the request is for an existing single resource object, the status code is 200 (OK) and the data array contains the requested resource object.

If the request is for a single resource object that doesn’t exist, the status code is 404 (Not Found) and the response doesn’t contain a data array.

If the request is for multiple resource objects by ID, the status code is 200 (OK) and the data array includes the existing resource objects.

If the request is for multiple resource objects by ID and none of the resources exist, the status code is 200 (OK) and the data array is empty.

If you make a successful request to an endpoint that returns results, the status code is 200 (OK) and the response includes the results object.

If the request isn’t supported as specified, the status code is 400 (Bad Request) and the errors array contains an error object for any identified problem.

If errors are encountered when the request is processed, the status code is in the 500 range and the errors array contains error objects for the errors that occurred.

## Using Storefronts and Localizations
> In Apple Music catalog requests, you specify the storefront in the path, and you can optionally specify a localization. A storefront is a country-specific geographical region. A localization is the translation of content into a language that also adapts to a region and culture. Each storefront supports a specific set of localizations.

Specify a Storefront
To get data specific to a territory, such as top charts in Mexico or content specifically licensed to the United Kingdom, specify a storefront. To get the possible storefront values, fetch all storefronts:

```javascript
GET https://api.music.apple.com/v1/storefronts
```
Choose the storefront you want to use, and pass the Storefront object’s id attribute as the storefront path parameter in subsequent requests. For example, use au as the storefront for Australia.

```json
{ 
    "attributes":{ 
        "defaultLanguageTag":"en-AU",
        "name":"Australia",
        "supportedLanguageTags":[ 
            "en-AU"
        ]
    },
    "href":"/v1/storefronts/au",
    "id":"au",
    "type":"storefronts"
}
```
### Specify a Localization
If you don't explicitly specify a localization for a storefront, or if the localization you specify isn't supported, the default for the territory is used. To request a localization other than the default, use the l query parameter:
```javascript
GET https://api.music.apple.com/v1/catalog/us/albums/310730204?l=es-MX
```

The value of the query parameter must be a supported localization (included in the supportedLanguageTags array). It’s unnecessary and not recommended to pass the storefront’s default localization, specified by the defaultLanguageTag attribute. For example, the United States (US) storefront’s default localization is American English (en-US) and is used if no localization is specified. However, you can specify Mexican Spanish (es-MX) as the localization.
```json
{
    "attributes":{
        "defaultLanguageTag":"en-US",
        "name":"United States",
        "supportedLanguageTags":[
            "en-US",
            "es-MX"
        ]
    },
    "href":"/v1/storefronts/us",
    "id":"us",
    "type":"storefronts"
}

```

###
Handling Relationships and Pagination
> You can fetch the resources and related objects your app needs in a single request. To get related objects, you fetch specific relationships along with the resource objects. If the query results contain too many objects, you can use pagination to fetch the next set of objects.

#### Fetch Resource Relationships
To reduce response sizes and improve performance, not all available relationships of a resource object—such as an album, song, playlist, or music video—are included by default. You can include additional related resources in the response by using the include query parameter.

There are three possible default behaviors for fetching resources in relationships:

The resources are included, with their attributes, as secondary resource objects.

The resources are included, without their attributes, as resource identifiers only.

The relationship is omitted from the response entirely and must be explicitly included.

> For example, these Album relationships have different default behaviors:

The tracks relationship includes the resource objects for the album’s songs and music videos, which are typically essential for working with albums.

The artists relationship only includes resource identifiers for the artist or artists associated with the album and excludes the attributes member in each resource object. This relationship allows you to easily link to an artist from an album, although some artist attributes are also attributes of the album.

The genres relationship is omitted by default. This relationship is seldom used, and the names of the genres already appear as an attribute of the album, genreNames.

See the corresponding object model reference for the default behavior of other objects.

Use the include parameter to include the resource objects for one or more available relationships in the response. The value of the include parameter is a comma-separated list of the relationship names. Relationships that include resource objects by default don’t have to be specified in the list; they’ll continue to be included along with the specified relationships. For example, when fetching an Artist object, you can request that the playlists objects be included:
```javascript
GET https://api.music.apple.com/v1/catalog/us/artists/462006?include=playlists
```

To fetch a relationship exclusively, specify the name of the relationship after the id path parameter. For example, fetch just the tracks belonging to an album:
```javascript
GET https://api.music.apple.com/v1/catalog/us/albums/310730204/tracks
```

Not all objects in a relationship are fetched by default. See the corresponding object model reference for the default fetch limits. To specify the number of objects fetched, use the limit resource parameter. For example, you can fetch an artist's first five albums:
```javascript
GET https://api.music.apple.com/v1/catalog/us/artists/462006/albums?limit=5
```

### Fetch Resources by Page
Some GET requests support pagination of the objects or an object’s relationships. If you specify a limit parameter, the number of resources returned is restricted to that limit. If no limit is supplied, the default limit is used. If you reach the limit to the number of resource objects in a response, the response contains a subset of the resource objects matching your criteria, and more requests are needed to get the rest of the objects.

See the corresponding resource’s object model for the default fetch limit. If there are more resource objects than permitted by the fetch limit, the ResponseRoot object contains a next member whose value is a subpath you use in the next request. The subpath contains the offset parameter that specifies the next page. Similarly, a Relationship object may contain a next member that you use to fetch more objects in a relationship.

For example, fetch all objects of a resource type, but specify the amount in the response by using the limit parameter:
```javascript
GET https://api.music.apple.com/v1/storefronts?limit=2
```

If there are more objects to fetch, the response contains a next member:
```json
{
    "data":[
        {
            "attributes":{
                "defaultLanguageTag":"en-gb",
                "name":"Anguilla",
                "supportedLanguageTags":[
                    "en-gb"
                ]
            },
            "href":"/v1/storefronts/ai",
            "id":"ai",
            "type":"storefronts"
        },
        {
            "attributes":{
                "defaultLanguageTag":"en-gb",
                "name":"Antigua and Barbuda",
                "supportedLanguageTags":[
                    "en-gb"
                ]
            },
            "href":"/v1/storefronts/ag",
            "id":"ag",
            "type":"storefronts"
        }
    ],
    "next":"/v1/storefronts?offset=2"
}
```

Pass the next subpath, and optionally, the limit parameter again, in the next request:
```javascript
GET https://api.music.apple.com/v1/storefronts?offset=2&limit=2
```

Continue requesting the resource objects until the next member no longer appears in the response.

# The Main API

## Get a storefront

> Fetch a single storefront using its identifier.

### URL
```javascript
GET https://api.music.apple.com/v1/storefronts/{id}
```
### Path Parameters

- [x] **id**: `String` (Required) The identifier (an ISO 3166 alpha-2 country code) for the 

### Query Parameters
- [x] **l**: `string` (Optional) The localization to use, specified by a language tag. Any supported language tag may be used here, if one is not specified then en-US is used.

### Response Codes
code:`200` | **OK**
------------ | -------------
Object | `Storefront`
Response Type | `Content-Type: application/json`

### Response
```javascript
GET https://api.music.apple.com/v1/storefronts/jp
```

```json
{
    "data": [
        {
            "attributes": {
                "defaultLanguageTag": "ja",
                "name": "Japan",
                "supportedLanguageTags": [
                    "ja",
                    "en-US"
                ]
            },
            "href": "/v1/storefronts/jp",
            "id": "jp",
            "type": "storefronts"
        }
    ]
}
```