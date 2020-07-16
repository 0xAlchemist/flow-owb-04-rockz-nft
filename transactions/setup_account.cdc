// This transaction is what an account would run
// to set itself up to receive NFTs

import NonFungibleToken from 0x01cf0e2f2f715450
import Rockz from 0x179b6b1cb6755e31

transaction {
    prepare(signer: AuthAccount) {

        // If the account doesn't already have a collection
        if signer.borrow<&Rockz.Collection>(from: /storage/RockzCollection) == nil {

            // Create a new empty Collection
            let collection <- Rockz.createEmptyCollection() as! @Rockz.Collection

            // Save it to the account
            signer.save(<-collection, to: /storage/RockzCollection)

            // Create a public capability for the collection
            signer.link<&{NonFungibleToken.CollectionPublic}>(/public/RockzCollection, target: /storage/RockzCollection)

        }
    }
}
