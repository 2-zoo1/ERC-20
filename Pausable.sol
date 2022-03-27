// SPDX-License-Identifier: MIT

pragma solidity 0.8.13;

import "./Ownable.sol";

contract Pausable is Ownable {
  
    event Paused(address account);

    event Unpaused(address account);

    bool private _paused = false;

    function paused() public view returns (bool) {
        return _paused;
    }

    modifier whenNotPaused() {
        require(!paused(), "Pausable: paused");
        _;
    }

    modifier whenPaused() {
        require(paused(), "Pausable: not paused");
        _;
    }

    function _pause() public whenNotPaused onlyOwner{
        _paused = true;
        emit Paused(_msgSender());
    }

    function _unpause() public whenPaused onlyOwner{
        _paused = false;
        emit Unpaused(_msgSender());
    }
}