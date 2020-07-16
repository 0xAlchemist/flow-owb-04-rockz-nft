import NonFungibleToken from 0x01cf0e2f2f715450
import Rockz from 0x179b6b1cb6755e31

pub fun main(): Int {
    let acct = getAccount(0x179b6b1cb6755e31)
    let collectionRef = acct.getCapability(/public/RockzCollection)!.borrow<&{NonFungibleToken.CollectionPublic}>()
                            ?? panic("Could not borrow capability from public collection")
    let collectionLength = collectionRef.getIDs().length
    
    log(collectionLength)
    return collectionLength
}