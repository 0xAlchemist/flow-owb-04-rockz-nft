// This transaction returns an array of all of the NFT ids in the collection

import NonFungibleToken from 0x01cf0e2f2f715450
import Rockz from 0x179b6b1cb6755e31

pub fun main(): [UInt64] {
    let acct = getAccount(0x179b6b1cb6755e31)
    let collectionRef = acct.getCapability(/public/RockzCollection)!.borrow<&{NonFungibleToken.CollectionPublic}>()
                            ?? panic("Unable to borrow capability from public collection")

    let ownedNFTs = collectionRef.getIDs()

    log(ownedNFTs)
    return ownedNFTs
}