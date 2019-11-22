pragma solidity ^0.5.1;

contract ProofOfExistence {  

  mapping (bytes32 => bool) private proofs;

  // store a proof of existence in the contract state
  function storeProof(bytes32 proof) private {
    proofs[proof] = true;
  }
  
  // calculate and store the proof for a document
  function notarize(string memory document) public payable {
    require(msg.value == 1 ether);  
    storeProof(proofFor(document));
  }
  
  // helper function to get a document's sha256
  function proofFor(string memory document) private 
  pure returns (bytes32) {
    return sha256(bytes(document));
  }
  
  // check if a document has been notarized
  function checkDocument(string memory document) public 
  view returns (bool) {
    return proofs[proofFor(document)];
  }  
}
