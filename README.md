## Developer notes

The project is implemented with *Clean Swift*/*VIP* architecture. Most essential parts are covered with *Unit Tests*.

The project is split in structured as follows:
- *Scenes*: 
    - contains all views and their respective VIP components
    - all components are instantiated through the factories
    - *Collection*:
        - collection view with all cards (by default only *Legendary Deathrattle* cards are shown)
    - *Details*:
        - detailed view of a card 
        
- *Services*:
    - *CollectionService*:
        - responsible for retrieving card collection
        - allows for filtering and ordering the output
    - *ImageService*:
        - responsible for fetching and caching images
    - *MetadataService*:
        - responsible for fetching, caching and persisting card metadata (such as card favorite status)
        
- *Network*:
    - Contains basic HTTP client with cancellation support
    
What can be improved:
- Even more test coverage
- The way image fetching cancellation handled during card cell reuse is flawed and might lead to race condition (although that is very unlikely)
- *MetadataService* protocol is called *MetadataProviding* which incorrectly describes that abstraction, since the service is also responsible for caching/persisting. It could be split into *MetadataProviding* and *MetadataStoring*

## Introduction

Hsiao here at Splendo is a very enthusiastic casual Hearthstone player. He is also a user of the KLM houses apps ([iOS](https://itunes.apple.com/nl/app/klm-houses/id371664245?l=en&mt=8) / [Android](https://play.google.com/store/apps/details?id=com.klm.mobile.houses&hl=en))

He wants you to build an app (iOS or Android) that has similar UI/UX. Similar way to go from the grid view to detail view, and also being able to scroll through the detail views like a carousel (hint: download the Houses app and have a look at how it works) but he wants the app to show Hearthstone card images.

We have supplied you with a json file (`cards.json`) containing all the Heartstone cards currently available.

Hsiao is especially interested in the app showing `Legendary` cards with the `Deathrattle Mechanic`, below are examples of such a cards :

```json
{
   "cardId": "FP1_014",
   "name": "Stalagg",
   "cardSet": "Naxxramas",
   "type": "Minion",
   "rarity": "Legendary",
   "cost": 5,
   "attack": 7,
   "health": 4,
   "text": "<b>Deathrattle:</b> If Feugen also died this game, summon Thaddius.",
   "flavor": "Stalagg want to write own flavor text.  \"STALAGG AWESOME!\"",
   "artist": "Dany Orizio",
   "collectible": true,
   "elite": true,
   "playerClass": "Neutral",
   "howToGet": "Unlocked in The Construct Quarter, in the Naxxramas adventure.",
   "howToGetGold": "Crafting unlocked in The Construct Quarter, in the Naxxramas adventure.",
   "img": "http://wow.zamimg.com/images/hearthstone/cards/enus/original/FP1_014.png",
   "imgGold": "http://wow.zamimg.com/images/hearthstone/cards/enus/animated/FP1_014_premium.gif",
   "locale": "enUS",
   "mechanics": [
     {
       "name": "Deathrattle"
     }
   ]
}
```

and

```json
{
   "cardId": "CFM_902",
   "name": "Aya Blackpaw",
   "cardSet": "Mean Streets of Gadgetzan",
   "type": "Minion",
   "rarity": "Legendary",
   "cost": 6,
   "attack": 5,
   "health": 3,
   "text": " <b>Battlecry and Deathrattle:</b> Summon a <b>Jade Golem</b>.",
   "flavor": "Though young, Aya took over as the leader of Jade Lotus through her charisma and strategic acumen when her predecessor was accidentally crushed by a jade golem.",
   "artist": "Glenn Rane",
   "collectible": true,
   "elite": true,
   "playerClass": "Neutral",
   "multiClassGroup": "Jade Lotus",
   "classes": [
     "Druid",
     "Rogue",
     "Shaman"
   ],
   "img": "http://media.services.zam.com/v1/media/byName/hs/cards/enus/CFM_902.png",
   "imgGold": "http://media.services.zam.com/v1/media/byName/hs/cards/enus/animated/CFM_902_premium.gif",
   "locale": "enUS",
   "mechanics": [
     {
       "name": "Jade Golem"
     },
     {
       "name": "Battlecry"
     },
     {
       "name": "Deathrattle"
     }
   ]
}
```

## Assignment

You are free to choose the patterns and architectures to create this app, the requirements are :

### App

* Create the app for iOS (Swift) or Android (Java or Kotlin).
* Show the card images in a grid like the houses app
* when user click on a grid item , navigate to the card detail view where you can display more information regarding the card ( what you would like to show and how is up to you ), when in detail view the navigation to the next and previous card should be the same as the Houses App
* The user should be able to set a card as favourite and this info should be persisted when the app closes, how to show cards that are tagged as favourites and how to persist that information is up to you
* You can load the Card by creating an API or by loading in the JSON file directly from memory. Ideally, this data provider should enable the following options, listed from easy to hard:
  * filter by least the following fields: `type`, `rarity`, `classes`, and `mechanics`
  * return sorted results (for example, alphabetically sorted), supporting both ascending and descending
  * (optional when using remote API) return the results by pages (based on a page size request parameter), iterating over the pages are maintained by a cursor which is included in the response, this cursor is used in the subsequent request.


## What we would like to see

* Proper handling of asynchonous calls
* Clean code
* Relevant design patterns
* Java/Swift/Kotlin best practices
* UI should remain responsive during content loading
* Should you use 3rd party libraries and frameworks please motivate your choice
* Unit tests
* Writing a backend using Google AppEngine is a huge plus.

## Finally

To submit your result, fork this repository. When you are satisfied with your result, create a Pull Request. If you created a backend, make sure it is up and running somewhere for the duration of the review and tell us in the comments where to find it.

Good Luck!
