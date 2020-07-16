// This transaction is for transferring and NFT from 
// one account to another

import NonFungibleToken from 0x01cf0e2f2f715450
import Rockz from 0x179b6b1cb6755e31

transaction {

    prepare(signer: AuthAccount) {

        // Get the recipients public account object
        let recipient = getAccount(0x01cf0e2f2f715450)

        // Borrow a reference to the signers NFT collection
        let signerCollection = signer.borrow<&NonFungibleToken.Collection>(from: /storage/RockzCollection)
                                ?? panic("Unable to borrow a reference to the signer's NFT collection")

        // Borrow a reference to the receiver's public collection
        let receiverCollection = recipient.getCapability(/public/RockzCollection)!.borrow<&{NonFungibleToken.CollectionPublic}>()!

        // Withdraw the NFT from the signer's collection
        let nft <- signerCollection.withdraw(withdrawID: 1)

        // Deposit the NFT into the recipient's collection
        receiverCollection.deposit(token:<-nft)
    }
}
