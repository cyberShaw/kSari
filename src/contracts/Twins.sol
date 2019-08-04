pragma solidity ^0.5.0;

contract Twins {
    // data structure that stores a user
    struct Twin {
        string name;
        string status;
        bool privilege;
    }

    Twin[] public twins;

    event newTwinRegistered(uint id);
    /**
     * Function to register a new user.
     *
     * @param _twinName 		The displaying name
     * @param _status        The status of the user
     */
    function addTwin(string memory _twinName, string memory _status, bool _privilege) private
    returns(uint)
    {
        uint userId = 0;

        // storing the new user details
        twins[userId] = Twin({
        	name: _twinName,
        	status: _status,
        	privilege: _privilege
        });
    }
    /**
     *
     * @param _twinName
     * @param _status
     * @param _privilege
     */
}


contract Main {
    struct user {
        uint user_id; //starts from 0
        uint privilege; // 1/0
        string data;
    }
    string public json1;
    string public json2;
    string public jsonElement;
    uint public userCount;
    mapping(uint => user) public users;
    constructor() public{
        json1 = '{"key1":"value1", "key2":"value2"}';
        json2 = '{"key1":"value3", "key2":"value4"}';
        addUserData(0, 1, json1);
        addUserData(1, 0, json2);
        letsParse(1, 0); //1 tries to read data of 0
    }
    function isPrivileged(uint user_id) public view returns(bool) {
        if(users[user_id].privilege == 1)
            return true;
        return false;
    }
    function readData(uint user_id1, uint user_id2) public view returns(bool, string memory) {
        if(isPrivileged(user_id1))
            return (true, users[user_id2].data);
        else {
            return (false, '{"ERROR":"ERROR"}');
        }
    }
    function letsParse(uint from, uint to) public {
        uint returnValue;
        JsmnSolLib.Token[] memory tokens;
        uint actualNum;
        bool ret;
        string memory file;
        (ret, file) = readData(from, to);
        if(ret) {
            (returnValue, tokens, actualNum) = JsmnSolLib.parse(file, 5);
            JsmnSolLib.Token memory t = tokens[0];
            jsonElement = JsmnSolLib.getBytes(file, t.start, t.end);
        }
    }
    function addUserData(uint id, uint pri, string memory sen) public{
        userCount++;
        users[id] = user(id, pri, sen);
    }
}