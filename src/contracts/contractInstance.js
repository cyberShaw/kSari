import web3 from './web3'; 
const address = "0x692a70d2e424a56d2c6c27aa97d1a86395877b3a";
const abi = [
	{
		"constant": true,
		"inputs": [
			{
				"name": "",
				"type": "uint256"
			}
		],
		"name": "twins",
		"outputs": [
			{
				"name": "name",
				"type": "string"
			},
			{
				"name": "status",
				"type": "string"
			},
			{
				"name": "privilege",
				"type": "bool"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"name": "id",
				"type": "uint256"
			}
		],
		"name": "newTwinRegistered",
		"type": "event"
	}
]; 
export default new web3.eth.Contract(abi, address);


