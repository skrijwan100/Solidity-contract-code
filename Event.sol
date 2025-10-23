~// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract AllEvent {
    address[] public EventAddress;
    event addnewEvent(
        string event_name,
        string event_detils,
        string event_logo,
        string event_address,
        string event_fee,
        address indexed owner,
        address indexed enentaddress,
        uint256 indexed timestamp
    );

    function createEvent(
        string memory event_name,
        string memory event_detils,
        string memory event_logo,
        string memory event_address,
        string memory event_fee
    ) public {
        Event newEvent = new Event(
            event_name,
            event_detils,
            event_logo,
            event_address,
            event_fee,
            msg.sender
        );
        EventAddress.push(address(newEvent));
        emit addnewEvent(
            event_name,
            event_detils,
            event_logo,
            event_address,
            event_fee,
            msg.sender,
            address(newEvent),
            block.timestamp
        );
    }
}

contract Event {
    string public event_name;
    string public event_detils;
    string public event_logo;
    string public event_address;
    string public event_fee;
    address payable public event_owner;
    event bookdone(
        address indexed ticketuser,
        string indexed event_name,
        uint256 timestamp
    );

    constructor(
        string memory _event_name,
        string memory _event_detils,
        string memory _event_logo,
        string memory _event_address,
        string memory _event_fee,
        address _enent_owner
    ) {
        event_name = _event_name;
        event_detils = _event_detils;
        event_logo = _event_logo;
        event_address = _event_address;
        event_fee = _event_fee;
        event_owner = payable(_enent_owner);
    }

    function bookticket() public payable {
        
        event_owner.transfer(msg.value);
        emit bookdone(msg.sender, event_name, block.timestamp);
    }
}
