pragma solidity 0.5.0;

contract KYC {
    // Model a person
    struct user {
        string phone_no;
        string name;
        // and any other user infromation 
    }

    // model a company

    struct company {
        address address_company;
        uint field;
        uint request_no;
        bool permission_1;
    }


    string output;

    // Store accounts that have requested for permission
    mapping(uint => company) public companies;
    // Store user
   
    mapping(uint => user) public users;
    // Store company Count
    uint public CompanyCount;


    constructor () public {
        adduser("user_1");
    }

    function adduser (string memory _name) private {
        users[0].name = _name;
    }


// add various fields

    function username (string memory _name) public {
        users[0].name = _name;
    }

    function userphone_no (string memory _phone) public {
        users[0].phone_no = _phone;
    } 


    function request (uint _field) public {
        
        CompanyCount ++;
        companies[CompanyCount].field = _field;
        companies[CompanyCount].request_no = CompanyCount; 
        companies[CompanyCount].address_company = msg.sender;       
    }

    function approval (bool _permission) public {
            companies[CompanyCount].permission_1 = _permission;
    }

// phone_no = 0;    name = 1	other fields to be given indexes so on (2,3,4.......);

    function display() public{
        if(companies[CompanyCount].permission_1){
            if (companies[CompanyCount].field == 1)
                output = users[0].name ;
            else { if (companies[CompanyCount].field == 0)
                output = users[0].phone_no;            

                else
                output = "invalid arguememt" ;
            }
        }
        else 
        output = "permission denied";
    }

}

